# Moral Development in Childhood and Adolescence
# Synthetic R workflow for modeling moral development.
# Educational and reproducible research scaffold only.

suppressPackageStartupMessages({
  library(tidyverse)
  library(broom)
  library(MASS)
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
  age = runif(n, min = 5, max = 18),
  perspective_taking = rnorm(n, 0, 1),
  empathic_concern = rnorm(n, 0, 1),
  norm_understanding = rnorm(n, 0, 1),
  peer_context = rnorm(n, 0, 1),
  family_support = rnorm(n, 0, 1),
  school_climate = rnorm(n, 0, 1),
  peer_status_pressure = rnorm(n, 0, 1)
) |>
  mutate(
    latent_moral_development =
      0.12 * age -
      0.002 * age^2 +
      0.40 * perspective_taking +
      0.35 * empathic_concern +
      0.38 * norm_understanding +
      0.20 * peer_context +
      0.25 * family_support +
      0.20 * school_climate -
      0.20 * peer_status_pressure +
      rnorm(n, 0, 1),

    harm_understanding =
      0.50 * latent_moral_development +
      0.25 * empathic_concern +
      rnorm(n, 0, 0.8),

    fairness_reasoning =
      0.45 * latent_moral_development +
      0.20 * perspective_taking +
      rnorm(n, 0, 0.8),

    conventional_sensitivity =
      0.30 * latent_moral_development +
      0.25 * norm_understanding +
      rnorm(n, 0, 0.8),

    personal_autonomy_understanding =
      0.25 * latent_moral_development +
      0.30 * perspective_taking +
      0.18 * age +
      rnorm(n, 0, 0.8),

    development_band = case_when(
      latent_moral_development < -0.5 ~ "Early-childhood pattern",
      latent_moral_development < 0.8 ~ "Middle-childhood pattern",
      TRUE ~ "Adolescent pattern"
    ),

    development_band = factor(
      development_band,
      levels = c(
        "Early-childhood pattern",
        "Middle-childhood pattern",
        "Adolescent pattern"
      ),
      ordered = TRUE
    ),

    moral_action_latent =
      0.45 * latent_moral_development +
      0.30 * empathic_concern +
      0.25 * school_climate -
      0.30 * peer_status_pressure +
      rnorm(n, 0, 0.9),

    moral_action_probability = plogis(moral_action_latent),
    moral_action = if_else(moral_action_probability >= 0.5, 1, 0)
  )

model_dev <- polr(
  development_band ~ age + perspective_taking + empathic_concern +
    norm_understanding + peer_context + family_support +
    school_climate + peer_status_pressure,
  data = df,
  Hess = TRUE
)

dev_results <- tidy(model_dev)

model_action <- glm(
  moral_action ~ latent_moral_development + empathic_concern +
    school_climate + peer_status_pressure,
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
  group_by(development_band) |>
  summarize(
    mean_age = mean(age),
    mean_perspective_taking = mean(perspective_taking),
    mean_empathy = mean(empathic_concern),
    mean_norm_understanding = mean(norm_understanding),
    mean_harm = mean(harm_understanding),
    mean_fairness = mean(fairness_reasoning),
    mean_convention = mean(conventional_sensitivity),
    mean_personal_autonomy = mean(personal_autonomy_understanding),
    mean_action_probability = mean(moral_action_probability),
    action_rate = mean(moral_action),
    .groups = "drop"
  )

pred_grid <- expand_grid(
  age = seq(5, 18, length.out = 100),
  empathic_concern = c(-1, 0, 1),
  perspective_taking = 0,
  norm_understanding = 0,
  peer_context = 0,
  family_support = 0,
  school_climate = 0,
  peer_status_pressure = 0
)

pred_probs <- predict(model_dev, newdata = pred_grid, type = "probs")

pred_df <- bind_cols(pred_grid, as_tibble(pred_probs)) |>
  pivot_longer(
    cols = c(
      `Early-childhood pattern`,
      `Middle-childhood pattern`,
      `Adolescent pattern`
    ),
    names_to = "development_band",
    values_to = "probability"
  ) |>
  mutate(
    empathy_label = case_when(
      empathic_concern == -1 ~ "Low empathy",
      empathic_concern == 0 ~ "Average empathy",
      TRUE ~ "High empathy"
    )
  )

plot_dev <- ggplot(
  pred_df,
  aes(x = age, y = probability)
) +
  geom_line(linewidth = 1) +
  facet_grid(development_band ~ empathy_label) +
  labs(
    title = "Predicted Moral Development Across Childhood and Adolescence",
    subtitle = "Developmental patterns shift with age and empathic concern",
    x = "Age",
    y = "Predicted probability"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "moral_development_childhood_adolescence_simulated_data.csv"))
write_csv(dev_results, file.path(output_tables, "moral_development_ordinal_model.csv"))
write_csv(action_results, file.path(output_tables, "moral_development_action_model.csv"))
write_csv(action_fit, file.path(output_tables, "moral_development_action_model_fit.csv"))
write_csv(band_summary, file.path(output_tables, "moral_development_band_summary.csv"))
write_csv(pred_df, file.path(output_tables, "moral_development_predicted_probabilities.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_moral_development_childhood_adolescence.png"),
  plot = plot_dev,
  width = 11,
  height = 7,
  dpi = 300
)

print(dev_results)
print(action_results)
print(band_summary)
