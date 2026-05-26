# Punishment, Forgiveness, and Moral Repair
# Synthetic R workflow for modeling post-wrong moral responses.
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
  wrongdoing_severity = rnorm(n, 0, 1),
  offender_responsibility = rnorm(n, 0, 1),
  norm_reaffirmation_need = rnorm(n, 0, 1),
  acknowledgment = rnorm(n, 0, 1),
  amends = rnorm(n, 0, 1),
  ongoing_threat = rnorm(n, 0, 1),
  restitution = rnorm(n, 0, 1),
  institutional_trust = rnorm(n, 0, 1),
  victim_recognition = rnorm(n, 0, 1),
  structural_reform = rnorm(n, 0, 1)
) |>
  mutate(
    punishment_score =
      0.40 * wrongdoing_severity +
      0.35 * offender_responsibility +
      0.25 * norm_reaffirmation_need +
      rnorm(n, 0, 0.8),

    forgiveness_latent =
      0.35 * acknowledgment +
      0.30 * amends -
      0.40 * ongoing_threat +
      0.15 * victim_recognition +
      rnorm(n, 0, 0.8),

    forgiveness_probability = plogis(forgiveness_latent),
    forgiveness = if_else(forgiveness_probability >= 0.5, 1, 0),

    moral_repair =
      0.20 * punishment_score +
      0.25 * forgiveness_probability +
      0.30 * restitution +
      0.30 * acknowledgment +
      0.25 * victim_recognition +
      0.20 * institutional_trust +
      0.25 * structural_reform -
      0.25 * ongoing_threat +
      rnorm(n, 0, 0.8)
  )

model_punishment <- lm(
  punishment_score ~ wrongdoing_severity + offender_responsibility +
    norm_reaffirmation_need,
  data = df
)

punishment_summary <- tidy(model_punishment, conf.int = TRUE)
punishment_fit <- glance(model_punishment)

model_forgiveness <- glm(
  forgiveness ~ acknowledgment + amends + ongoing_threat + victim_recognition,
  data = df,
  family = binomial()
)

forgiveness_summary <- tidy(
  model_forgiveness,
  conf.int = TRUE,
  exponentiate = TRUE
)

forgiveness_fit <- glance(model_forgiveness)

model_repair <- lm(
  moral_repair ~ punishment_score + forgiveness_probability +
    restitution + acknowledgment + victim_recognition +
    institutional_trust + structural_reform + ongoing_threat,
  data = df
)

repair_summary <- tidy(model_repair, conf.int = TRUE)
repair_fit <- glance(model_repair)

threat_summary <- df |>
  mutate(
    threat_group = ntile(ongoing_threat, 4),
    threat_group = factor(
      threat_group,
      labels = c("Low", "Lower-middle", "Upper-middle", "High")
    )
  ) |>
  group_by(threat_group) |>
  summarize(
    mean_punishment = mean(punishment_score),
    mean_forgiveness = mean(forgiveness_probability),
    mean_repair = mean(moral_repair),
    mean_acknowledgment = mean(acknowledgment),
    mean_restitution = mean(restitution),
    .groups = "drop"
  )

pred_grid <- expand_grid(
  acknowledgment = seq(-2, 2, length.out = 100),
  ongoing_threat = c(-1, 0, 1),
  amends = 0,
  victim_recognition = 0
)

pred_grid$predicted_forgiveness <- predict(
  model_forgiveness,
  newdata = pred_grid,
  type = "response"
)

pred_grid <- pred_grid |>
  mutate(
    threat_label = case_when(
      ongoing_threat == -1 ~ "Low ongoing threat",
      ongoing_threat == 0 ~ "Average ongoing threat",
      TRUE ~ "High ongoing threat"
    )
  )

plot_forgiveness <- ggplot(
  pred_grid,
  aes(x = acknowledgment, y = predicted_forgiveness)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ threat_label) +
  labs(
    title = "Predicted Forgiveness from Acknowledgment and Threat",
    subtitle = "Acknowledgment matters, but unresolved threat sharply constrains forgiveness",
    x = "Acknowledgment",
    y = "Probability of forgiveness"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "punishment_forgiveness_moral_repair_simulated_data.csv"))
write_csv(punishment_summary, file.path(output_tables, "punishment_model.csv"))
write_csv(punishment_fit, file.path(output_tables, "punishment_model_fit.csv"))
write_csv(forgiveness_summary, file.path(output_tables, "forgiveness_model.csv"))
write_csv(forgiveness_fit, file.path(output_tables, "forgiveness_model_fit.csv"))
write_csv(repair_summary, file.path(output_tables, "moral_repair_model.csv"))
write_csv(repair_fit, file.path(output_tables, "moral_repair_model_fit.csv"))
write_csv(threat_summary, file.path(output_tables, "threat_group_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "forgiveness_prediction_grid.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_forgiveness_by_acknowledgment_and_threat.png"),
  plot = plot_forgiveness,
  width = 10,
  height = 6,
  dpi = 300
)

print(punishment_summary)
print(forgiveness_summary)
print(repair_summary)
print(threat_summary)
