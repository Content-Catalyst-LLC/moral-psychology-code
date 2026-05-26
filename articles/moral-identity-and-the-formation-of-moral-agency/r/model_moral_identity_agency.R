# Moral Identity and the Formation of Moral Agency
# Synthetic R workflow for modeling moral identity, action, and repair.
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
  internalization = rnorm(n, 0, 1),
  symbolization = rnorm(n, 0, 1),
  narrative_integration = rnorm(n, 0, 1),
  norm_integration = rnorm(n, 0, 1),
  moral_judgment = rnorm(n, 0, 1),
  self_regulatory_capacity = rnorm(n, 0, 1),
  situational_pressure = rnorm(n, 0, 1),
  guilt_recognition = rnorm(n, 0, 1),
  humility = rnorm(n, 0, 1),
  accountability = rnorm(n, 0, 1),
  defensiveness = rnorm(n, 0, 1)
) |>
  mutate(
    moral_identity =
      0.50 * internalization +
      0.22 * symbolization +
      0.35 * narrative_integration +
      0.30 * norm_integration +
      rnorm(n, 0, 0.8),

    action_latent =
      0.35 * moral_judgment +
      0.45 * moral_identity +
      0.30 * self_regulatory_capacity -
      0.40 * situational_pressure +
      rnorm(n, 0, 0.8),

    moral_action_probability = plogis(action_latent),
    moral_action = if_else(moral_action_probability >= 0.5, 1, 0),

    repair_capacity =
      0.35 * guilt_recognition +
      0.35 * humility +
      0.30 * accountability -
      0.45 * defensiveness +
      0.20 * moral_identity +
      rnorm(n, 0, 0.8),

    pressure_band = case_when(
      situational_pressure < -0.75 ~ "Low pressure",
      situational_pressure < 0.25 ~ "Moderate pressure",
      situational_pressure < 1.0 ~ "High pressure",
      TRUE ~ "Very high pressure"
    ),

    defensiveness_band = case_when(
      defensiveness < -0.75 ~ "Low defensiveness",
      defensiveness < 0.25 ~ "Moderate defensiveness",
      defensiveness < 1.0 ~ "High defensiveness",
      TRUE ~ "Very high defensiveness"
    )
  )

model_identity <- lm(
  moral_identity ~ internalization + symbolization +
    narrative_integration + norm_integration,
  data = df
)

identity_results <- tidy(model_identity, conf.int = TRUE)
identity_fit <- glance(model_identity)

model_action <- glm(
  moral_action ~ moral_judgment + moral_identity +
    self_regulatory_capacity + situational_pressure,
  data = df,
  family = binomial()
)

action_results <- tidy(
  model_action,
  conf.int = TRUE,
  exponentiate = TRUE
)

action_fit <- glance(model_action)

model_repair <- lm(
  repair_capacity ~ guilt_recognition + humility +
    accountability + defensiveness + moral_identity,
  data = df
)

repair_results <- tidy(model_repair, conf.int = TRUE)
repair_fit <- glance(model_repair)

pressure_summary <- df |>
  group_by(pressure_band) |>
  summarize(
    mean_identity = mean(moral_identity),
    mean_judgment = mean(moral_judgment),
    mean_self_regulation = mean(self_regulatory_capacity),
    mean_pressure = mean(situational_pressure),
    mean_action_probability = mean(moral_action_probability),
    action_rate = mean(moral_action),
    .groups = "drop"
  )

defensiveness_summary <- df |>
  group_by(defensiveness_band) |>
  summarize(
    mean_guilt_recognition = mean(guilt_recognition),
    mean_humility = mean(humility),
    mean_accountability = mean(accountability),
    mean_defensiveness = mean(defensiveness),
    mean_repair_capacity = mean(repair_capacity),
    .groups = "drop"
  )

pred_grid <- expand_grid(
  moral_identity = seq(-2, 2, length.out = 120),
  situational_pressure = c(-1, 0, 1),
  moral_judgment = 0,
  self_regulatory_capacity = 0
)

pred_grid$predicted_action_prob <- predict(
  model_action,
  newdata = pred_grid,
  type = "response"
)

pred_grid <- pred_grid |>
  mutate(
    pressure_label = case_when(
      situational_pressure == -1 ~ "Low pressure",
      situational_pressure == 0 ~ "Average pressure",
      TRUE ~ "High pressure"
    )
  )

plot_identity <- ggplot(
  pred_grid,
  aes(x = moral_identity, y = predicted_action_prob)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ pressure_label) +
  labs(
    title = "Predicted Moral Action from Moral Identity",
    subtitle = "Stronger moral identity can help sustain action under pressure",
    x = "Moral identity",
    y = "Probability of moral action"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "moral_identity_simulated_data.csv"))
write_csv(identity_results, file.path(output_tables, "moral_identity_structure_model.csv"))
write_csv(identity_fit, file.path(output_tables, "moral_identity_structure_model_fit.csv"))
write_csv(action_results, file.path(output_tables, "moral_identity_action_model.csv"))
write_csv(action_fit, file.path(output_tables, "moral_identity_action_model_fit.csv"))
write_csv(repair_results, file.path(output_tables, "moral_identity_repair_model.csv"))
write_csv(repair_fit, file.path(output_tables, "moral_identity_repair_model_fit.csv"))
write_csv(pressure_summary, file.path(output_tables, "moral_identity_pressure_summary.csv"))
write_csv(defensiveness_summary, file.path(output_tables, "moral_identity_defensiveness_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "moral_identity_action_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_moral_action_identity_pressure.png"),
  plot = plot_identity,
  width = 10,
  height = 6,
  dpi = 300
)

print(identity_results)
print(action_results)
print(repair_results)
print(pressure_summary)
print(defensiveness_summary)
