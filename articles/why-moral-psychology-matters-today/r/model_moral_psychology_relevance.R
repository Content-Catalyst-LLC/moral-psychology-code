# Why Moral Psychology Matters Today
# Synthetic systems-level R workflow
# Educational and reproducible research scaffold only.

suppressPackageStartupMessages({
  library(tidyverse)
  library(broom)
})

set.seed(42)

article_root <- normalizePath(file.path(dirname(sys.frame(1)$ofile), ".."))
output_tables <- file.path(article_root, "outputs", "tables")
output_figures <- file.path(article_root, "outputs", "figures")

dir.create(output_tables, recursive = TRUE, showWarnings = FALSE)
dir.create(output_figures, recursive = TRUE, showWarnings = FALSE)

n <- 2400

df <- tibble(
  political_polarization = rnorm(n, 0, 1),
  organizational_risk = rnorm(n, 0, 1),
  developmental_moral_learning = rnorm(n, 0, 1),
  cross_cultural_variation = rnorm(n, 0, 1),
  technology_amplification = rnorm(n, 0, 1),
  moral_injury_burden = rnorm(n, 0, 1)
) |>
  mutate(
    moral_psychology_significance =
      0.25 * political_polarization +
      0.20 * organizational_risk +
      0.15 * developmental_moral_learning +
      0.15 * cross_cultural_variation +
      0.15 * technology_amplification +
      0.20 * moral_injury_burden +
      rnorm(n, 0, 0.8)
  )

model_significance <- lm(
  moral_psychology_significance ~ political_polarization +
    organizational_risk +
    developmental_moral_learning +
    cross_cultural_variation +
    technology_amplification +
    moral_injury_burden,
  data = df
)

model_summary <- tidy(model_significance, conf.int = TRUE)
model_fit <- glance(model_significance)

pred_grid <- expand_grid(
  political_polarization = seq(-2, 2, length.out = 100),
  technology_amplification = c(-1, 0, 1),
  organizational_risk = 0,
  developmental_moral_learning = 0,
  cross_cultural_variation = 0,
  moral_injury_burden = 0
)

pred_grid$predicted_significance <- predict(
  model_significance,
  newdata = pred_grid
)

pred_grid <- pred_grid |>
  mutate(
    tech_label = case_when(
      technology_amplification == -1 ~ "Low technology amplification",
      technology_amplification == 0 ~ "Average technology amplification",
      TRUE ~ "High technology amplification"
    )
  )

domain_summary <- df |>
  mutate(
    significance_band = ntile(moral_psychology_significance, 4),
    significance_band = factor(
      significance_band,
      labels = c("Low", "Lower-middle", "Upper-middle", "High")
    )
  ) |>
  group_by(significance_band) |>
  summarize(
    mean_polarization = mean(political_polarization),
    mean_organizational_risk = mean(organizational_risk),
    mean_developmental_learning = mean(developmental_moral_learning),
    mean_cross_cultural_variation = mean(cross_cultural_variation),
    mean_technology_amplification = mean(technology_amplification),
    mean_moral_injury = mean(moral_injury_burden),
    .groups = "drop"
  )

plot_predicted_significance <- ggplot(
  pred_grid,
  aes(x = political_polarization, y = predicted_significance)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ tech_label) +
  labs(
    title = "Predicted Contemporary Significance of Moral Psychology",
    subtitle = "Polarization and digital amplification make moral-psychological insight more consequential",
    x = "Political polarization",
    y = "Predicted significance"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "why_moral_psychology_matters_simulated_data.csv"))
write_csv(model_summary, file.path(output_tables, "why_moral_psychology_matters_model.csv"))
write_csv(model_fit, file.path(output_tables, "why_moral_psychology_matters_model_fit.csv"))
write_csv(domain_summary, file.path(output_tables, "why_moral_psychology_matters_domain_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "why_moral_psychology_matters_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_moral_psychology_significance.png"),
  plot = plot_predicted_significance,
  width = 10,
  height = 6,
  dpi = 300
)

print(model_summary)
print(domain_summary)
