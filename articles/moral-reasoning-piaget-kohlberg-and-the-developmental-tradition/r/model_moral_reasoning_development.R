# Moral Reasoning: Piaget, Kohlberg, and the Developmental Tradition
# Synthetic R workflow for modeling developmental shifts in moral reasoning.
# Educational and reproducible research scaffold only.

suppressPackageStartupMessages({
  library(tidyverse)
  library(MASS)
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

n <- 2200

df <- tibble(
  case_id = 1:n,
  age = runif(n, min = 6, max = 25),
  perspective_taking = rnorm(n, 0, 1),
  norm_exposure = rnorm(n, 0, 1),
  domain_differentiation = rnorm(n, 0, 1),
  relational_orientation = rnorm(n, 0, 1),
  authority_orientation = rnorm(n, 0, 1),
  peer_cooperation = rnorm(n, 0, 1),
  cultural_context_support = rnorm(n, 0, 1)
) |>
  mutate(
    latent_reasoning =
      0.10 * age +
      0.55 * perspective_taking +
      0.35 * norm_exposure +
      0.45 * domain_differentiation +
      0.25 * peer_cooperation +
      0.20 * cultural_context_support -
      0.20 * authority_orientation +
      rnorm(n, 0, 1),

    justice_reasoning =
      0.60 * latent_reasoning +
      0.25 * perspective_taking +
      0.20 * domain_differentiation +
      rnorm(n, 0, 0.8),

    care_reasoning =
      0.35 * latent_reasoning +
      0.50 * relational_orientation +
      0.20 * perspective_taking +
      rnorm(n, 0, 0.8),

    conventional_sensitivity =
      0.25 * latent_reasoning +
      0.45 * norm_exposure +
      0.35 * authority_orientation -
      0.25 * domain_differentiation +
      rnorm(n, 0, 0.8),

    autonomy_orientation =
      0.40 * latent_reasoning +
      0.35 * domain_differentiation +
      0.25 * peer_cooperation -
      0.20 * authority_orientation +
      rnorm(n, 0, 0.8),

    reasoning_stage = case_when(
      latent_reasoning < -0.75 ~ "Stage_1_2",
      latent_reasoning < 0.25 ~ "Stage_3_4",
      TRUE ~ "Stage_5_6"
    ),

    reasoning_stage = factor(
      reasoning_stage,
      levels = c("Stage_1_2", "Stage_3_4", "Stage_5_6"),
      ordered = TRUE
    ),

    developmental_band = case_when(
      age < 10 ~ "Childhood",
      age < 14 ~ "Early adolescence",
      age < 18 ~ "Adolescence",
      TRUE ~ "Young adulthood"
    )
  )

model_stage <- polr(
  reasoning_stage ~ age + perspective_taking +
    norm_exposure + domain_differentiation +
    relational_orientation + authority_orientation +
    peer_cooperation + cultural_context_support,
  data = df,
  Hess = TRUE
)

stage_results <- broom::tidy(model_stage)

model_justice <- lm(
  justice_reasoning ~ age + perspective_taking +
    domain_differentiation + norm_exposure,
  data = df
)

model_care <- lm(
  care_reasoning ~ age + relational_orientation +
    perspective_taking + peer_cooperation,
  data = df
)

model_convention <- lm(
  conventional_sensitivity ~ age + norm_exposure +
    authority_orientation + domain_differentiation,
  data = df
)

justice_results <- tidy(model_justice, conf.int = TRUE)
care_results <- tidy(model_care, conf.int = TRUE)
convention_results <- tidy(model_convention, conf.int = TRUE)

pred_grid <- expand_grid(
  age = seq(6, 25, length.out = 120),
  perspective_taking = c(-1, 0, 1),
  norm_exposure = 0,
  domain_differentiation = 0,
  relational_orientation = 0,
  authority_orientation = 0,
  peer_cooperation = 0,
  cultural_context_support = 0
)

pred_probs <- predict(model_stage, newdata = pred_grid, type = "probs")

pred_df <- bind_cols(pred_grid, as_tibble(pred_probs)) |>
  pivot_longer(
    cols = c(Stage_1_2, Stage_3_4, Stage_5_6),
    names_to = "stage",
    values_to = "probability"
  ) |>
  mutate(
    perspective_label = case_when(
      perspective_taking == -1 ~ "Low perspective-taking",
      perspective_taking == 0 ~ "Average perspective-taking",
      TRUE ~ "High perspective-taking"
    )
  )

stage_summary <- df |>
  group_by(reasoning_stage) |>
  summarize(
    mean_age = mean(age),
    mean_perspective_taking = mean(perspective_taking),
    mean_domain_differentiation = mean(domain_differentiation),
    mean_justice = mean(justice_reasoning),
    mean_care = mean(care_reasoning),
    mean_conventional = mean(conventional_sensitivity),
    mean_autonomy = mean(autonomy_orientation),
    .groups = "drop"
  )

band_summary <- df |>
  group_by(developmental_band) |>
  summarize(
    mean_latent_reasoning = mean(latent_reasoning),
    mean_justice = mean(justice_reasoning),
    mean_care = mean(care_reasoning),
    mean_conventional = mean(conventional_sensitivity),
    mean_domain_differentiation = mean(domain_differentiation),
    .groups = "drop"
  )

plot_stage <- ggplot(pred_df, aes(x = age, y = probability)) +
  geom_line(linewidth = 1) +
  facet_grid(stage ~ perspective_label) +
  labs(
    title = "Predicted Developmental Shifts in Moral Reasoning",
    subtitle = "Ordered probabilities across age and perspective-taking",
    x = "Age",
    y = "Predicted probability"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "moral_reasoning_development_simulated_data.csv"))
write_csv(stage_results, file.path(output_tables, "moral_reasoning_ordinal_model_results.csv"))
write_csv(justice_results, file.path(output_tables, "moral_reasoning_justice_model_results.csv"))
write_csv(care_results, file.path(output_tables, "moral_reasoning_care_model_results.csv"))
write_csv(convention_results, file.path(output_tables, "moral_reasoning_convention_model_results.csv"))
write_csv(pred_df, file.path(output_tables, "moral_reasoning_predicted_stage_probabilities.csv"))
write_csv(stage_summary, file.path(output_tables, "moral_reasoning_stage_summary.csv"))
write_csv(band_summary, file.path(output_tables, "moral_reasoning_developmental_band_summary.csv"))

ggsave(
  filename = file.path(output_figures, "moral_reasoning_stage_probabilities.png"),
  plot = plot_stage,
  width = 11,
  height = 8,
  dpi = 300
)

print(stage_results)
print(stage_summary)
print(band_summary)
