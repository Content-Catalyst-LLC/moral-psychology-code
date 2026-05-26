# Experimental Moral Psychology and Ethical Intuition
# Synthetic R workflow for experimental moral-judgment modeling.
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
  intuition_strength = rnorm(n, 0, 1),
  reflection_strength = rnorm(n, 0, 1),
  norm_sensitivity = rnorm(n, 0, 1),
  consequence_sensitivity = rnorm(n, 0, 1),
  intentionality = rnorm(n, 0, 1),
  excuse_strength = rnorm(n, 0, 1),
  group_identity_salience = rnorm(n, 0, 1),
  power_condition = sample(c("low_power", "control", "high_power"), n, replace = TRUE)
) |>
  mutate(
    power_norm_shift = case_when(
      power_condition == "high_power" ~ -0.20,
      power_condition == "low_power" ~ 0.10,
      TRUE ~ 0
    ),

    moral_judgment =
      0.30 * intuition_strength +
      0.20 * reflection_strength +
      0.25 * norm_sensitivity +
      0.25 * consequence_sensitivity +
      0.10 * group_identity_salience +
      power_norm_shift +
      rnorm(n, 0, 0.8),

    blame_latent =
      0.35 * moral_judgment +
      0.30 * intentionality -
      0.25 * excuse_strength +
      0.10 * norm_sensitivity +
      rnorm(n, 0, 0.8),

    blame_probability = plogis(blame_latent),
    blame_assigned = if_else(blame_probability >= 0.5, 1, 0)
  )

model_judgment <- lm(
  moral_judgment ~ intuition_strength + reflection_strength +
    norm_sensitivity + consequence_sensitivity +
    group_identity_salience + power_condition,
  data = df
)

judgment_summary <- tidy(model_judgment, conf.int = TRUE)
judgment_fit <- glance(model_judgment)

model_blame <- glm(
  blame_assigned ~ moral_judgment + intentionality +
    excuse_strength + norm_sensitivity,
  data = df,
  family = binomial()
)

blame_summary <- tidy(model_blame, conf.int = TRUE, exponentiate = TRUE)

pred_grid <- expand_grid(
  intuition_strength = seq(-2, 2, length.out = 100),
  reflection_strength = c(-1, 0, 1),
  norm_sensitivity = 0,
  consequence_sensitivity = 0,
  group_identity_salience = 0,
  power_condition = "control"
)

pred_grid$predicted_judgment <- predict(
  model_judgment,
  newdata = pred_grid
)

pred_grid <- pred_grid |>
  mutate(
    reflection_label = case_when(
      reflection_strength == -1 ~ "Low reflection",
      reflection_strength == 0 ~ "Average reflection",
      TRUE ~ "High reflection"
    )
  )

condition_summary <- df |>
  group_by(power_condition) |>
  summarize(
    mean_judgment = mean(moral_judgment),
    mean_blame_probability = mean(blame_probability),
    mean_norm_sensitivity = mean(norm_sensitivity),
    mean_consequence_sensitivity = mean(consequence_sensitivity),
    .groups = "drop"
  )

plot_predicted_judgment <- ggplot(
  pred_grid,
  aes(x = intuition_strength, y = predicted_judgment)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ reflection_label) +
  labs(
    title = "Predicted Moral Judgment from Intuition and Reflection",
    subtitle = "Experimental moral judgments are shaped by multiple components",
    x = "Intuition strength",
    y = "Predicted moral judgment"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "experimental_moral_psychology_simulated_data.csv"))
write_csv(judgment_summary, file.path(output_tables, "experimental_moral_judgment_model.csv"))
write_csv(judgment_fit, file.path(output_tables, "experimental_moral_judgment_model_fit.csv"))
write_csv(blame_summary, file.path(output_tables, "experimental_blame_model.csv"))
write_csv(condition_summary, file.path(output_tables, "experimental_condition_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "experimental_moral_judgment_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_judgment_by_intuition_and_reflection.png"),
  plot = plot_predicted_judgment,
  width = 10,
  height = 6,
  dpi = 300
)

print(judgment_summary)
print(blame_summary)
print(condition_summary)
