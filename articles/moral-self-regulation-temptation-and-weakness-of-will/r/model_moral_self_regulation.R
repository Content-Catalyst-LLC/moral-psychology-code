# Moral Self-Regulation, Temptation, and Weakness of Will
# Synthetic R workflow for modeling moral action under temptation and fatigue.
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
  temptation_intensity = rnorm(n, 0, 1),
  fatigue = rnorm(n, 0, 1),
  situational_pressure = rnorm(n, 0, 1),
  self_regulatory_capacity = rnorm(n, 0, 1),
  moral_identity = rnorm(n, 0, 1),
  rationalization_tendency = rnorm(n, 0, 1),
  guilt_recognition = rnorm(n, 0, 1),
  humility = rnorm(n, 0, 1),
  accountability = rnorm(n, 0, 1),
  defensiveness = rnorm(n, 0, 1)
) |>
  mutate(
    action_latent =
      0.40 * moral_judgment +
      0.35 * self_regulatory_capacity +
      0.25 * moral_identity -
      0.45 * temptation_intensity -
      0.30 * fatigue -
      0.35 * situational_pressure -
      0.25 * rationalization_tendency +
      rnorm(n, 0, 0.8),

    moral_action_probability = plogis(action_latent),
    moral_action = if_else(moral_action_probability >= 0.5, 1, 0),

    weakness_of_will =
      moral_judgment - moral_action,

    repair_capacity =
      0.35 * guilt_recognition +
      0.35 * humility +
      0.30 * accountability -
      0.40 * defensiveness -
      0.20 * rationalization_tendency +
      rnorm(n, 0, 0.8),

    temptation_band = case_when(
      temptation_intensity < -0.75 ~ "Low temptation",
      temptation_intensity < 0.25 ~ "Moderate temptation",
      temptation_intensity < 1.0 ~ "High temptation",
      TRUE ~ "Very high temptation"
    ),

    fatigue_band = case_when(
      fatigue < -0.75 ~ "Low fatigue",
      fatigue < 0.25 ~ "Moderate fatigue",
      fatigue < 1.0 ~ "High fatigue",
      TRUE ~ "Very high fatigue"
    )
  )

model_action <- glm(
  moral_action ~ moral_judgment + temptation_intensity +
    fatigue + situational_pressure +
    self_regulatory_capacity + moral_identity +
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

model_weakness <- lm(
  weakness_of_will ~ temptation_intensity + fatigue +
    situational_pressure + self_regulatory_capacity +
    moral_identity + rationalization_tendency,
  data = df
)

weakness_results <- tidy(model_weakness, conf.int = TRUE)
weakness_fit <- glance(model_weakness)

model_repair <- lm(
  repair_capacity ~ guilt_recognition + humility +
    accountability + defensiveness + rationalization_tendency,
  data = df
)

repair_results <- tidy(model_repair, conf.int = TRUE)
repair_fit <- glance(model_repair)

temptation_summary <- df |>
  group_by(temptation_band) |>
  summarize(
    mean_judgment = mean(moral_judgment),
    mean_regulation = mean(self_regulatory_capacity),
    mean_identity = mean(moral_identity),
    mean_temptation = mean(temptation_intensity),
    mean_action_probability = mean(moral_action_probability),
    action_rate = mean(moral_action),
    mean_weakness = mean(weakness_of_will),
    .groups = "drop"
  )

fatigue_summary <- df |>
  group_by(fatigue_band) |>
  summarize(
    mean_fatigue = mean(fatigue),
    mean_pressure = mean(situational_pressure),
    mean_rationalization = mean(rationalization_tendency),
    mean_action_probability = mean(moral_action_probability),
    action_rate = mean(moral_action),
    mean_repair_capacity = mean(repair_capacity),
    .groups = "drop"
  )

pred_grid <- expand_grid(
  temptation_intensity = seq(-2, 2, length.out = 120),
  self_regulatory_capacity = c(-1, 0, 1),
  moral_judgment = 1,
  fatigue = 0,
  situational_pressure = 0,
  moral_identity = 0,
  rationalization_tendency = 0
)

pred_grid$predicted_action_prob <- predict(
  model_action,
  newdata = pred_grid,
  type = "response"
)

pred_grid <- pred_grid |>
  mutate(
    regulation_label = case_when(
      self_regulatory_capacity == -1 ~ "Low self-regulation",
      self_regulatory_capacity == 0 ~ "Average self-regulation",
      TRUE ~ "High self-regulation"
    )
  )

plot_action <- ggplot(
  pred_grid,
  aes(x = temptation_intensity, y = predicted_action_prob)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ regulation_label) +
  labs(
    title = "Predicted Moral Action Under Temptation",
    subtitle = "Higher self-regulation weakens the effect of temptation on moral failure",
    x = "Temptation intensity",
    y = "Probability of moral action"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "moral_self_regulation_simulated_data.csv"))
write_csv(action_results, file.path(output_tables, "moral_self_regulation_action_model.csv"))
write_csv(action_fit, file.path(output_tables, "moral_self_regulation_action_model_fit.csv"))
write_csv(weakness_results, file.path(output_tables, "moral_self_regulation_weakness_model.csv"))
write_csv(weakness_fit, file.path(output_tables, "moral_self_regulation_weakness_model_fit.csv"))
write_csv(repair_results, file.path(output_tables, "moral_self_regulation_repair_model.csv"))
write_csv(repair_fit, file.path(output_tables, "moral_self_regulation_repair_model_fit.csv"))
write_csv(temptation_summary, file.path(output_tables, "moral_self_regulation_temptation_summary.csv"))
write_csv(fatigue_summary, file.path(output_tables, "moral_self_regulation_fatigue_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "moral_self_regulation_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_moral_action_temptation_regulation.png"),
  plot = plot_action,
  width = 10,
  height = 6,
  dpi = 300
)

print(action_results)
print(weakness_results)
print(repair_results)
print(temptation_summary)
print(fatigue_summary)
