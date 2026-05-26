# Moral Perception, Salience, and the Psychology of Ethical Attention
# Synthetic R workflow for modeling moral salience and ethical attention.
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
  perceived_harm = rnorm(n, 0, 1),
  visible_vulnerability = rnorm(n, 0, 1),
  emotional_activation = rnorm(n, 0, 1),
  mind_perception = rnorm(n, 0, 1),
  contextual_framing = rnorm(n, 0, 1),
  attentional_competition = rnorm(n, 0, 1),
  organized_inattention = rnorm(n, 0, 1),
  intention_attribution = rnorm(n, 0, 1),
  reflective_interpretation = rnorm(n, 0, 1),
  repair_pathway = rnorm(n, 0, 1)
) |>
  mutate(
    latent_salience =
      0.60 * perceived_harm +
      0.50 * visible_vulnerability +
      0.35 * emotional_activation +
      0.40 * mind_perception +
      0.25 * contextual_framing -
      0.45 * attentional_competition -
      0.35 * organized_inattention +
      rnorm(n, 0, 0.8),

    focal_attention_probability = plogis(latent_salience),
    focal_attention = if_else(focal_attention_probability >= 0.5, 1, 0),

    moral_judgment =
      0.70 * focal_attention +
      0.35 * intention_attribution +
      0.30 * reflective_interpretation -
      0.15 * organized_inattention +
      rnorm(n, 0, 0.9),

    ethical_response_tendency =
      0.45 * focal_attention +
      0.30 * moral_judgment +
      0.25 * repair_pathway -
      0.20 * attentional_competition -
      0.20 * organized_inattention +
      rnorm(n, 0, 0.9),

    salience_band = case_when(
      latent_salience < -0.75 ~ "Low moral salience",
      latent_salience < 0.25 ~ "Moderate moral salience",
      latent_salience < 1.0 ~ "High moral salience",
      TRUE ~ "Very high moral salience"
    )
  )

model_attention <- glm(
  focal_attention ~ perceived_harm + visible_vulnerability +
    emotional_activation + mind_perception +
    contextual_framing + attentional_competition +
    organized_inattention,
  data = df,
  family = binomial()
)

attention_results <- tidy(
  model_attention,
  conf.int = TRUE,
  exponentiate = TRUE
)

attention_fit <- glance(model_attention)

model_judgment <- lm(
  moral_judgment ~ focal_attention +
    intention_attribution + reflective_interpretation +
    organized_inattention,
  data = df
)

judgment_results <- tidy(model_judgment, conf.int = TRUE)
judgment_fit <- glance(model_judgment)

model_response <- lm(
  ethical_response_tendency ~ focal_attention +
    moral_judgment + repair_pathway +
    attentional_competition + organized_inattention,
  data = df
)

response_results <- tidy(model_response, conf.int = TRUE)
response_fit <- glance(model_response)

salience_summary <- df |>
  group_by(salience_band) |>
  summarize(
    mean_harm = mean(perceived_harm),
    mean_vulnerability = mean(visible_vulnerability),
    mean_mind_perception = mean(mind_perception),
    mean_competition = mean(attentional_competition),
    mean_organized_inattention = mean(organized_inattention),
    focal_attention_rate = mean(focal_attention),
    mean_judgment = mean(moral_judgment),
    mean_response = mean(ethical_response_tendency),
    .groups = "drop"
  )

pred_grid <- expand_grid(
  perceived_harm = seq(-2, 2, length.out = 120),
  visible_vulnerability = c(-1, 0, 1),
  emotional_activation = 0,
  mind_perception = 0,
  contextual_framing = 0,
  attentional_competition = 0,
  organized_inattention = 0
)

pred_grid$predicted_attention <- predict(
  model_attention,
  newdata = pred_grid,
  type = "response"
)

pred_grid <- pred_grid |>
  mutate(
    vulnerability_label = case_when(
      visible_vulnerability == -1 ~ "Low visible vulnerability",
      visible_vulnerability == 0 ~ "Average visible vulnerability",
      TRUE ~ "High visible vulnerability"
    )
  )

plot_attention <- ggplot(
  pred_grid,
  aes(x = perceived_harm, y = predicted_attention)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ vulnerability_label) +
  labs(
    title = "Predicted Focal Moral Attention",
    subtitle = "Harm and visible vulnerability shape whether moral features become salient",
    x = "Perceived harm",
    y = "Probability of focal attention"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "moral_salience_simulated_data.csv"))
write_csv(attention_results, file.path(output_tables, "moral_salience_attention_model.csv"))
write_csv(attention_fit, file.path(output_tables, "moral_salience_attention_model_fit.csv"))
write_csv(judgment_results, file.path(output_tables, "moral_salience_judgment_model.csv"))
write_csv(judgment_fit, file.path(output_tables, "moral_salience_judgment_model_fit.csv"))
write_csv(response_results, file.path(output_tables, "moral_salience_response_model.csv"))
write_csv(response_fit, file.path(output_tables, "moral_salience_response_model_fit.csv"))
write_csv(salience_summary, file.path(output_tables, "moral_salience_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "moral_salience_prediction_grid.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_focal_moral_attention.png"),
  plot = plot_attention,
  width = 10,
  height = 6,
  dpi = 300
)

print(attention_results)
print(judgment_results)
print(response_results)
print(salience_summary)
