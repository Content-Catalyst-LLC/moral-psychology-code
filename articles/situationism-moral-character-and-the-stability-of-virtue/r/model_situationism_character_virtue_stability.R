# Situationism, Moral Character, and the Stability of Virtue
# Synthetic R workflow for modeling character across situations.
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

n_people <- 500
n_situations <- 10

people <- tibble(
  person_id = 1:n_people,
  character_strength = rnorm(n_people, 0, 1),
  self_regulation = rnorm(n_people, 0, 1),
  habit_strength = rnorm(n_people, 0, 1),
  moral_identity = rnorm(n_people, 0, 1),
  depletion = rnorm(n_people, 0, 1)
)

situations <- tibble(
  situation_id = 1:n_situations,
  situational_pressure = seq(-1.5, 1.5, length.out = n_situations),
  voice_safety = seq(1.2, -1.2, length.out = n_situations),
  accountability_visibility = c(1.2, 1.0, 0.8, 0.4, 0.1, -0.1, -0.4, -0.7, -1.0, -1.2),
  situation_class = c(
    "Helping visible / low pressure",
    "Accountability high / low pressure",
    "Peer support / moderate pressure",
    "Public ambiguity",
    "Neutral",
    "Private temptation",
    "Time stress",
    "Conformity pressure",
    "Authority pressure",
    "Very high pressure / low accountability"
  )
)

df <- crossing(people, situations) |>
  mutate(
    action_latent =
      0.42 * character_strength +
      0.28 * self_regulation +
      0.25 * habit_strength +
      0.22 * moral_identity -
      0.55 * situational_pressure +
      0.25 * voice_safety +
      0.25 * accountability_visibility -
      0.20 * depletion -
      0.22 * character_strength * situational_pressure +
      rnorm(n(), 0, 0.9),

    moral_action_probability = plogis(action_latent),
    moral_action = if_else(moral_action_probability >= 0.5, 1, 0),

    pressure_band = case_when(
      situational_pressure < -0.75 ~ "Low pressure",
      situational_pressure < 0.25 ~ "Moderate pressure",
      situational_pressure < 1.0 ~ "High pressure",
      TRUE ~ "Very high pressure"
    )
  )

model <- glm(
  moral_action ~ character_strength + self_regulation + habit_strength +
    moral_identity + depletion + situational_pressure + voice_safety +
    accountability_visibility + character_strength:situational_pressure,
  data = df,
  family = binomial()
)

model_results <- tidy(model, conf.int = TRUE, exponentiate = TRUE)
model_fit <- glance(model)

pressure_summary <- df |>
  group_by(pressure_band) |>
  summarize(
    mean_character = mean(character_strength),
    mean_self_regulation = mean(self_regulation),
    mean_habit = mean(habit_strength),
    mean_pressure = mean(situational_pressure),
    mean_voice_safety = mean(voice_safety),
    mean_accountability = mean(accountability_visibility),
    mean_action_prob = mean(moral_action_probability),
    action_rate = mean(moral_action),
    .groups = "drop"
  )

pred_grid <- expand_grid(
  character_strength = seq(-2, 2, length.out = 120),
  situational_pressure = c(-1, 0, 1),
  self_regulation = 0,
  habit_strength = 0,
  moral_identity = 0,
  depletion = 0,
  voice_safety = 0,
  accountability_visibility = 0
)

pred_grid$predicted_action_prob <- predict(
  model,
  newdata = pred_grid,
  type = "response"
)

pred_grid <- pred_grid |>
  mutate(
    pressure_label = case_when(
      situational_pressure == -1 ~ "Low situational pressure",
      situational_pressure == 0 ~ "Neutral situation",
      TRUE ~ "High situational pressure"
    )
  )

plot_action <- ggplot(
  pred_grid,
  aes(x = character_strength, y = predicted_action_prob)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ pressure_label) +
  labs(
    title = "Predicted Moral Action from Character and Situation",
    subtitle = "Character matters, but its expression shifts across contexts",
    x = "Character strength",
    y = "Probability of moral action"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "situationism_character_simulated_data.csv"))
write_csv(model_results, file.path(output_tables, "situationism_character_model.csv"))
write_csv(model_fit, file.path(output_tables, "situationism_character_model_fit.csv"))
write_csv(pressure_summary, file.path(output_tables, "situationism_pressure_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "situationism_character_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_moral_action_character_situation.png"),
  plot = plot_action,
  width = 10,
  height = 6,
  dpi = 300
)

print(model_results)
print(pressure_summary)
