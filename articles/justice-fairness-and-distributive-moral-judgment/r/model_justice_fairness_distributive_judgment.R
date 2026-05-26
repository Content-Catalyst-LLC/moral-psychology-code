# Justice, Fairness, and Distributive Moral Judgment
# Synthetic R workflow for modeling distributive moral preferences.
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
  equality_weight = rnorm(n, 0, 1),
  equity_weight = rnorm(n, 0, 1),
  need_weight = rnorm(n, 0, 1),
  desert_weight = rnorm(n, 0, 1),
  priority_worse_off = rnorm(n, 0, 1),
  self_interest_bias = rnorm(n, 0, 1),
  procedural_trust = rnorm(n, 0, 1),
  group_distance = rnorm(n, 0, 1),
  historical_repair_salience = rnorm(n, 0, 1)
) |>
  mutate(
    distributive_judgment =
      0.30 * equality_weight +
      0.25 * equity_weight +
      0.25 * need_weight +
      0.20 * desert_weight +
      0.25 * priority_worse_off -
      0.35 * self_interest_bias +
      0.20 * procedural_trust -
      0.20 * group_distance +
      0.20 * historical_repair_salience +
      rnorm(n, 0, 0.8),

    support_fair_allocation =
      if_else(distributive_judgment > 0, 1, 0),

    inequity_aversion =
      0.45 * abs(equality_weight) +
      0.30 * need_weight -
      0.25 * self_interest_bias +
      rnorm(n, 0, 0.8)
  )

model_judgment <- lm(
  distributive_judgment ~ equality_weight + equity_weight +
    need_weight + desert_weight + priority_worse_off +
    self_interest_bias + procedural_trust + group_distance +
    historical_repair_salience,
  data = df
)

judgment_summary <- tidy(model_judgment, conf.int = TRUE)
judgment_fit <- glance(model_judgment)

model_support <- glm(
  support_fair_allocation ~ equality_weight + equity_weight +
    need_weight + desert_weight + priority_worse_off +
    self_interest_bias + procedural_trust + group_distance +
    historical_repair_salience,
  data = df,
  family = binomial()
)

support_summary <- tidy(
  model_support,
  conf.int = TRUE,
  exponentiate = TRUE
)

support_fit <- glance(model_support)

need_summary <- df |>
  mutate(
    need_group = ntile(need_weight, 4),
    need_group = factor(
      need_group,
      labels = c("Low", "Lower-middle", "Upper-middle", "High")
    )
  ) |>
  group_by(need_group) |>
  summarize(
    mean_judgment = mean(distributive_judgment),
    support_rate = mean(support_fair_allocation),
    mean_bias = mean(self_interest_bias),
    mean_priority_worse_off = mean(priority_worse_off),
    mean_historical_repair = mean(historical_repair_salience),
    .groups = "drop"
  )

pred_grid <- expand_grid(
  need_weight = seq(-2, 2, length.out = 100),
  self_interest_bias = c(-1, 0, 1),
  equality_weight = 0,
  equity_weight = 0,
  desert_weight = 0,
  priority_worse_off = 0,
  procedural_trust = 0,
  group_distance = 0,
  historical_repair_salience = 0
)

pred_grid$predicted_support <- predict(
  model_support,
  newdata = pred_grid,
  type = "response"
)

pred_grid <- pred_grid |>
  mutate(
    bias_label = case_when(
      self_interest_bias == -1 ~ "Low self-interest bias",
      self_interest_bias == 0 ~ "Average self-interest bias",
      TRUE ~ "High self-interest bias"
    )
  )

plot_support <- ggplot(
  pred_grid,
  aes(x = need_weight, y = predicted_support)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ bias_label) +
  labs(
    title = "Predicted Support for Fair Allocation",
    subtitle = "Need sensitivity increases support, but self-interest bias suppresses it",
    x = "Need weight",
    y = "Probability of support"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "justice_fairness_distributive_judgment_simulated_data.csv"))
write_csv(judgment_summary, file.path(output_tables, "distributive_judgment_model.csv"))
write_csv(judgment_fit, file.path(output_tables, "distributive_judgment_model_fit.csv"))
write_csv(support_summary, file.path(output_tables, "fair_allocation_support_model.csv"))
write_csv(support_fit, file.path(output_tables, "fair_allocation_support_model_fit.csv"))
write_csv(need_summary, file.path(output_tables, "need_group_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "fair_allocation_prediction_grid.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_support_by_need_and_self_interest.png"),
  plot = plot_support,
  width = 10,
  height = 6,
  dpi = 300
)

print(judgment_summary)
print(support_summary)
print(need_summary)
