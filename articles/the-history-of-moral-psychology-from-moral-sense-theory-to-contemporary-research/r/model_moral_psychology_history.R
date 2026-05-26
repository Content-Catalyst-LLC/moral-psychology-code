# The History of Moral Psychology: From Moral Sense Theory to Contemporary Research
# Synthetic R workflow for modeling historical shifts in explanatory emphasis.
# Educational and reproducible research scaffold only.

suppressPackageStartupMessages({
  library(tidyverse)
  library(scales)
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

history_df <- tibble(
  period = c(
    "Moral Sense Theory",
    "Hume and Smith",
    "Rationalist Countercurrent",
    "Nineteenth-Century Social and Evolutionary Shifts",
    "Developmental Tradition",
    "Care and Domain Critiques",
    "Social Learning and Moral Disengagement",
    "Intuitionist / Dual-Process Era",
    "Experimental Moral Psychology Era",
    "Contemporary Pluralist and Institutional Era"
  ),
  year_mid = c(1735, 1765, 1785, 1880, 1965, 1985, 1995, 2005, 2015, 2025),
  sentiment = c(0.80, 0.85, 0.20, 0.35, 0.20, 0.35, 0.35, 0.55, 0.50, 0.45),
  reason = c(0.30, 0.35, 0.90, 0.45, 0.75, 0.45, 0.45, 0.35, 0.40, 0.40),
  development = c(0.10, 0.10, 0.10, 0.25, 0.95, 0.70, 0.55, 0.30, 0.35, 0.45),
  intuition = c(0.35, 0.40, 0.10, 0.30, 0.20, 0.30, 0.35, 0.90, 0.80, 0.75),
  culture_politics = c(0.10, 0.15, 0.10, 0.35, 0.15, 0.35, 0.40, 0.35, 0.60, 0.85),
  neuroscience_experiment = c(0.00, 0.00, 0.00, 0.05, 0.20, 0.25, 0.35, 0.85, 0.95, 0.80),
  institutions = c(0.15, 0.25, 0.20, 0.40, 0.20, 0.30, 0.55, 0.35, 0.50, 0.90)
)

entropy_norm <- function(x) {
  p <- x / sum(x)
  raw_entropy <- -sum(p * log(p))
  max_entropy <- log(length(x))
  raw_entropy / max_entropy
}

history_df <- history_df |>
  rowwise() |>
  mutate(
    diversification = entropy_norm(c_across(sentiment:institutions)),
    dominant_mode = names(which.max(c_across(sentiment:institutions))),
    field_center_score = sum(c_across(sentiment:institutions))
  ) |>
  ungroup()

history_long <- history_df |>
  pivot_longer(
    cols = sentiment:institutions,
    names_to = "dimension",
    values_to = "weight"
  ) |>
  mutate(
    dimension_label = recode(
      dimension,
      sentiment = "Sentiment and sympathy",
      reason = "Reason and principle",
      development = "Development",
      intuition = "Intuition",
      culture_politics = "Culture and politics",
      neuroscience_experiment = "Neuroscience and experiment",
      institutions = "Institutions and structures"
    )
  )

plot_shifts <- ggplot(
  history_long,
  aes(x = year_mid, y = weight, group = dimension_label)
) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  facet_wrap(~ dimension_label, ncol = 2) +
  scale_y_continuous(labels = label_number(accuracy = 0.1)) +
  labs(
    title = "Historical Shifts in Moral Psychology",
    subtitle = "Illustrative changes in explanatory emphasis across major phases",
    x = "Approximate midpoint year",
    y = "Relative emphasis"
  ) +
  theme_minimal(base_size = 12)

plot_diversification <- ggplot(
  history_df,
  aes(x = year_mid, y = diversification)
) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  scale_y_continuous(labels = percent_format(accuracy = 1)) +
  labs(
    title = "Diversification of Moral Psychology Over Time",
    subtitle = "Higher values indicate a more plural explanatory field",
    x = "Approximate midpoint year",
    y = "Normalized diversification"
  ) +
  theme_minimal(base_size = 12)

dominant_summary <- history_df |>
  select(period, year_mid, dominant_mode, diversification, field_center_score)

growth_summary <- history_df |>
  select(sentiment:institutions) |>
  summarize(across(everything(), ~ last(.x) - first(.x))) |>
  pivot_longer(
    cols = everything(),
    names_to = "dimension",
    values_to = "net_change"
  ) |>
  arrange(desc(net_change))

write_csv(history_df, file.path(output_tables, "moral_psychology_history_summary.csv"))
write_csv(history_long, file.path(output_tables, "moral_psychology_history_long.csv"))
write_csv(dominant_summary, file.path(output_tables, "moral_psychology_history_dominant_modes.csv"))
write_csv(growth_summary, file.path(output_tables, "moral_psychology_explanatory_growth.csv"))

ggsave(
  filename = file.path(output_figures, "moral_psychology_historical_shifts.png"),
  plot = plot_shifts,
  width = 11,
  height = 8,
  dpi = 300
)

ggsave(
  filename = file.path(output_figures, "moral_psychology_diversification.png"),
  plot = plot_diversification,
  width = 10,
  height = 6,
  dpi = 300
)

print(history_df)
print(dominant_summary)
print(growth_summary)
