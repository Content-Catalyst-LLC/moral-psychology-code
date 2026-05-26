# Conscience, Guilt, Shame, and Moral Self-Evaluation
# Synthetic R workflow for modeling conscience, guilt, shame, repair, and avoidance.
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
  perceived_responsibility = rnorm(n, 0, 1),
  exposure_before_others = rnorm(n, 0, 1),
  norm_internalization = rnorm(n, 0, 1),
  global_self_condemnation = rnorm(n, 0, 1),
  empathic_acknowledgment = rnorm(n, 0, 1),
  repair_pathway = rnorm(n, 0, 1),
  agency_capacity = rnorm(n, 0, 1),
  defensiveness = rnorm(n, 0, 1)
) |>
  mutate(
    guilt =
      0.55 * perceived_wrongdoing +
      0.50 * perceived_responsibility +
      0.25 * norm_internalization +
      0.15 * agency_capacity +
      rnorm(n, 0, 0.8),

    shame =
      0.55 * global_self_condemnation +
      0.45 * exposure_before_others +
      0.20 * norm_internalization -
      0.10 * agency_capacity +
      rnorm(n, 0, 0.8),

    conscience_activation =
      0.40 * guilt +
      0.35 * shame +
      0.25 * norm_internalization +
      0.20 * perceived_responsibility +
      rnorm(n, 0, 0.7),

    repair_latent =
      0.50 * guilt -
      0.30 * shame +
      0.35 * empathic_acknowledgment +
      0.30 * repair_pathway +
      0.20 * agency_capacity -
      0.25 * defensiveness +
      rnorm(n, 0, 0.8),

    avoidance_latent =
      0.45 * shame -
      0.20 * guilt -
      0.20 * repair_pathway -
      0.20 * agency_capacity +
      0.30 * defensiveness +
      rnorm(n, 0, 0.8),

    repair_action = if_else(repair_latent > 0, 1, 0),
    avoidance_action = if_else(avoidance_latent > 0, 1, 0),

    conscience_band = case_when(
      conscience_activation < -0.75 ~ "Low conscience activation",
      conscience_activation < 0.25 ~ "Moderate conscience activation",
      conscience_activation < 1.0 ~ "High conscience activation",
      TRUE ~ "Very high conscience activation"
    ),

    shame_band = case_when(
      shame < -0.75 ~ "Low shame",
      shame < 0.25 ~ "Moderate shame",
      shame < 1.0 ~ "High shame",
      TRUE ~ "Very high shame"
    )
  )

model_guilt <- lm(
  guilt ~ perceived_wrongdoing + perceived_responsibility +
    norm_internalization + agency_capacity,
  data = df
)

model_shame <- lm(
  shame ~ global_self_condemnation + exposure_before_others +
    norm_internalization + agency_capacity,
  data = df
)

guilt_results <- tidy(model_guilt, conf.int = TRUE)
shame_results <- tidy(model_shame, conf.int = TRUE)

guilt_fit <- glance(model_guilt)
shame_fit <- glance(model_shame)

model_repair <- glm(
  repair_action ~ guilt + shame + empathic_acknowledgment +
    repair_pathway + agency_capacity + defensiveness,
  data = df,
  family = binomial()
)

model_avoidance <- glm(
  avoidance_action ~ guilt + shame + repair_pathway +
    agency_capacity + defensiveness,
  data = df,
  family = binomial()
)

repair_results <- tidy(
  model_repair,
  conf.int = TRUE,
  exponentiate = TRUE
)

avoidance_results <- tidy(
  model_avoidance,
  conf.int = TRUE,
  exponentiate = TRUE
)

repair_fit <- glance(model_repair)
avoidance_fit <- glance(model_avoidance)

conscience_summary <- df |>
  group_by(conscience_band) |>
  summarize(
    mean_guilt = mean(guilt),
    mean_shame = mean(shame),
    mean_responsibility = mean(perceived_responsibility),
    mean_agency = mean(agency_capacity),
    repair_rate = mean(repair_action),
    avoidance_rate = mean(avoidance_action),
    .groups = "drop"
  )

shame_summary <- df |>
  group_by(shame_band) |>
  summarize(
    mean_guilt = mean(guilt),
    mean_shame = mean(shame),
    mean_exposure = mean(exposure_before_others),
    mean_defensiveness = mean(defensiveness),
    repair_rate = mean(repair_action),
    avoidance_rate = mean(avoidance_action),
    .groups = "drop"
  )

pred_grid <- expand_grid(
  guilt = seq(-2, 2, length.out = 120),
  shame = c(-1, 0, 1),
  empathic_acknowledgment = 0,
  repair_pathway = 0,
  agency_capacity = 0,
  defensiveness = 0
)

pred_grid$predicted_repair <- predict(
  model_repair,
  newdata = pred_grid,
  type = "response"
)

pred_grid <- pred_grid |>
  mutate(
    shame_label = case_when(
      shame == -1 ~ "Low shame",
      shame == 0 ~ "Average shame",
      TRUE ~ "High shame"
    )
  )

plot_repair <- ggplot(
  pred_grid,
  aes(x = guilt, y = predicted_repair)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ shame_label) +
  labs(
    title = "Predicted Repair Action from Guilt and Shame",
    subtitle = "Guilt supports repair most when shame does not overwhelm agency",
    x = "Guilt",
    y = "Probability of repair action"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "conscience_guilt_shame_simulated_data.csv"))
write_csv(guilt_results, file.path(output_tables, "conscience_guilt_model.csv"))
write_csv(guilt_fit, file.path(output_tables, "conscience_guilt_model_fit.csv"))
write_csv(shame_results, file.path(output_tables, "conscience_shame_model.csv"))
write_csv(shame_fit, file.path(output_tables, "conscience_shame_model_fit.csv"))
write_csv(repair_results, file.path(output_tables, "conscience_repair_model.csv"))
write_csv(repair_fit, file.path(output_tables, "conscience_repair_model_fit.csv"))
write_csv(avoidance_results, file.path(output_tables, "conscience_avoidance_model.csv"))
write_csv(avoidance_fit, file.path(output_tables, "conscience_avoidance_model_fit.csv"))
write_csv(conscience_summary, file.path(output_tables, "conscience_activation_summary.csv"))
write_csv(shame_summary, file.path(output_tables, "conscience_shame_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "conscience_repair_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_repair_from_guilt_and_shame.png"),
  plot = plot_repair,
  width = 10,
  height = 6,
  dpi = 300
)

print(guilt_results)
print(shame_results)
print(repair_results)
print(avoidance_results)
print(conscience_summary)
print(shame_summary)
