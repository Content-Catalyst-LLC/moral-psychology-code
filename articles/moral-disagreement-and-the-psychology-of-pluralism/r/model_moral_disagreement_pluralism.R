# Moral Disagreement and the Psychology of Pluralism
# Synthetic R workflow for modeling value pluralism and disagreement.
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
  harm_weight = rnorm(n, 0, 1),
  fairness_weight = rnorm(n, 0, 1),
  loyalty_weight = rnorm(n, 0, 1),
  purity_weight = rnorm(n, 0, 1),
  authority_weight = rnorm(n, 0, 1),
  care_weight = rnorm(n, 0, 1),
  identity_strength = rnorm(n, 0, 1),
  framing_sensitivity = rnorm(n, 0, 1),
  institutional_trust = rnorm(n, 0, 1),
  pluralist_tolerance = rnorm(n, 0, 1)
) |>
  mutate(
    moral_judgment =
      0.40 * harm_weight +
      0.30 * fairness_weight +
      0.20 * loyalty_weight +
      0.15 * purity_weight +
      0.15 * authority_weight +
      0.25 * care_weight +
      0.25 * identity_strength +
      0.20 * framing_sensitivity +
      rnorm(n, 0, 0.8)
  )

pairs <- tibble(
  i = sample(1:n, 4000, replace = TRUE),
  j = sample(1:n, 4000, replace = TRUE)
) |>
  filter(i != j) |>
  mutate(
    judgment_i = df$moral_judgment[i],
    judgment_j = df$moral_judgment[j],
    disagreement = abs(judgment_i - judgment_j),

    value_gap =
      abs(df$harm_weight[i] - df$harm_weight[j]) +
      abs(df$fairness_weight[i] - df$fairness_weight[j]) +
      abs(df$loyalty_weight[i] - df$loyalty_weight[j]) +
      abs(df$purity_weight[i] - df$purity_weight[j]) +
      abs(df$authority_weight[i] - df$authority_weight[j]) +
      abs(df$care_weight[i] - df$care_weight[j]),

    identity_gap = abs(df$identity_strength[i] - df$identity_strength[j]),
    framing_gap = abs(df$framing_sensitivity[i] - df$framing_sensitivity[j]),
    trust_gap = abs(df$institutional_trust[i] - df$institutional_trust[j]),
    pluralist_tolerance_gap = abs(df$pluralist_tolerance[i] - df$pluralist_tolerance[j])
  )

model_disagreement <- lm(
  disagreement ~ value_gap + identity_gap + framing_gap + trust_gap,
  data = pairs
)

disagreement_summary <- tidy(model_disagreement, conf.int = TRUE)
disagreement_fit <- glance(model_disagreement)

disagreement_band_summary <- pairs |>
  mutate(
    disagreement_band = ntile(disagreement, 4),
    disagreement_band = factor(
      disagreement_band,
      labels = c("Low", "Lower-middle", "Upper-middle", "High")
    )
  ) |>
  group_by(disagreement_band) |>
  summarize(
    mean_value_gap = mean(value_gap),
    mean_identity_gap = mean(identity_gap),
    mean_framing_gap = mean(framing_gap),
    mean_trust_gap = mean(trust_gap),
    mean_disagreement = mean(disagreement),
    .groups = "drop"
  )

pred_grid <- expand_grid(
  value_gap = seq(0, 10, length.out = 100),
  identity_gap = c(0, 1, 2),
  framing_gap = 1,
  trust_gap = 1
)

pred_grid$predicted_disagreement <- predict(
  model_disagreement,
  newdata = pred_grid
)

pred_grid <- pred_grid |>
  mutate(
    identity_label = case_when(
      identity_gap == 0 ~ "Low identity gap",
      identity_gap == 1 ~ "Moderate identity gap",
      TRUE ~ "High identity gap"
    )
  )

plot_disagreement <- ggplot(
  pred_grid,
  aes(x = value_gap, y = predicted_disagreement)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ identity_label) +
  labs(
    title = "Predicted Moral Disagreement from Value and Identity Differences",
    subtitle = "Disagreement grows as value weighting and identity divergence increase",
    x = "Value gap",
    y = "Predicted disagreement"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "moral_pluralism_profiles.csv"))
write_csv(pairs, file.path(output_tables, "moral_disagreement_pairs.csv"))
write_csv(disagreement_summary, file.path(output_tables, "moral_disagreement_model.csv"))
write_csv(disagreement_fit, file.path(output_tables, "moral_disagreement_model_fit.csv"))
write_csv(disagreement_band_summary, file.path(output_tables, "moral_disagreement_band_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "moral_disagreement_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_moral_disagreement.png"),
  plot = plot_disagreement,
  width = 10,
  height = 6,
  dpi = 300
)

print(disagreement_summary)
print(disagreement_band_summary)
