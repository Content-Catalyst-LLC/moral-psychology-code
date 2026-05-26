# Moral Psychology in Organizations and Institutions
# Synthetic R workflow for organizational ethical-risk modeling.
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
  employee_id = 1:n,
  ethical_sensitivity = rnorm(n, 0, 1),
  role_constraint = rnorm(n, 0, 1),
  cultural_climate = rnorm(n, 0, 1),
  performance_pressure = rnorm(n, 0, 1),
  hierarchy_intensity = rnorm(n, 0, 1),
  diffusion_responsibility = rnorm(n, 0, 1),
  accountability_strength = rnorm(n, 0, 1),
  speak_up_protection = rnorm(n, 0, 1),
  value_alignment = rnorm(n, 0, 1),
  corruption_pressure = rnorm(n, 0, 1)
) |>
  mutate(
    moral_decision_tendency =
      0.35 * ethical_sensitivity -
      0.25 * role_constraint +
      0.30 * cultural_climate -
      0.30 * performance_pressure +
      0.25 * speak_up_protection +
      0.25 * value_alignment +
      rnorm(n, 0, 0.8),

    unethical_latent =
      0.35 * performance_pressure +
      0.25 * hierarchy_intensity +
      0.30 * diffusion_responsibility -
      0.40 * accountability_strength -
      0.25 * cultural_climate -
      0.20 * speak_up_protection -
      0.25 * value_alignment +
      0.30 * corruption_pressure +
      rnorm(n, 0, 0.8),

    unethical_probability = plogis(unethical_latent),
    unethical_action = if_else(unethical_probability >= 0.5, 1, 0),

    institutional_integrity =
      0.30 * accountability_strength +
      0.30 * speak_up_protection +
      0.30 * value_alignment +
      0.20 * cultural_climate -
      0.30 * corruption_pressure -
      0.20 * diffusion_responsibility +
      rnorm(n, 0, 0.8)
  )

model_unethical <- glm(
  unethical_action ~ performance_pressure + hierarchy_intensity +
    diffusion_responsibility + accountability_strength + cultural_climate +
    speak_up_protection + value_alignment + corruption_pressure,
  data = df,
  family = binomial()
)

unethical_summary <- tidy(model_unethical, conf.int = TRUE, exponentiate = TRUE)
unethical_fit <- glance(model_unethical)

model_integrity <- lm(
  institutional_integrity ~ accountability_strength + speak_up_protection +
    value_alignment + cultural_climate + corruption_pressure +
    diffusion_responsibility,
  data = df
)

integrity_summary <- tidy(model_integrity, conf.int = TRUE)

pred_grid <- expand_grid(
  performance_pressure = seq(-2, 2, length.out = 100),
  accountability_strength = c(-1, 0, 1),
  hierarchy_intensity = 0,
  diffusion_responsibility = 0,
  cultural_climate = 0,
  speak_up_protection = 0,
  value_alignment = 0,
  corruption_pressure = 0
)

pred_grid$predicted_unethical_prob <- predict(
  model_unethical,
  newdata = pred_grid,
  type = "response"
)

pred_grid <- pred_grid |>
  mutate(
    accountability_label = case_when(
      accountability_strength == -1 ~ "Low accountability",
      accountability_strength == 0 ~ "Average accountability",
      TRUE ~ "High accountability"
    )
  )

accountability_summary <- df |>
  mutate(
    accountability_band = ntile(accountability_strength, 4),
    accountability_band = factor(
      accountability_band,
      labels = c("Low", "Lower-middle", "Upper-middle", "High")
    )
  ) |>
  group_by(accountability_band) |>
  summarize(
    mean_unethical_prob = mean(unethical_probability),
    unethical_rate = mean(unethical_action),
    mean_pressure = mean(performance_pressure),
    mean_diffusion = mean(diffusion_responsibility),
    mean_integrity = mean(institutional_integrity),
    mean_value_alignment = mean(value_alignment),
    .groups = "drop"
  )

plot_unethical <- ggplot(
  pred_grid,
  aes(x = performance_pressure, y = predicted_unethical_prob)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ accountability_label) +
  labs(
    title = "Predicted Unethical Action in Organizations",
    subtitle = "Performance pressure raises risk, but accountability changes the curve",
    x = "Performance pressure",
    y = "Probability of unethical action"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "moral_psychology_organizations_simulated_data.csv"))
write_csv(unethical_summary, file.path(output_tables, "moral_psychology_organizations_unethical_model.csv"))
write_csv(unethical_fit, file.path(output_tables, "moral_psychology_organizations_unethical_model_fit.csv"))
write_csv(integrity_summary, file.path(output_tables, "moral_psychology_organizations_integrity_model.csv"))
write_csv(accountability_summary, file.path(output_tables, "moral_psychology_organizations_accountability_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "moral_psychology_organizations_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_unethical_action_by_accountability.png"),
  plot = plot_unethical,
  width = 10,
  height = 6,
  dpi = 300
)

print(unethical_summary)
print(integrity_summary)
print(accountability_summary)
