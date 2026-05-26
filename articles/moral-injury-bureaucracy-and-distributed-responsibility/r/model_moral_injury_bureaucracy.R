# Moral Injury, Bureaucracy, and Distributed Responsibility
# Synthetic R workflow for institutional moral-risk modeling.
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
  worker_id = 1:n,
  conscience_conflict = rnorm(n, 0, 1),
  institutional_betrayal = rnorm(n, 0, 1),
  distributed_responsibility = rnorm(n, 0, 1),
  morally_injurious_exposure = rnorm(n, 0, 1),
  scarcity_constraint = rnorm(n, 0, 1),
  accountability_clarity = rnorm(n, 0, 1),
  organizational_opacity = rnorm(n, 0, 1),
  protected_voice = rnorm(n, 0, 1),
  repair_capacity = rnorm(n, 0, 1)
) |>
  mutate(
    many_hands_pressure =
      0.50 * distributed_responsibility +
      0.35 * organizational_opacity -
      0.25 * accountability_clarity,

    moral_injury_latent =
      0.30 * conscience_conflict +
      0.30 * institutional_betrayal +
      0.25 * distributed_responsibility +
      0.30 * morally_injurious_exposure +
      0.20 * scarcity_constraint +
      0.20 * organizational_opacity -
      0.25 * accountability_clarity -
      0.20 * protected_voice -
      0.20 * repair_capacity +
      rnorm(n, 0, 0.8),

    moral_injury_risk = plogis(moral_injury_latent),
    elevated_moral_injury = if_else(moral_injury_risk >= 0.5, 1, 0)
  )

model_mi <- glm(
  elevated_moral_injury ~ conscience_conflict + institutional_betrayal +
    distributed_responsibility + morally_injurious_exposure +
    scarcity_constraint + organizational_opacity +
    accountability_clarity + protected_voice + repair_capacity,
  data = df,
  family = binomial()
)

mi_summary <- tidy(model_mi, conf.int = TRUE, exponentiate = TRUE)
mi_fit <- glance(model_mi)

pred_grid <- expand_grid(
  institutional_betrayal = seq(-2, 2, length.out = 100),
  accountability_clarity = c(-1, 0, 1),
  distributed_responsibility = c(-1, 0, 1),
  conscience_conflict = 0,
  morally_injurious_exposure = 0,
  scarcity_constraint = 0,
  organizational_opacity = 0,
  protected_voice = 0,
  repair_capacity = 0
)

pred_grid$predicted_mi_risk <- predict(
  model_mi,
  newdata = pred_grid,
  type = "response"
)

pred_grid <- pred_grid |>
  mutate(
    accountability_label = case_when(
      accountability_clarity == -1 ~ "Low accountability clarity",
      accountability_clarity == 0 ~ "Average accountability clarity",
      TRUE ~ "High accountability clarity"
    ),
    distribution_label = case_when(
      distributed_responsibility == -1 ~ "Low distributed responsibility",
      distributed_responsibility == 0 ~ "Average distributed responsibility",
      TRUE ~ "High distributed responsibility"
    )
  )

accountability_summary <- df |>
  mutate(
    accountability_band = ntile(accountability_clarity, 4),
    accountability_band = factor(
      accountability_band,
      labels = c("Low", "Lower-middle", "Upper-middle", "High")
    )
  ) |>
  group_by(accountability_band) |>
  summarize(
    mean_mi_risk = mean(moral_injury_risk),
    elevated_rate = mean(elevated_moral_injury),
    mean_betrayal = mean(institutional_betrayal),
    mean_distribution = mean(distributed_responsibility),
    mean_many_hands_pressure = mean(many_hands_pressure),
    mean_repair_capacity = mean(repair_capacity),
    .groups = "drop"
  )

plot_predicted_risk <- ggplot(
  pred_grid,
  aes(x = institutional_betrayal, y = predicted_mi_risk)
) +
  geom_line(linewidth = 1) +
  facet_grid(distribution_label ~ accountability_label) +
  labs(
    title = "Predicted Moral Injury Risk in Bureaucratic Settings",
    subtitle = "Institutional betrayal raises risk, especially when accountability is unclear and responsibility is distributed",
    x = "Institutional betrayal",
    y = "Predicted moral injury risk"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "moral_injury_bureaucracy_simulated_data.csv"))
write_csv(mi_summary, file.path(output_tables, "moral_injury_bureaucracy_model.csv"))
write_csv(mi_fit, file.path(output_tables, "moral_injury_bureaucracy_model_fit.csv"))
write_csv(pred_grid, file.path(output_tables, "moral_injury_bureaucracy_predictions.csv"))
write_csv(accountability_summary, file.path(output_tables, "moral_injury_bureaucracy_accountability_summary.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_moral_injury_risk_bureaucracy.png"),
  plot = plot_predicted_risk,
  width = 12,
  height = 8,
  dpi = 300
)

print(mi_summary)
print(accountability_summary)
