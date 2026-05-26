# What Is Moral Psychology?
# Synthetic R workflow for modeling the judgment-action gap
# in morally structured environments.
# Educational and reproducible research scaffold only.

suppressPackageStartupMessages({
  library(tidyverse)
  library(lme4)
  library(broom.mixed)
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

set.seed(42)

n_people <- 600
n_orgs <- 24

people <- tibble(
  person_id = 1:n_people,
  org_id = sample(1:n_orgs, n_people, replace = TRUE),
  moral_identity = rnorm(n_people, mean = 0, sd = 1),
  empathic_concern = rnorm(n_people, mean = 0, sd = 1),
  self_regulation = rnorm(n_people, mean = 0, sd = 1),
  social_desirability = rnorm(n_people, mean = 0, sd = 1)
)

orgs <- tibble(
  org_id = 1:n_orgs,
  institutional_pressure = rnorm(n_orgs, mean = 0, sd = 0.8),
  accountability_climate = rnorm(n_orgs, mean = 0, sd = 0.8),
  repair_infrastructure = rnorm(n_orgs, mean = 0, sd = 0.8),
  retaliation_risk = rnorm(n_orgs, mean = 0, sd = 0.8)
)

df <- people |>
  left_join(orgs, by = "org_id") |>
  mutate(
    moral_salience =
      0.30 * empathic_concern +
      0.25 * moral_identity -
      0.15 * institutional_pressure +
      rnorm(n(), 0, 0.25),

    moral_judgment =
      0.70 +
      0.18 * moral_identity +
      0.12 * empathic_concern +
      0.10 * moral_salience +
      0.10 * social_desirability +
      rnorm(n(), 0, 0.20),

    moral_action =
      0.45 +
      0.25 * moral_judgment +
      0.20 * moral_identity +
      0.18 * self_regulation +
      0.12 * repair_infrastructure +
      0.10 * accountability_climate -
      0.22 * institutional_pressure -
      0.16 * retaliation_risk +
      rnorm(n(), 0, 0.25)
  ) |>
  mutate(
    moral_judgment = pmin(pmax(moral_judgment, 0), 1),
    moral_action = pmin(pmax(moral_action, 0), 1),
    judgment_action_gap = moral_judgment - moral_action
  )

gap_model <- lmer(
  judgment_action_gap ~ moral_identity + empathic_concern +
    self_regulation + institutional_pressure +
    accountability_climate + repair_infrastructure +
    retaliation_risk + social_desirability +
    (1 | org_id),
  data = df
)

gap_results <- broom.mixed::tidy(gap_model, effects = "fixed")
gap_fit <- broom.mixed::glance(gap_model)

pred_grid <- expand_grid(
  moral_identity = c(-1, 0, 1),
  self_regulation = c(-1, 0, 1),
  empathic_concern = 0,
  institutional_pressure = seq(-2, 2, length.out = 80),
  accountability_climate = 0,
  repair_infrastructure = 0,
  retaliation_risk = 0,
  social_desirability = 0
)

pred_grid$pred_gap <- predict(
  gap_model,
  newdata = pred_grid,
  re.form = NA
)

pred_grid <- pred_grid |>
  mutate(
    moral_identity_label = case_when(
      moral_identity == -1 ~ "Low moral identity",
      moral_identity == 0 ~ "Average moral identity",
      TRUE ~ "High moral identity"
    ),
    self_regulation_label = case_when(
      self_regulation == -1 ~ "Low self-regulation",
      self_regulation == 0 ~ "Average self-regulation",
      TRUE ~ "High self-regulation"
    )
  )

gap_plot <- ggplot(
  pred_grid,
  aes(
    x = institutional_pressure,
    y = pred_gap,
    linetype = self_regulation_label
  )
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ moral_identity_label) +
  labs(
    title = "Predicted Judgment-Action Gap Under Institutional Pressure",
    subtitle = "Higher values indicate a larger gap between endorsed judgment and enacted conduct",
    x = "Institutional pressure",
    y = "Predicted judgment-action gap",
    linetype = "Self-regulation"
  ) +
  theme_minimal(base_size = 12)

org_summary <- df |>
  group_by(org_id) |>
  summarise(
    mean_gap = mean(judgment_action_gap),
    mean_pressure = mean(institutional_pressure),
    mean_accountability = mean(accountability_climate),
    mean_repair = mean(repair_infrastructure),
    mean_retaliation_risk = mean(retaliation_risk),
    n = n(),
    .groups = "drop"
  ) |>
  arrange(desc(mean_gap))

write_csv(df, file.path(output_tables, "moral_psychology_simulated_individual_data.csv"))
write_csv(org_summary, file.path(output_tables, "moral_psychology_organizational_summary.csv"))
write_csv(gap_results, file.path(output_tables, "moral_psychology_gap_model_coefficients.csv"))
write_csv(gap_fit, file.path(output_tables, "moral_psychology_gap_model_fit.csv"))
write_csv(pred_grid, file.path(output_tables, "moral_psychology_gap_prediction_grid.csv"))

ggsave(
  filename = file.path(output_figures, "judgment_action_gap_under_pressure.png"),
  plot = gap_plot,
  width = 11,
  height = 7,
  dpi = 300
)

print(gap_results)
print(org_summary)
