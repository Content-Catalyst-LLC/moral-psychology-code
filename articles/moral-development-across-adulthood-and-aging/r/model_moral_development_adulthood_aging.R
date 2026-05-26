# Moral Development Across Adulthood and Aging
# Synthetic R workflow for modeling adult lifespan moral change.
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
  age = runif(n, min = 18, max = 85),
  moral_identity = rnorm(n, 0, 1),
  prosocial_orientation = rnorm(n, 0, 1),
  role_complexity = rnorm(n, 0, 1),
  moral_emotion_profile = rnorm(n, 0, 1),
  decision_capacity = rnorm(n, 0, 1),
  generativity = rnorm(n, 0, 1),
  caregiving_burden = rnorm(n, 0, 1),
  loss_reflection = rnorm(n, 0, 1),
  voice_safety = rnorm(n, 0, 1),
  accountability_strength = rnorm(n, 0, 1)
) |>
  mutate(
    latent_moral_development =
      0.03 * age -
      0.00025 * age^2 +
      0.35 * moral_identity +
      0.40 * prosocial_orientation +
      0.30 * role_complexity +
      0.25 * moral_emotion_profile +
      0.20 * decision_capacity +
      0.25 * generativity -
      0.20 * caregiving_burden +
      0.15 * loss_reflection +
      rnorm(n, 0, 1),

    adulthood_band = case_when(
      age < 30 ~ "Emerging/young adulthood",
      age < 45 ~ "Early adulthood",
      age < 60 ~ "Mid-adulthood",
      age < 75 ~ "Older adulthood",
      TRUE ~ "Advanced old age"
    ),

    adulthood_band = factor(
      adulthood_band,
      levels = c(
        "Emerging/young adulthood",
        "Early adulthood",
        "Mid-adulthood",
        "Older adulthood",
        "Advanced old age"
      ),
      ordered = TRUE
    ),

    moral_action_latent =
      0.45 * latent_moral_development +
      0.25 * voice_safety +
      0.25 * accountability_strength -
      0.25 * caregiving_burden +
      rnorm(n, 0, 0.9),

    moral_action_probability = plogis(moral_action_latent),
    moral_action = if_else(moral_action_probability >= 0.5, 1, 0)
  )

model_dev <- lm(
  latent_moral_development ~ age + I(age^2) + moral_identity +
    prosocial_orientation + role_complexity +
    moral_emotion_profile + decision_capacity +
    generativity + caregiving_burden + loss_reflection,
  data = df
)

dev_results <- tidy(model_dev, conf.int = TRUE)
dev_fit <- glance(model_dev)

model_action <- glm(
  moral_action ~ latent_moral_development + voice_safety +
    accountability_strength + caregiving_burden,
  data = df,
  family = binomial()
)

action_results <- tidy(
  model_action,
  conf.int = TRUE,
  exponentiate = TRUE
)

action_fit <- glance(model_action)

band_summary <- df |>
  group_by(adulthood_band) |>
  summarize(
    mean_age = mean(age),
    mean_identity = mean(moral_identity),
    mean_prosociality = mean(prosocial_orientation),
    mean_role_complexity = mean(role_complexity),
    mean_generativity = mean(generativity),
    mean_burden = mean(caregiving_burden),
    mean_profile = mean(latent_moral_development),
    mean_action_probability = mean(moral_action_probability),
    action_rate = mean(moral_action),
    .groups = "drop"
  )

pred_grid <- expand_grid(
  age = seq(18, 85, length.out = 120),
  prosocial_orientation = c(-1, 0, 1),
  moral_identity = 0,
  role_complexity = 0,
  moral_emotion_profile = 0,
  decision_capacity = 0,
  generativity = 0,
  caregiving_burden = 0,
  loss_reflection = 0
)

pred_grid$predicted_development <- predict(
  model_dev,
  newdata = pred_grid
)

pred_grid <- pred_grid |>
  mutate(
    prosocial_label = case_when(
      prosocial_orientation == -1 ~ "Low prosocial orientation",
      prosocial_orientation == 0 ~ "Average prosocial orientation",
      TRUE ~ "High prosocial orientation"
    )
  )

plot_development <- ggplot(
  pred_grid,
  aes(x = age, y = predicted_development)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ prosocial_label) +
  labs(
    title = "Predicted Moral Development Across Adulthood and Aging",
    subtitle = "Development remains active across the adult lifespan",
    x = "Age",
    y = "Predicted moral-development profile"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "moral_development_adulthood_aging_simulated_data.csv"))
write_csv(dev_results, file.path(output_tables, "moral_development_adulthood_model.csv"))
write_csv(dev_fit, file.path(output_tables, "moral_development_adulthood_model_fit.csv"))
write_csv(action_results, file.path(output_tables, "moral_development_adult_action_model.csv"))
write_csv(action_fit, file.path(output_tables, "moral_development_adult_action_model_fit.csv"))
write_csv(band_summary, file.path(output_tables, "moral_development_adulthood_band_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "moral_development_adulthood_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_moral_development_across_adulthood.png"),
  plot = plot_development,
  width = 10,
  height = 6,
  dpi = 300
)

print(dev_results)
print(action_results)
print(band_summary)
