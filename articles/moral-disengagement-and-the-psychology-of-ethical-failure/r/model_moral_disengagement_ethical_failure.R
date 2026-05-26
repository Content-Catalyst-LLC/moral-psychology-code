# Moral Disengagement and the Psychology of Ethical Failure
# Synthetic R workflow for modeling moral disengagement and unethical action.
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
  moral_justification = rnorm(n, 0, 1),
  euphemistic_language = rnorm(n, 0, 1),
  advantageous_comparison = rnorm(n, 0, 1),
  responsibility_shifting = rnorm(n, 0, 1),
  consequence_distortion = rnorm(n, 0, 1),
  dehumanization = rnorm(n, 0, 1),
  victim_blaming = rnorm(n, 0, 1),
  anticipated_guilt = rnorm(n, 0, 1),
  institutional_pressure = rnorm(n, 0, 1),
  consequence_visibility = rnorm(n, 0, 1),
  victim_recognition = rnorm(n, 0, 1),
  accountability_strength = rnorm(n, 0, 1)
) |>
  mutate(
    moral_disengagement =
      0.30 * moral_justification +
      0.25 * euphemistic_language +
      0.20 * advantageous_comparison +
      0.30 * responsibility_shifting +
      0.25 * consequence_distortion +
      0.25 * dehumanization +
      0.20 * victim_blaming -
      0.20 * consequence_visibility -
      0.20 * victim_recognition +
      rnorm(n, 0, 0.8),

    action_latent =
      0.55 * moral_disengagement -
      0.35 * anticipated_guilt +
      0.30 * institutional_pressure -
      0.25 * accountability_strength +
      rnorm(n, 0, 0.8),

    unethical_action_probability = plogis(action_latent),
    unethical_action = if_else(unethical_action_probability >= 0.5, 1, 0)
  )

model_disengagement <- lm(
  moral_disengagement ~ moral_justification + euphemistic_language +
    advantageous_comparison + responsibility_shifting +
    consequence_distortion + dehumanization + victim_blaming +
    consequence_visibility + victim_recognition,
  data = df
)

disengagement_summary <- tidy(model_disengagement, conf.int = TRUE)
disengagement_fit <- glance(model_disengagement)

model_action <- glm(
  unethical_action ~ moral_disengagement + anticipated_guilt +
    institutional_pressure + accountability_strength,
  data = df,
  family = binomial()
)

action_summary <- tidy(
  model_action,
  conf.int = TRUE,
  exponentiate = TRUE
)

action_fit <- glance(model_action)

disengagement_summary_table <- df |>
  mutate(
    disengagement_group = ntile(moral_disengagement, 4),
    disengagement_group = factor(
      disengagement_group,
      labels = c("Low", "Lower-middle", "Upper-middle", "High")
    )
  ) |>
  group_by(disengagement_group) |>
  summarize(
    mean_action_prob = mean(unethical_action_probability),
    action_rate = mean(unethical_action),
    mean_pressure = mean(institutional_pressure),
    mean_guilt = mean(anticipated_guilt),
    mean_accountability = mean(accountability_strength),
    mean_victim_recognition = mean(victim_recognition),
    .groups = "drop"
  )

pred_grid <- expand_grid(
  moral_disengagement = seq(-2, 2, length.out = 100),
  anticipated_guilt = c(-1, 0, 1),
  institutional_pressure = 0,
  accountability_strength = 0
)

pred_grid$predicted_action_prob <- predict(
  model_action,
  newdata = pred_grid,
  type = "response"
)

pred_grid <- pred_grid |>
  mutate(
    guilt_label = case_when(
      anticipated_guilt == -1 ~ "Low anticipated guilt",
      anticipated_guilt == 0 ~ "Average anticipated guilt",
      TRUE ~ "High anticipated guilt"
    )
  )

plot_action <- ggplot(
  pred_grid,
  aes(x = moral_disengagement, y = predicted_action_prob)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ guilt_label) +
  labs(
    title = "Predicted Unethical Action from Moral Disengagement",
    subtitle = "Anticipated guilt reduces, but does not eliminate, the effect",
    x = "Moral disengagement",
    y = "Probability of unethical action"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "moral_disengagement_simulated_data.csv"))
write_csv(disengagement_summary, file.path(output_tables, "moral_disengagement_structure_model.csv"))
write_csv(disengagement_fit, file.path(output_tables, "moral_disengagement_structure_model_fit.csv"))
write_csv(action_summary, file.path(output_tables, "moral_disengagement_action_model.csv"))
write_csv(action_fit, file.path(output_tables, "moral_disengagement_action_model_fit.csv"))
write_csv(disengagement_summary_table, file.path(output_tables, "moral_disengagement_group_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "moral_disengagement_action_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_unethical_action_by_disengagement_and_guilt.png"),
  plot = plot_action,
  width = 10,
  height = 6,
  dpi = 300
)

print(disengagement_summary)
print(action_summary)
print(disengagement_summary_table)
