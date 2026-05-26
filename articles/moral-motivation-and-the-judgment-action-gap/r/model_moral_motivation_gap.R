# Moral Motivation and the Judgment–Action Gap
# Synthetic R workflow for modeling moral action under pressure.
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
  moral_judgment = rnorm(n, 0, 1),
  emotional_activation = rnorm(n, 0, 1),
  moral_identity = rnorm(n, 0, 1),
  self_regulation = rnorm(n, 0, 1),
  situational_pressure = rnorm(n, 0, 1),
  rationalization_tendency = rnorm(n, 0, 1),
  guilt_recognition = rnorm(n, 0, 1),
  humility = rnorm(n, 0, 1),
  accountability = rnorm(n, 0, 1),
  defensiveness = rnorm(n, 0, 1)
) |>
  mutate(
    action_latent =
      0.45 * moral_judgment +
      0.30 * emotional_activation +
      0.35 * moral_identity +
      0.40 * self_regulation -
      0.50 * situational_pressure -
      0.25 * rationalization_tendency +
      rnorm(n, 0, 0.8),

    moral_action_probability = plogis(action_latent),
    moral_action = if_else(moral_action_probability >= 0.5, 1, 0),

    judgment_action_gap = moral_judgment - moral_action,

    repair_capacity =
      0.35 * guilt_recognition +
      0.35 * humility +
      0.30 * accountability -
      0.40 * defensiveness -
      0.20 * rationalization_tendency +
      rnorm(n, 0, 0.8),

    pressure_band = case_when(
      situational_pressure < -0.75 ~ "Low pressure",
      situational_pressure < 0.25 ~ "Moderate pressure",
      situational_pressure < 1.0 ~ "High pressure",
      TRUE ~ "Very high pressure"
    ),

    gap_band = case_when(
      judgment_action_gap < -0.75 ~ "Action exceeds judgment score",
      judgment_action_gap < 0.25 ~ "Small gap",
      judgment_action_gap < 1.0 ~ "Moderate gap",
      TRUE ~ "Large gap"
    )
  )

model_action <- glm(
  moral_action ~ moral_judgment + emotional_activation +
    moral_identity + self_regulation + situational_pressure +
    rationalization_tendency,
  data = df,
  family = binomial()
)

action_results <- tidy(
  model_action,
  conf.int = TRUE,
  exponentiate = TRUE
)

action_fit <- glance(model_action)

model_gap <- lm(
  judgment_action_gap ~ emotional_activation + moral_identity +
    self_regulation + situational_pressure + rationalization_tendency,
  data = df
)

gap_results <- tidy(model_gap, conf.int = TRUE)
gap_fit <- glance(model_gap)

model_repair <- lm(
  repair_capacity ~ guilt_recognition + humility +
    accountability + defensiveness + rationalization_tendency,
  data = df
)

repair_results <- tidy(model_repair, conf.int = TRUE)
repair_fit <- glance(model_repair)

pressure_summary <- df |>
  group_by(pressure_band) |>
  summarize(
    mean_judgment = mean(moral_judgment),
    mean_emotion = mean(emotional_activation),
    mean_identity = mean(moral_identity),
    mean_self_regulation = mean(self_regulation),
    mean_pressure = mean(situational_pressure),
    mean_action_probability = mean(moral_action_probability),
    action_rate = mean(moral_action),
    mean_gap = mean(judgment_action_gap),
    .groups = "drop"
  )

gap_summary <- df |>
  group_by(gap_band) |>
  summarize(
    mean_judgment = mean(moral_judgment),
    mean_action_probability = mean(moral_action_probability),
    action_rate = mean(moral_action),
    mean_rationalization = mean(rationalization_tendency),
    mean_repair_capacity = mean(repair_capacity),
    .groups = "drop"
  )

pred_grid <- expand_grid(
  moral_judgment = seq(-2, 2, length.out = 120),
  situational_pressure = c(-1, 0, 1),
  emotional_activation = 0,
  moral_identity = 0,
  self_regulation = 0,
  rationalization_tendency = 0
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

plot_action <- ggplot(
  pred_grid,
  aes(x = moral_judgment, y = predicted_action_prob)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ pressure_label) +
  labs(
    title = "Predicted Moral Action from Judgment and Pressure",
    subtitle = "Strong judgment does not guarantee action under rising situational pressure",
    x = "Moral judgment",
    y = "Probability of moral action"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "moral_motivation_simulated_data.csv"))
write_csv(action_results, file.path(output_tables, "moral_motivation_action_model.csv"))
write_csv(action_fit, file.path(output_tables, "moral_motivation_action_model_fit.csv"))
write_csv(gap_results, file.path(output_tables, "moral_motivation_gap_model.csv"))
write_csv(gap_fit, file.path(output_tables, "moral_motivation_gap_model_fit.csv"))
write_csv(repair_results, file.path(output_tables, "moral_motivation_repair_model.csv"))
write_csv(repair_fit, file.path(output_tables, "moral_motivation_repair_model_fit.csv"))
write_csv(pressure_summary, file.path(output_tables, "moral_motivation_pressure_summary.csv"))
write_csv(gap_summary, file.path(output_tables, "moral_motivation_gap_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "moral_motivation_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_moral_action_judgment_pressure.png"),
  plot = plot_action,
  width = 10,
  height = 6,
  dpi = 300
)

print(action_results)
print(gap_results)
print(repair_results)
print(pressure_summary)
print(gap_summary)
