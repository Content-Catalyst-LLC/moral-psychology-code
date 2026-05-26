# Cross-Cultural Moral Psychology
# Synthetic R workflow for cross-cultural moral-profile modeling.
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
  participant_id = 1:n,
  culture = sample(c("Context_A", "Context_B", "Context_C"), n, replace = TRUE),
  harm_sensitivity = rnorm(n, 0, 1),
  fairness_sensitivity = rnorm(n, 0, 1),
  loyalty_sensitivity = rnorm(n, 0, 1),
  authority_sensitivity = rnorm(n, 0, 1),
  purity_sensitivity = rnorm(n, 0, 1),
  relational_obligation = rnorm(n, 0, 1),
  norm_learning = rnorm(n, 0, 1),
  sanction_expectation = rnorm(n, 0, 1)
) |>
  mutate(
    moral_judgment = case_when(
      culture == "Context_A" ~
        0.45 * harm_sensitivity +
        0.30 * fairness_sensitivity +
        0.10 * loyalty_sensitivity +
        0.10 * authority_sensitivity +
        0.05 * purity_sensitivity +
        0.10 * relational_obligation +
        0.15 * norm_learning +
        rnorm(n, 0, 0.8),

      culture == "Context_B" ~
        0.25 * harm_sensitivity +
        0.20 * fairness_sensitivity +
        0.30 * loyalty_sensitivity +
        0.25 * authority_sensitivity +
        0.20 * purity_sensitivity +
        0.25 * relational_obligation +
        0.15 * norm_learning +
        rnorm(n, 0, 0.8),

      TRUE ~
        0.30 * harm_sensitivity +
        0.25 * fairness_sensitivity +
        0.25 * loyalty_sensitivity +
        0.20 * authority_sensitivity +
        0.15 * purity_sensitivity +
        0.20 * relational_obligation +
        0.15 * norm_learning +
        rnorm(n, 0, 0.8)
    ),

    norm_enforcement_tendency = plogis(
      0.25 * sanction_expectation +
      0.25 * norm_learning +
      0.20 * authority_sensitivity +
      0.20 * loyalty_sensitivity +
      0.15 * relational_obligation
    )
  )

model_culture <- lm(
  moral_judgment ~ culture + harm_sensitivity + fairness_sensitivity +
    loyalty_sensitivity + authority_sensitivity + purity_sensitivity +
    relational_obligation + norm_learning,
  data = df
)

culture_summary <- tidy(model_culture, conf.int = TRUE)
culture_fit <- glance(model_culture)

model_enforcement <- lm(
  norm_enforcement_tendency ~ culture + sanction_expectation +
    norm_learning + authority_sensitivity + loyalty_sensitivity +
    relational_obligation,
  data = df
)

enforcement_summary <- tidy(model_enforcement, conf.int = TRUE)

culture_profile_summary <- df |>
  group_by(culture) |>
  summarize(
    mean_judgment = mean(moral_judgment),
    mean_harm = mean(harm_sensitivity),
    mean_fairness = mean(fairness_sensitivity),
    mean_loyalty = mean(loyalty_sensitivity),
    mean_authority = mean(authority_sensitivity),
    mean_purity = mean(purity_sensitivity),
    mean_relational_obligation = mean(relational_obligation),
    mean_norm_enforcement = mean(norm_enforcement_tendency),
    .groups = "drop"
  )

pred_grid <- expand_grid(
  harm_sensitivity = seq(-2, 2, length.out = 100),
  culture = c("Context_A", "Context_B", "Context_C"),
  fairness_sensitivity = 0,
  loyalty_sensitivity = 0,
  authority_sensitivity = 0,
  purity_sensitivity = 0,
  relational_obligation = 0,
  norm_learning = 0
)

pred_grid$predicted_judgment <- predict(
  model_culture,
  newdata = pred_grid
)

plot_cultural_profiles <- ggplot(
  pred_grid,
  aes(x = harm_sensitivity, y = predicted_judgment)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ culture) +
  labs(
    title = "Predicted Moral Judgment Across Cultural Contexts",
    subtitle = "Shared moral dimensions receive different weights across contexts",
    x = "Harm sensitivity",
    y = "Predicted moral judgment"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "cross_cultural_moral_profiles_simulated_data.csv"))
write_csv(culture_summary, file.path(output_tables, "cross_cultural_moral_model.csv"))
write_csv(culture_fit, file.path(output_tables, "cross_cultural_moral_model_fit.csv"))
write_csv(enforcement_summary, file.path(output_tables, "cross_cultural_norm_enforcement_model.csv"))
write_csv(culture_profile_summary, file.path(output_tables, "cross_cultural_moral_profile_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "cross_cultural_moral_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_cross_cultural_moral_judgment.png"),
  plot = plot_cultural_profiles,
  width = 10,
  height = 6,
  dpi = 300
)

print(culture_summary)
print(enforcement_summary)
print(culture_profile_summary)
