# Prosocial Behavior, Altruism, and Care for Others
# Synthetic R workflow for modeling helping, altruistic motive, and care.
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
  empathic_concern = rnorm(n, 0, 1),
  norm_strength = rnorm(n, 0, 1),
  relational_closeness = rnorm(n, 0, 1),
  visible_vulnerability = rnorm(n, 0, 1),
  perceived_cost = rnorm(n, 0, 1),
  other_oriented_desire = rnorm(n, 0, 1),
  self_oriented_payoff = rnorm(n, 0, 1),
  attentional_responsiveness = rnorm(n, 0, 1),
  ongoing_need = rnorm(n, 0, 1),
  burnout = rnorm(n, 0, 1),
  institutional_support = rnorm(n, 0, 1),
  voice_safety = rnorm(n, 0, 1)
) |>
  mutate(
    action_latent =
      0.40 * empathic_concern +
      0.30 * norm_strength +
      0.25 * relational_closeness +
      0.30 * visible_vulnerability -
      0.35 * perceived_cost +
      0.18 * institutional_support +
      rnorm(n, 0, 0.8),

    prosocial_probability = plogis(action_latent),
    prosocial_action = if_else(prosocial_probability >= 0.5, 1, 0),

    altruistic_motive =
      0.55 * other_oriented_desire -
      0.35 * self_oriented_payoff +
      0.20 * empathic_concern +
      rnorm(n, 0, 0.8),

    caregiving_persistence =
      0.35 * attentional_responsiveness +
      0.40 * ongoing_need -
      0.30 * burnout +
      0.25 * institutional_support +
      0.15 * voice_safety +
      rnorm(n, 0, 0.8),

    cost_band = case_when(
      perceived_cost < -0.75 ~ "Low cost",
      perceived_cost < 0.25 ~ "Moderate cost",
      perceived_cost < 1.0 ~ "High cost",
      TRUE ~ "Very high cost"
    ),

    burnout_band = case_when(
      burnout < -0.75 ~ "Low burnout",
      burnout < 0.25 ~ "Moderate burnout",
      burnout < 1.0 ~ "High burnout",
      TRUE ~ "Very high burnout"
    )
  )

model_help <- glm(
  prosocial_action ~ empathic_concern + norm_strength +
    relational_closeness + visible_vulnerability +
    perceived_cost + institutional_support,
  data = df,
  family = binomial()
)

help_results <- tidy(
  model_help,
  conf.int = TRUE,
  exponentiate = TRUE
)

help_fit <- glance(model_help)

model_altruism <- lm(
  altruistic_motive ~ other_oriented_desire +
    self_oriented_payoff + empathic_concern,
  data = df
)

altruism_results <- tidy(model_altruism, conf.int = TRUE)
altruism_fit <- glance(model_altruism)

model_care <- lm(
  caregiving_persistence ~ attentional_responsiveness +
    ongoing_need + burnout + institutional_support + voice_safety,
  data = df
)

care_results <- tidy(model_care, conf.int = TRUE)
care_fit <- glance(model_care)

cost_summary <- df |>
  group_by(cost_band) |>
  summarize(
    mean_empathy = mean(empathic_concern),
    mean_norm_strength = mean(norm_strength),
    mean_vulnerability = mean(visible_vulnerability),
    mean_cost = mean(perceived_cost),
    mean_help_probability = mean(prosocial_probability),
    action_rate = mean(prosocial_action),
    .groups = "drop"
  )

burnout_summary <- df |>
  group_by(burnout_band) |>
  summarize(
    mean_attention = mean(attentional_responsiveness),
    mean_ongoing_need = mean(ongoing_need),
    mean_support = mean(institutional_support),
    mean_voice_safety = mean(voice_safety),
    mean_burnout = mean(burnout),
    mean_care_persistence = mean(caregiving_persistence),
    .groups = "drop"
  )

pred_grid <- expand_grid(
  empathic_concern = seq(-2, 2, length.out = 120),
  perceived_cost = c(-1, 0, 1),
  norm_strength = 0,
  relational_closeness = 0,
  visible_vulnerability = 0,
  institutional_support = 0
)

pred_grid$predicted_help_prob <- predict(
  model_help,
  newdata = pred_grid,
  type = "response"
)

pred_grid <- pred_grid |>
  mutate(
    cost_label = case_when(
      perceived_cost == -1 ~ "Low cost",
      perceived_cost == 0 ~ "Average cost",
      TRUE ~ "High cost"
    )
  )

plot_help <- ggplot(
  pred_grid,
  aes(x = empathic_concern, y = predicted_help_prob)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ cost_label) +
  labs(
    title = "Predicted Prosocial Action from Empathy and Cost",
    subtitle = "Empathic concern increases helping, but perceived cost constrains it",
    x = "Empathic concern",
    y = "Probability of prosocial action"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "prosocial_behavior_simulated_data.csv"))
write_csv(help_results, file.path(output_tables, "prosocial_help_model.csv"))
write_csv(help_fit, file.path(output_tables, "prosocial_help_model_fit.csv"))
write_csv(altruism_results, file.path(output_tables, "altruistic_motive_model.csv"))
write_csv(altruism_fit, file.path(output_tables, "altruistic_motive_model_fit.csv"))
write_csv(care_results, file.path(output_tables, "caregiving_persistence_model.csv"))
write_csv(care_fit, file.path(output_tables, "caregiving_persistence_model_fit.csv"))
write_csv(cost_summary, file.path(output_tables, "prosocial_cost_summary.csv"))
write_csv(burnout_summary, file.path(output_tables, "caregiving_burnout_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "prosocial_help_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_prosocial_action_empathy_cost.png"),
  plot = plot_help,
  width = 10,
  height = 6,
  dpi = 300
)

print(help_results)
print(altruism_results)
print(care_results)
print(cost_summary)
print(burnout_summary)
