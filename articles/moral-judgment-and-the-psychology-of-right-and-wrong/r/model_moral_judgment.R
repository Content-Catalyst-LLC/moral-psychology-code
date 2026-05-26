# Moral Judgment and the Psychology of Right and Wrong
# Synthetic R workflow for estimating wrongness, blame, and repair-oriented response.
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
  perceived_harm = rnorm(n, mean = 0, sd = 1),
  norm_violation = rnorm(n, mean = 0, sd = 1),
  inferred_intention = rnorm(n, mean = 0, sd = 1),
  emotional_activation = rnorm(n, mean = 0, sd = 1),
  ideological_framing = rnorm(n, mean = 0, sd = 1),
  situational_ambiguity = rnorm(n, mean = 0, sd = 1),
  perceived_agency = rnorm(n, mean = 0, sd = 1),
  repair_opportunity = rnorm(n, mean = 0, sd = 1),
  dignity_preservation = rnorm(n, mean = 0, sd = 1),
  punitive_pressure = rnorm(n, mean = 0, sd = 1),
  institutional_support = rnorm(n, mean = 0, sd = 1)
) |>
  mutate(
    latent_wrongness =
      0.65 * perceived_harm +
      0.55 * norm_violation +
      0.50 * inferred_intention +
      0.25 * emotional_activation +
      0.20 * ideological_framing -
      0.30 * situational_ambiguity +
      rnorm(n, 0, 0.7),

    wrongness_rating = pmin(
      pmax(1 + 1.2 * latent_wrongness + rnorm(n, 0, 0.8), 1),
      7
    ),

    latent_blame =
      0.55 * wrongness_rating +
      0.45 * perceived_agency -
      0.30 * repair_opportunity +
      0.15 * emotional_activation -
      0.15 * situational_ambiguity +
      rnorm(n, 0, 0.8),

    blame_rating = pmin(
      pmax(1 + 1.0 * latent_blame + rnorm(n, 0, 0.8), 1),
      7
    ),

    judged_wrong = if_else(wrongness_rating >= 4, 1, 0),

    constructive_response_score =
      0.35 * blame_rating +
      0.45 * repair_opportunity +
      0.35 * dignity_preservation +
      0.25 * institutional_support -
      0.30 * punitive_pressure +
      rnorm(n, 0, 0.9),

    constructive_response = if_else(
      constructive_response_score >= median(constructive_response_score),
      1,
      0
    ),

    judgment_band = case_when(
      wrongness_rating < 2.5 ~ "Low wrongness",
      wrongness_rating < 4.5 ~ "Moderate wrongness",
      wrongness_rating < 6.0 ~ "High wrongness",
      TRUE ~ "Very high wrongness"
    )
  )

model_wrong <- glm(
  judged_wrong ~ perceived_harm + norm_violation + inferred_intention +
    emotional_activation + ideological_framing + situational_ambiguity,
  data = df,
  family = binomial()
)

wrong_results <- tidy(model_wrong, conf.int = TRUE, exponentiate = TRUE)
wrong_fit <- glance(model_wrong)

model_blame <- lm(
  blame_rating ~ wrongness_rating + perceived_agency +
    repair_opportunity + emotional_activation + situational_ambiguity,
  data = df
)

blame_results <- tidy(model_blame, conf.int = TRUE)
blame_fit <- glance(model_blame)

model_response <- glm(
  constructive_response ~ blame_rating + repair_opportunity +
    dignity_preservation + punitive_pressure + institutional_support,
  data = df,
  family = binomial()
)

response_results <- tidy(model_response, conf.int = TRUE, exponentiate = TRUE)
response_fit <- glance(model_response)

pred_grid <- expand_grid(
  perceived_harm = seq(-2, 2, length.out = 120),
  inferred_intention = c(-1, 0, 1),
  norm_violation = 0,
  emotional_activation = 0,
  ideological_framing = 0,
  situational_ambiguity = 0
)

pred_grid$pred_prob_wrong <- predict(
  model_wrong,
  newdata = pred_grid,
  type = "response"
)

pred_grid <- pred_grid |>
  mutate(
    intention_label = case_when(
      inferred_intention == -1 ~ "Low inferred intention",
      inferred_intention == 0 ~ "Moderate inferred intention",
      TRUE ~ "High inferred intention"
    )
  )

judgment_summary <- df |>
  group_by(judgment_band) |>
  summarize(
    mean_harm = mean(perceived_harm),
    mean_norm_violation = mean(norm_violation),
    mean_intention = mean(inferred_intention),
    mean_emotion = mean(emotional_activation),
    mean_agency = mean(perceived_agency),
    mean_repair = mean(repair_opportunity),
    mean_blame = mean(blame_rating),
    constructive_response_rate = mean(constructive_response),
    .groups = "drop"
  )

plot_wrongness <- ggplot(
  pred_grid,
  aes(x = perceived_harm, y = pred_prob_wrong)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ intention_label) +
  labs(
    title = "Predicted Probability of Moral Wrongness Judgment",
    subtitle = "Perceived harm and inferred intention jointly shape judgment",
    x = "Perceived harm",
    y = "Probability act is judged wrong"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "moral_judgment_simulated_data.csv"))
write_csv(wrong_results, file.path(output_tables, "moral_judgment_wrongness_model.csv"))
write_csv(wrong_fit, file.path(output_tables, "moral_judgment_wrongness_model_fit.csv"))
write_csv(blame_results, file.path(output_tables, "moral_judgment_blame_model.csv"))
write_csv(blame_fit, file.path(output_tables, "moral_judgment_blame_model_fit.csv"))
write_csv(response_results, file.path(output_tables, "moral_judgment_constructive_response_model.csv"))
write_csv(response_fit, file.path(output_tables, "moral_judgment_constructive_response_model_fit.csv"))
write_csv(judgment_summary, file.path(output_tables, "moral_judgment_band_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "moral_judgment_prediction_grid.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_moral_wrongness.png"),
  plot = plot_wrongness,
  width = 10,
  height = 6,
  dpi = 300
)

print(wrong_results)
print(blame_results)
print(response_results)
print(judgment_summary)
