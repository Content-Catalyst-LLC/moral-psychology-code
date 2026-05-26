# Hypocrisy, Dehumanization, and the Psychology of Moral Failure
# Synthetic R workflow for modeling moral double standards and moral exclusion.
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
  judgment_other = rnorm(n, 0, 1),
  judgment_self = rnorm(n, 0, 1),
  perceived_humanness = rnorm(n, 0, 1),
  ingroup_bias = rnorm(n, 0, 1),
  empathic_recognition = rnorm(n, 0, 1),
  public_value_claim = rnorm(n, 0, 1),
  actual_practice_integrity = rnorm(n, 0, 1),
  accountability_strength = rnorm(n, 0, 1),
  victim_visibility = rnorm(n, 0, 1)
) |>
  mutate(
    hypocrisy =
      judgment_other - judgment_self,

    dehumanization =
      1 - perceived_humanness,

    institutional_hypocrisy =
      public_value_claim - actual_practice_integrity,

    failure_latent =
      0.45 * hypocrisy +
      0.40 * dehumanization +
      0.30 * ingroup_bias +
      0.25 * institutional_hypocrisy -
      0.35 * empathic_recognition -
      0.25 * accountability_strength -
      0.20 * victim_visibility +
      rnorm(n, 0, 0.8),

    moral_failure_probability = plogis(failure_latent),
    moral_failure = if_else(moral_failure_probability >= 0.5, 1, 0)
  )

model_failure <- glm(
  moral_failure ~ hypocrisy + dehumanization +
    ingroup_bias + institutional_hypocrisy +
    empathic_recognition + accountability_strength +
    victim_visibility,
  data = df,
  family = binomial()
)

failure_summary <- tidy(
  model_failure,
  conf.int = TRUE,
  exponentiate = TRUE
)

failure_fit <- glance(model_failure)

hypocrisy_summary <- df |>
  mutate(
    hypocrisy_group = ntile(hypocrisy, 4),
    hypocrisy_group = factor(
      hypocrisy_group,
      labels = c("Low", "Lower-middle", "Upper-middle", "High")
    )
  ) |>
  group_by(hypocrisy_group) |>
  summarize(
    mean_failure_prob = mean(moral_failure_probability),
    failure_rate = mean(moral_failure),
    mean_dehumanization = mean(dehumanization),
    mean_empathy = mean(empathic_recognition),
    mean_institutional_hypocrisy = mean(institutional_hypocrisy),
    .groups = "drop"
  )

pred_grid <- expand_grid(
  hypocrisy = seq(-2, 2, length.out = 100),
  dehumanization = c(-1, 0, 1),
  ingroup_bias = 0,
  institutional_hypocrisy = 0,
  empathic_recognition = 0,
  accountability_strength = 0,
  victim_visibility = 0
)

pred_grid$predicted_failure_prob <- predict(
  model_failure,
  newdata = pred_grid,
  type = "response"
)

pred_grid <- pred_grid |>
  mutate(
    dehumanization_label = case_when(
      dehumanization == -1 ~ "Low dehumanization",
      dehumanization == 0 ~ "Average dehumanization",
      TRUE ~ "High dehumanization"
    )
  )

plot_failure <- ggplot(
  pred_grid,
  aes(x = hypocrisy, y = predicted_failure_prob)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ dehumanization_label) +
  labs(
    title = "Predicted Moral Failure from Hypocrisy and Dehumanization",
    subtitle = "Double standards and moral exclusion reinforce one another",
    x = "Hypocrisy",
    y = "Probability of moral failure"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "hypocrisy_dehumanization_simulated_data.csv"))
write_csv(failure_summary, file.path(output_tables, "hypocrisy_dehumanization_model.csv"))
write_csv(failure_fit, file.path(output_tables, "hypocrisy_dehumanization_model_fit.csv"))
write_csv(hypocrisy_summary, file.path(output_tables, "hypocrisy_group_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "hypocrisy_dehumanization_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_moral_failure_by_hypocrisy_and_dehumanization.png"),
  plot = plot_failure,
  width = 10,
  height = 6,
  dpi = 300
)

print(failure_summary)
print(failure_fit)
print(hypocrisy_summary)
