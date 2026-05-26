# Responsibility, Blame, and Moral Accountability
# Synthetic R workflow for modeling responsibility, blame, and accountability.
# Educational and reproducible research scaffold only.

suppressPackageStartupMessages({
  library(tidyverse)
  library(broom)
})

args <- commandArgs(trailingOnly = FALSE)
file_arg <- grep("^--file=", args, value = TRUE)

if (length(file_arg) > 0) {
  this_file <- normalizePath(sub("^--file=", "", file_arg[1]))
  article_root <- normalizePath(file.path(dirname(this_file), ".."))
} else {
  article_root <- getwd()
}

output_tables <- file.path(article_root, "outputs", "tables")
output_figures <- file.path(article_root, "outputs", "figures")

dir.create(output_tables, recursive = TRUE, showWarnings = FALSE)
dir.create(output_figures, recursive = TRUE, showWarnings = FALSE)

set.seed(42)

n <- 2400

df <- tibble(
  case_id = 1:n,
  control = rnorm(n, 0, 1),
  knowledge = rnorm(n, 0, 1),
  role_duty = rnorm(n, 0, 1),
  wrongness_severity = rnorm(n, 0, 1),
  motive_malice = rnorm(n, 0, 1),
  mitigating_excuse = rnorm(n, 0, 1),
  institutional_structure = rnorm(n, 0, 1),
  victim_recognition = rnorm(n, 0, 1),
  repair_capacity = rnorm(n, 0, 1),
  prevention_capacity = rnorm(n, 0, 1)
) |>
  mutate(
    responsibility =
      0.40 * control +
      0.35 * knowledge +
      0.25 * role_duty +
      rnorm(n, 0, 0.8),

    blame_latent =
      0.40 * responsibility +
      0.35 * wrongness_severity +
      0.25 * motive_malice -
      0.30 * mitigating_excuse +
      rnorm(n, 0, 0.8),

    blame_probability = plogis(blame_latent),
    blame_assigned = if_else(blame_probability >= 0.5, 1, 0),

    accountability_score =
      0.45 * responsibility +
      0.25 * institutional_structure +
      0.20 * wrongness_severity +
      0.20 * repair_capacity +
      0.15 * prevention_capacity +
      rnorm(n, 0, 0.8),

    accountability_quality =
      0.30 * accountability_score +
      0.25 * victim_recognition +
      0.25 * repair_capacity +
      0.25 * prevention_capacity +
      0.20 * institutional_structure +
      rnorm(n, 0, 0.8)
  )

model_blame <- glm(
  blame_assigned ~ responsibility + wrongness_severity +
    motive_malice + mitigating_excuse,
  data = df,
  family = binomial()
)

blame_summary <- tidy(
  model_blame,
  conf.int = TRUE,
  exponentiate = TRUE
)

blame_fit <- glance(model_blame)

model_accountability <- lm(
  accountability_score ~ responsibility + institutional_structure +
    wrongness_severity + repair_capacity + prevention_capacity,
  data = df
)

accountability_summary <- tidy(model_accountability, conf.int = TRUE)
accountability_fit <- glance(model_accountability)

model_quality <- lm(
  accountability_quality ~ accountability_score + victim_recognition +
    repair_capacity + prevention_capacity + institutional_structure,
  data = df
)

quality_summary <- tidy(model_quality, conf.int = TRUE)
quality_fit <- glance(model_quality)

responsibility_summary <- df |>
  mutate(
    responsibility_group = ntile(responsibility, 4),
    responsibility_group = factor(
      responsibility_group,
      labels = c("Low", "Lower-middle", "Upper-middle", "High")
    )
  ) |>
  group_by(responsibility_group) |>
  summarize(
    mean_blame_prob = mean(blame_probability),
    blame_rate = mean(blame_assigned),
    mean_accountability = mean(accountability_score),
    mean_accountability_quality = mean(accountability_quality),
    mean_excuse = mean(mitigating_excuse),
    .groups = "drop"
  )

pred_grid <- expand_grid(
  responsibility = seq(-2, 2, length.out = 100),
  mitigating_excuse = c(-1, 0, 1),
  wrongness_severity = 0,
  motive_malice = 0
)

pred_grid$predicted_blame_prob <- predict(
  model_blame,
  newdata = pred_grid,
  type = "response"
)

pred_grid <- pred_grid |>
  mutate(
    excuse_label = case_when(
      mitigating_excuse == -1 ~ "Low excuse",
      mitigating_excuse == 0 ~ "Average excuse",
      TRUE ~ "High excuse"
    )
  )

plot_blame <- ggplot(
  pred_grid,
  aes(x = responsibility, y = predicted_blame_prob)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ excuse_label) +
  labs(
    title = "Predicted Blame from Responsibility and Excuse",
    subtitle = "Mitigating excuses reduce blame without erasing accountability",
    x = "Responsibility",
    y = "Probability of blame"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "responsibility_blame_accountability_simulated_data.csv"))
write_csv(blame_summary, file.path(output_tables, "responsibility_blame_model.csv"))
write_csv(blame_fit, file.path(output_tables, "responsibility_blame_model_fit.csv"))
write_csv(accountability_summary, file.path(output_tables, "accountability_model.csv"))
write_csv(accountability_fit, file.path(output_tables, "accountability_model_fit.csv"))
write_csv(quality_summary, file.path(output_tables, "accountability_quality_model.csv"))
write_csv(quality_fit, file.path(output_tables, "accountability_quality_model_fit.csv"))
write_csv(responsibility_summary, file.path(output_tables, "responsibility_group_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "responsibility_blame_prediction_grid.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_blame_by_responsibility_and_excuse.png"),
  plot = plot_blame,
  width = 10,
  height = 6,
  dpi = 300
)

print(blame_summary)
print(accountability_summary)
print(quality_summary)
print(responsibility_summary)
