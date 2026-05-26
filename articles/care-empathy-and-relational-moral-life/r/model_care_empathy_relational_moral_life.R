# Care, Empathy, and Relational Moral Life
# Synthetic R workflow for modeling empathy, care, and relational response.
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
  perspective_taking = rnorm(n, 0, 1),
  affective_resonance = rnorm(n, 0, 1),
  situational_salience = rnorm(n, 0, 1),
  felt_responsibility = rnorm(n, 0, 1),
  perceived_dependence = rnorm(n, 0, 1),
  temporal_persistence = rnorm(n, 0, 1),
  burnout = rnorm(n, 0, 1),
  institutional_support = rnorm(n, 0, 1),
  voice_safety = rnorm(n, 0, 1)
) |>
  mutate(
    empathy =
      0.40 * perspective_taking +
      0.35 * affective_resonance +
      0.30 * situational_salience +
      rnorm(n, 0, 0.8),

    care_latent =
      0.35 * empathy +
      0.40 * felt_responsibility +
      0.35 * perceived_dependence +
      0.30 * temporal_persistence -
      0.40 * burnout +
      0.25 * institutional_support +
      0.18 * voice_safety +
      rnorm(n, 0, 0.8),

    caring_response_probability = plogis(care_latent),
    caring_response = if_else(caring_response_probability >= 0.5, 1, 0),

    burnout_band = case_when(
      burnout < -0.75 ~ "Low burnout",
      burnout < 0.25 ~ "Moderate burnout",
      burnout < 1.0 ~ "High burnout",
      TRUE ~ "Very high burnout"
    )
  )

model_empathy <- lm(
  empathy ~ perspective_taking + affective_resonance + situational_salience,
  data = df
)

empathy_results <- tidy(model_empathy, conf.int = TRUE)
empathy_fit <- glance(model_empathy)

model_care <- glm(
  caring_response ~ empathy + felt_responsibility +
    perceived_dependence + temporal_persistence + burnout +
    institutional_support + voice_safety,
  data = df,
  family = binomial()
)

care_results <- tidy(
  model_care,
  conf.int = TRUE,
  exponentiate = TRUE
)

care_fit <- glance(model_care)

burnout_summary <- df |>
  group_by(burnout_band) |>
  summarize(
    mean_empathy = mean(empathy),
    mean_responsibility = mean(felt_responsibility),
    mean_dependence = mean(perceived_dependence),
    mean_persistence = mean(temporal_persistence),
    mean_support = mean(institutional_support),
    mean_voice_safety = mean(voice_safety),
    mean_care_probability = mean(caring_response_probability),
    care_rate = mean(caring_response),
    .groups = "drop"
  )

pred_grid <- expand_grid(
  empathy = seq(-2, 2, length.out = 120),
  burnout = c(-1, 0, 1),
  felt_responsibility = 0,
  perceived_dependence = 0,
  temporal_persistence = 0,
  institutional_support = 0,
  voice_safety = 0
)

pred_grid$predicted_care_prob <- predict(
  model_care,
  newdata = pred_grid,
  type = "response"
)

pred_grid <- pred_grid |>
  mutate(
    burnout_label = case_when(
      burnout == -1 ~ "Low burnout",
      burnout == 0 ~ "Average burnout",
      TRUE ~ "High burnout"
    )
  )

plot_care <- ggplot(
  pred_grid,
  aes(x = empathy, y = predicted_care_prob)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ burnout_label) +
  labs(
    title = "Predicted Caring Response from Empathy and Burnout",
    subtitle = "Empathy supports care, but burnout can reduce sustained response",
    x = "Empathy",
    y = "Probability of caring response"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "care_empathy_relational_moral_life_simulated_data.csv"))
write_csv(empathy_results, file.path(output_tables, "care_empathy_structure_model.csv"))
write_csv(empathy_fit, file.path(output_tables, "care_empathy_structure_model_fit.csv"))
write_csv(care_results, file.path(output_tables, "care_response_model.csv"))
write_csv(care_fit, file.path(output_tables, "care_response_model_fit.csv"))
write_csv(burnout_summary, file.path(output_tables, "care_empathy_burnout_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "care_empathy_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_caring_response_empathy_burnout.png"),
  plot = plot_care,
  width = 10,
  height = 6,
  dpi = 300
)

print(empathy_results)
print(care_results)
print(burnout_summary)
