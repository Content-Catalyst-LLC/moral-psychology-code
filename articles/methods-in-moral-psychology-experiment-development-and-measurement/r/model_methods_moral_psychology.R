# Methods in Moral Psychology:
# Experiment, Development, and Measurement
# Synthetic R workflow for article-level reproducible modeling.
# Educational and methodological scaffold only.

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
  participant_id = 1:n,
  experimental_condition = sample(
    c("control", "intent_salient", "excuse_salient"),
    n,
    replace = TRUE
  ),
  age = runif(n, 8, 70),
  norm_learning = rnorm(n, 0, 1),
  reflection = rnorm(n, 0, 1),
  social_desirability = rnorm(n, 0, 1)
) |>
  mutate(
    wrongness_judgment =
      0.25 * norm_learning +
      0.15 * reflection +
      if_else(experimental_condition == "intent_salient", 0.35, 0) +
      rnorm(n, 0, 0.8),

    blame_judgment =
      0.30 * wrongness_judgment +
      if_else(experimental_condition == "excuse_salient", -0.30, 0) +
      0.10 * age / 10 +
      rnorm(n, 0, 0.8),

    action_tendency =
      0.20 * wrongness_judgment +
      0.20 * blame_judgment +
      0.15 * norm_learning -
      0.10 * social_desirability +
      rnorm(n, 0, 0.8),

    latent_moral_construct =
      0.35 * wrongness_judgment +
      0.30 * blame_judgment +
      0.20 * norm_learning +
      0.15 * action_tendency +
      rnorm(n, 0, 0.8)
  )

model_wrongness <- lm(
  wrongness_judgment ~ experimental_condition + norm_learning + reflection,
  data = df
)

wrongness_summary <- tidy(model_wrongness, conf.int = TRUE)

model_blame <- lm(
  blame_judgment ~ wrongness_judgment + experimental_condition + age,
  data = df
)

blame_summary <- tidy(model_blame, conf.int = TRUE)

model_latent <- lm(
  latent_moral_construct ~ wrongness_judgment + blame_judgment +
    norm_learning + action_tendency + social_desirability,
  data = df
)

latent_summary <- tidy(model_latent, conf.int = TRUE)

pred_grid <- expand_grid(
  age = seq(8, 70, length.out = 100),
  experimental_condition = c("control", "intent_salient", "excuse_salient"),
  wrongness_judgment = 0,
  norm_learning = 0,
  reflection = 0
)

pred_grid$predicted_blame <- predict(
  model_blame,
  newdata = pred_grid
)

condition_summary <- df |>
  group_by(experimental_condition) |>
  summarize(
    mean_age = mean(age),
    mean_wrongness = mean(wrongness_judgment),
    mean_blame = mean(blame_judgment),
    mean_action_tendency = mean(action_tendency),
    mean_latent_construct = mean(latent_moral_construct),
    .groups = "drop"
  )

plot_predicted_blame <- ggplot(
  pred_grid,
  aes(x = age, y = predicted_blame)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ experimental_condition) +
  labs(
    title = "Predicted Blame Across Experimental Conditions and Age",
    subtitle = "Method design and developmental variation jointly shape judgment",
    x = "Age",
    y = "Predicted blame judgment"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "methods_moral_psychology_simulated_data.csv"))
write_csv(wrongness_summary, file.path(output_tables, "methods_moral_psychology_wrongness_model.csv"))
write_csv(blame_summary, file.path(output_tables, "methods_moral_psychology_blame_model.csv"))
write_csv(latent_summary, file.path(output_tables, "methods_moral_psychology_latent_model.csv"))
write_csv(condition_summary, file.path(output_tables, "methods_moral_psychology_condition_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "methods_moral_psychology_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_blame_by_age_and_condition.png"),
  plot = plot_predicted_blame,
  width = 10,
  height = 6,
  dpi = 300
)

print(wrongness_summary)
print(blame_summary)
print(condition_summary)
