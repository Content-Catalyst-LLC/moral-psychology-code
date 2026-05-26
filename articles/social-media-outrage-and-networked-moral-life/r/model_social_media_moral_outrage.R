# Social Media, Outrage, and Networked Moral Life
# Synthetic R workflow for networked moral-outrage modeling.
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

n <- 2500

df <- tibble(
  user_id = 1:n,
  outrage_intensity = rnorm(n, 0, 1),
  expected_reward = rnorm(n, 0, 1),
  algorithmic_amplification = rnorm(n, 0, 1),
  group_identity_salience = rnorm(n, 0, 1),
  visibility_bias = rnorm(n, 0, 1),
  contextual_correction = rnorm(n, 0, 1),
  misinformation_susceptibility = rnorm(n, 0, 1),
  cross_group_exposure = rnorm(n, 0, 1)
) |>
  mutate(
    expression_latent =
      0.35 * outrage_intensity +
      0.30 * expected_reward +
      0.25 * algorithmic_amplification +
      0.25 * group_identity_salience -
      0.15 * contextual_correction +
      rnorm(n, 0, 0.8),

    outrage_expression_prob = plogis(expression_latent),
    outrage_expression = if_else(outrage_expression_prob >= 0.5, 1, 0),

    perceived_norm_extremity =
      0.40 * visibility_bias +
      0.25 * algorithmic_amplification +
      0.20 * outrage_expression -
      0.15 * cross_group_exposure +
      rnorm(n, 0, 0.8),

    moralized_sharing =
      0.30 * outrage_intensity +
      0.25 * group_identity_salience +
      0.25 * misinformation_susceptibility +
      0.20 * expected_reward -
      0.15 * contextual_correction +
      rnorm(n, 0, 0.8)
  )

model_expression <- glm(
  outrage_expression ~ outrage_intensity + expected_reward +
    algorithmic_amplification + group_identity_salience +
    contextual_correction,
  data = df,
  family = binomial()
)

expression_summary <- tidy(model_expression, conf.int = TRUE, exponentiate = TRUE)

model_norm <- lm(
  perceived_norm_extremity ~ visibility_bias + algorithmic_amplification +
    outrage_expression + cross_group_exposure,
  data = df
)

norm_summary <- tidy(model_norm, conf.int = TRUE)

model_sharing <- lm(
  moralized_sharing ~ outrage_intensity + group_identity_salience +
    misinformation_susceptibility + expected_reward +
    contextual_correction,
  data = df
)

sharing_summary <- tidy(model_sharing, conf.int = TRUE)

pred_grid <- expand_grid(
  outrage_intensity = seq(-2, 2, length.out = 100),
  expected_reward = c(-1, 0, 1),
  algorithmic_amplification = 0,
  group_identity_salience = 0,
  contextual_correction = 0
)

pred_grid$predicted_expression <- predict(
  model_expression,
  newdata = pred_grid,
  type = "response"
)

pred_grid <- pred_grid |>
  mutate(
    reward_label = case_when(
      expected_reward == -1 ~ "Low expected reward",
      expected_reward == 0 ~ "Average expected reward",
      TRUE ~ "High expected reward"
    )
  )

amplification_summary <- df |>
  mutate(
    amplification_band = ntile(algorithmic_amplification, 4),
    amplification_band = factor(
      amplification_band,
      labels = c("Low", "Lower-middle", "Upper-middle", "High")
    )
  ) |>
  group_by(amplification_band) |>
  summarize(
    mean_expression_probability = mean(outrage_expression_prob),
    mean_norm_extremity = mean(perceived_norm_extremity),
    mean_moralized_sharing = mean(moralized_sharing),
    mean_visibility_bias = mean(visibility_bias),
    .groups = "drop"
  )

plot_expression <- ggplot(
  pred_grid,
  aes(x = outrage_intensity, y = predicted_expression)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ reward_label) +
  labs(
    title = "Predicted Public Outrage Expression on Social Media",
    subtitle = "Social reward changes the likelihood that outrage is publicly expressed",
    x = "Outrage intensity",
    y = "Probability of public expression"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "social_media_moral_outrage_simulated_data.csv"))
write_csv(expression_summary, file.path(output_tables, "social_media_outrage_expression_model.csv"))
write_csv(norm_summary, file.path(output_tables, "social_media_norm_distortion_model.csv"))
write_csv(sharing_summary, file.path(output_tables, "social_media_moralized_sharing_model.csv"))
write_csv(amplification_summary, file.path(output_tables, "social_media_amplification_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "social_media_outrage_expression_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_public_outrage_expression.png"),
  plot = plot_expression,
  width = 10,
  height = 6,
  dpi = 300
)

print(expression_summary)
print(norm_summary)
print(sharing_summary)
print(amplification_summary)
