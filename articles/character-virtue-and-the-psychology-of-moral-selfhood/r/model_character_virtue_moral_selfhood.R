# Character, Virtue, and the Psychology of Moral Selfhood
# Synthetic R workflow for modeling character, virtue, and moral selfhood.
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
  trait_disposition = rnorm(n, 0, 1),
  habituated_practice = rnorm(n, 0, 1),
  identity_integration = rnorm(n, 0, 1),
  self_regulation = rnorm(n, 0, 1),
  accountability = rnorm(n, 0, 1),
  repair_capacity = rnorm(n, 0, 1),
  situational_pressure = rnorm(n, 0, 1),
  institutional_support = rnorm(n, 0, 1)
) |>
  mutate(
    character_strength =
      0.35 * trait_disposition +
      0.40 * habituated_practice +
      0.35 * identity_integration +
      0.30 * self_regulation +
      0.20 * accountability +
      rnorm(n, 0, 0.8),

    moral_selfhood_profile =
      0.40 * character_strength +
      0.30 * identity_integration +
      0.25 * accountability +
      0.30 * repair_capacity +
      0.20 * self_regulation +
      rnorm(n, 0, 0.8),

    action_latent =
      0.45 * character_strength +
      0.30 * moral_selfhood_profile -
      0.40 * situational_pressure +
      0.25 * institutional_support +
      0.20 * self_regulation +
      rnorm(n, 0, 0.8),

    virtuous_action_probability = plogis(action_latent),
    virtuous_action = if_else(virtuous_action_probability >= 0.5, 1, 0),

    pressure_band = case_when(
      situational_pressure < -0.75 ~ "Low pressure",
      situational_pressure < 0.25 ~ "Moderate pressure",
      situational_pressure < 1.0 ~ "High pressure",
      TRUE ~ "Very high pressure"
    )
  )

model_character <- lm(
  character_strength ~ trait_disposition + habituated_practice +
    identity_integration + self_regulation + accountability,
  data = df
)

character_results <- tidy(model_character, conf.int = TRUE)
character_fit <- glance(model_character)

model_selfhood <- lm(
  moral_selfhood_profile ~ character_strength + identity_integration +
    accountability + repair_capacity + self_regulation,
  data = df
)

selfhood_results <- tidy(model_selfhood, conf.int = TRUE)
selfhood_fit <- glance(model_selfhood)

model_action <- glm(
  virtuous_action ~ character_strength + moral_selfhood_profile +
    situational_pressure + institutional_support + self_regulation,
  data = df,
  family = binomial()
)

action_results <- tidy(
  model_action,
  conf.int = TRUE,
  exponentiate = TRUE
)

action_fit <- glance(model_action)

pressure_summary <- df |>
  group_by(pressure_band) |>
  summarize(
    mean_character = mean(character_strength),
    mean_selfhood = mean(moral_selfhood_profile),
    mean_identity = mean(identity_integration),
    mean_repair = mean(repair_capacity),
    mean_pressure = mean(situational_pressure),
    mean_support = mean(institutional_support),
    mean_action_probability = mean(virtuous_action_probability),
    action_rate = mean(virtuous_action),
    .groups = "drop"
  )

pred_grid <- expand_grid(
  character_strength = seq(-2, 2, length.out = 100),
  situational_pressure = c(-1, 0, 1),
  moral_selfhood_profile = 0,
  institutional_support = 0,
  self_regulation = 0
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
  aes(x = character_strength, y = predicted_action_prob)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ pressure_label) +
  labs(
    title = "Predicted Virtuous Action from Character Strength",
    subtitle = "Character supports action, but situational pressure still matters",
    x = "Character strength",
    y = "Probability of virtuous action"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "character_virtue_moral_selfhood_simulated_data.csv"))
write_csv(character_results, file.path(output_tables, "character_structure_model.csv"))
write_csv(character_fit, file.path(output_tables, "character_structure_model_fit.csv"))
write_csv(selfhood_results, file.path(output_tables, "moral_selfhood_model.csv"))
write_csv(selfhood_fit, file.path(output_tables, "moral_selfhood_model_fit.csv"))
write_csv(action_results, file.path(output_tables, "virtuous_action_model.csv"))
write_csv(action_fit, file.path(output_tables, "virtuous_action_model_fit.csv"))
write_csv(pressure_summary, file.path(output_tables, "character_virtue_pressure_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "character_virtue_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_virtuous_action_character_pressure.png"),
  plot = plot_action,
  width = 10,
  height = 6,
  dpi = 300
)

print(character_results)
print(selfhood_results)
print(action_results)
print(pressure_summary)
