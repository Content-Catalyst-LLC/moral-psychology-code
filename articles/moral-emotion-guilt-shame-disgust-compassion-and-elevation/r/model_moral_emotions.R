# Moral Emotion: Guilt, Shame, Disgust, Compassion, and Elevation
# Synthetic R workflow for modeling differentiated moral emotions.
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
  perceived_wrongdoing = rnorm(n, 0, 1),
  specific_responsibility = rnorm(n, 0, 1),
  global_self_condemnation = rnorm(n, 0, 1),
  exposure_before_others = rnorm(n, 0, 1),
  perceived_violation = rnorm(n, 0, 1),
  boundary_threat = rnorm(n, 0, 1),
  perceived_suffering = rnorm(n, 0, 1),
  mind_perception = rnorm(n, 0, 1),
  admired_moral_action = rnorm(n, 0, 1),
  perceived_moral_excellence = rnorm(n, 0, 1),
  agency_capacity = rnorm(n, 0, 1),
  repair_pathway = rnorm(n, 0, 1),
  social_support = rnorm(n, 0, 1)
) |>
  mutate(
    guilt =
      0.55 * perceived_wrongdoing +
      0.50 * specific_responsibility +
      0.20 * agency_capacity +
      rnorm(n, 0, 0.8),

    shame =
      0.60 * global_self_condemnation +
      0.45 * exposure_before_others -
      0.15 * agency_capacity +
      rnorm(n, 0, 0.8),

    disgust =
      0.60 * perceived_violation +
      0.40 * boundary_threat +
      rnorm(n, 0, 0.8),

    compassion =
      0.65 * perceived_suffering +
      0.35 * mind_perception +
      0.15 * social_support +
      rnorm(n, 0, 0.8),

    elevation =
      0.60 * admired_moral_action +
      0.45 * perceived_moral_excellence +
      rnorm(n, 0, 0.8),

    helping_tendency =
      0.35 * guilt +
      0.45 * compassion +
      0.30 * elevation -
      0.20 * shame -
      0.15 * disgust +
      0.20 * repair_pathway +
      rnorm(n, 0, 0.9),

    repair_tendency =
      0.45 * guilt -
      0.25 * shame +
      0.25 * compassion +
      0.30 * repair_pathway +
      0.20 * agency_capacity +
      rnorm(n, 0, 0.9),

    avoidance_tendency =
      0.40 * shame +
      0.30 * disgust -
      0.20 * compassion -
      0.15 * agency_capacity +
      rnorm(n, 0, 0.9),

    constructive_emotion_index =
      (guilt + compassion + elevation) / 3,

    punitive_emotion_index =
      (shame + disgust) / 2,

    constructive_band = case_when(
      constructive_emotion_index < -0.75 ~ "Low constructive moral emotion",
      constructive_emotion_index < 0.25 ~ "Moderate constructive moral emotion",
      constructive_emotion_index < 1.0 ~ "High constructive moral emotion",
      TRUE ~ "Very high constructive moral emotion"
    )
  )

model_helping <- lm(
  helping_tendency ~ guilt + shame + disgust + compassion +
    elevation + repair_pathway,
  data = df
)

helping_results <- tidy(model_helping, conf.int = TRUE)
helping_fit <- glance(model_helping)

model_repair <- lm(
  repair_tendency ~ guilt + shame + compassion +
    repair_pathway + agency_capacity,
  data = df
)

repair_results <- tidy(model_repair, conf.int = TRUE)
repair_fit <- glance(model_repair)

model_avoidance <- lm(
  avoidance_tendency ~ guilt + shame + disgust +
    compassion + elevation + agency_capacity,
  data = df
)

avoidance_results <- tidy(model_avoidance, conf.int = TRUE)
avoidance_fit <- glance(model_avoidance)

constructive_summary <- df |>
  group_by(constructive_band) |>
  summarize(
    mean_guilt = mean(guilt),
    mean_compassion = mean(compassion),
    mean_elevation = mean(elevation),
    mean_shame = mean(shame),
    mean_disgust = mean(disgust),
    mean_helping = mean(helping_tendency),
    mean_repair = mean(repair_tendency),
    mean_avoidance = mean(avoidance_tendency),
    .groups = "drop"
  )

plot_df <- df |>
  select(guilt, compassion, elevation, helping_tendency) |>
  pivot_longer(
    cols = c(guilt, compassion, elevation),
    names_to = "emotion",
    values_to = "emotion_score"
  )

plot_helping <- ggplot(
  plot_df,
  aes(x = emotion_score, y = helping_tendency)
) +
  geom_point(alpha = 0.20) +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ emotion, scales = "free_x") +
  labs(
    title = "Moral Emotions and Helping Tendency",
    subtitle = "Constructive moral emotions often predict repair and prosocial response",
    x = "Emotion score",
    y = "Helping tendency"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "moral_emotions_simulated_data.csv"))
write_csv(helping_results, file.path(output_tables, "moral_emotions_helping_model.csv"))
write_csv(helping_fit, file.path(output_tables, "moral_emotions_helping_model_fit.csv"))
write_csv(repair_results, file.path(output_tables, "moral_emotions_repair_model.csv"))
write_csv(repair_fit, file.path(output_tables, "moral_emotions_repair_model_fit.csv"))
write_csv(avoidance_results, file.path(output_tables, "moral_emotions_avoidance_model.csv"))
write_csv(avoidance_fit, file.path(output_tables, "moral_emotions_avoidance_model_fit.csv"))
write_csv(constructive_summary, file.path(output_tables, "moral_emotions_constructive_summary.csv"))

ggsave(
  filename = file.path(output_figures, "moral_emotions_helping_tendency.png"),
  plot = plot_helping,
  width = 10,
  height = 6,
  dpi = 300
)

print(helping_results)
print(repair_results)
print(avoidance_results)
print(constructive_summary)
