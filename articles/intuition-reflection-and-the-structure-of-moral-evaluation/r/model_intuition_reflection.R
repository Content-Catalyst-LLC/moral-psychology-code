# Intuition, Reflection, and the Structure of Moral Evaluation
# Synthetic R workflow for modeling intuitive and reflective contributions.
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
  affective_activation = rnorm(n, 0, 1),
  social_salience = rnorm(n, 0, 1),
  principled_reasoning = rnorm(n, 0, 1),
  evidential_reconsideration = rnorm(n, 0, 1),
  contextual_knowledge = rnorm(n, 0, 1),
  cultural_framing = rnorm(n, 0, 1),
  group_identity_pressure = rnorm(n, 0, 1),
  time_for_reflection = rnorm(n, 0, 1),
  institutional_review = rnorm(n, 0, 1)
) |>
  mutate(
    intuitive_appraisal =
      0.55 * perceived_harm +
      0.45 * affective_activation +
      0.30 * social_salience +
      0.25 * group_identity_pressure +
      rnorm(n, 0, 0.8),

    reflective_evaluation =
      0.40 * principled_reasoning +
      0.35 * evidential_reconsideration +
      0.30 * contextual_knowledge +
      0.20 * cultural_framing +
      0.20 * institutional_review +
      rnorm(n, 0, 0.8),

    intuition_weight = plogis(
      0.30 +
      0.35 * affective_activation +
      0.25 * social_salience +
      0.20 * group_identity_pressure -
      0.30 * evidential_reconsideration -
      0.25 * time_for_reflection +
      rnorm(n, 0, 0.6)
    ),

    final_moral_evaluation =
      intuition_weight * intuitive_appraisal +
      (1 - intuition_weight) * reflective_evaluation +
      rnorm(n, 0, 0.4),

    reflective_revision =
      reflective_evaluation - intuitive_appraisal,

    revision_magnitude = abs(reflective_revision),

    evaluation_band = case_when(
      final_moral_evaluation < -0.75 ~ "Low moral condemnation",
      final_moral_evaluation < 0.25 ~ "Moderate moral evaluation",
      final_moral_evaluation < 1.0 ~ "High moral concern",
      TRUE ~ "Very high moral concern"
    )
  )

model_final <- lm(
  final_moral_evaluation ~ intuitive_appraisal +
    reflective_evaluation + intuition_weight +
    group_identity_pressure + institutional_review,
  data = df
)

final_results <- tidy(model_final, conf.int = TRUE)
final_fit <- glance(model_final)

model_revision <- lm(
  reflective_revision ~ principled_reasoning +
    evidential_reconsideration + contextual_knowledge +
    cultural_framing + institutional_review +
    group_identity_pressure,
  data = df
)

revision_results <- tidy(model_revision, conf.int = TRUE)
revision_fit <- glance(model_revision)

model_weight <- lm(
  intuition_weight ~ affective_activation +
    social_salience + group_identity_pressure +
    evidential_reconsideration + time_for_reflection,
  data = df
)

weight_results <- tidy(model_weight, conf.int = TRUE)
weight_fit <- glance(model_weight)

evaluation_summary <- df |>
  group_by(evaluation_band) |>
  summarize(
    mean_intuitive = mean(intuitive_appraisal),
    mean_reflective = mean(reflective_evaluation),
    mean_intuition_weight = mean(intuition_weight),
    mean_revision = mean(reflective_revision),
    mean_revision_magnitude = mean(revision_magnitude),
    mean_group_pressure = mean(group_identity_pressure),
    mean_institutional_review = mean(institutional_review),
    .groups = "drop"
  )

plot_eval <- ggplot(
  df,
  aes(x = intuitive_appraisal, y = reflective_evaluation)
) +
  geom_point(alpha = 0.20) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Intuitive Appraisal and Reflective Evaluation",
    subtitle = "Moral evaluation often combines rather than replaces these processes",
    x = "Intuitive appraisal",
    y = "Reflective evaluation"
  ) +
  theme_minimal(base_size = 12)

plot_revision <- ggplot(
  df,
  aes(x = intuition_weight, y = revision_magnitude)
) +
  geom_point(alpha = 0.20) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Intuition Weight and Reflective Revision",
    subtitle = "The relationship between first-pass appraisal and later revision can be modeled directly",
    x = "Intuition weight",
    y = "Reflective revision magnitude"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "intuition_reflection_moral_evaluation_simulated_data.csv"))
write_csv(final_results, file.path(output_tables, "intuition_reflection_final_model.csv"))
write_csv(final_fit, file.path(output_tables, "intuition_reflection_final_model_fit.csv"))
write_csv(revision_results, file.path(output_tables, "intuition_reflection_revision_model.csv"))
write_csv(revision_fit, file.path(output_tables, "intuition_reflection_revision_model_fit.csv"))
write_csv(weight_results, file.path(output_tables, "intuition_reflection_weight_model.csv"))
write_csv(weight_fit, file.path(output_tables, "intuition_reflection_weight_model_fit.csv"))
write_csv(evaluation_summary, file.path(output_tables, "intuition_reflection_evaluation_summary.csv"))

ggsave(
  filename = file.path(output_figures, "intuition_reflection_structure.png"),
  plot = plot_eval,
  width = 10,
  height = 6,
  dpi = 300
)

ggsave(
  filename = file.path(output_figures, "intuition_weight_revision_magnitude.png"),
  plot = plot_revision,
  width = 10,
  height = 6,
  dpi = 300
)

print(final_results)
print(revision_results)
print(weight_results)
print(evaluation_summary)
