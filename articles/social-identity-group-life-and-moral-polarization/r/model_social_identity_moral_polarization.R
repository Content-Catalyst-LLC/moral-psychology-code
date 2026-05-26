# Social Identity, Group Life, and Moral Polarization
# Synthetic R workflow for group-conditioned moral divergence.
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
  group = sample(c("Group_A", "Group_B"), n, replace = TRUE),
  value_profile = rnorm(n, 0, 1),
  identity_strength = rnorm(n, 0, 1),
  norm_pressure = rnorm(n, 0, 1),
  threat_perception = rnorm(n, 0, 1),
  institutional_trust = rnorm(n, 0, 1),
  cross_group_contact = rnorm(n, 0, 1),
  dehumanizing_rhetoric = rnorm(n, 0, 1),
  loyalty_pressure = rnorm(n, 0, 1)
) |>
  mutate(
    moral_judgment = case_when(
      group == "Group_A" ~
        0.35 * value_profile +
        0.30 * identity_strength +
        0.20 * norm_pressure +
        0.25 * threat_perception -
        0.15 * institutional_trust -
        0.10 * cross_group_contact +
        rnorm(n, 0, 0.8),

      TRUE ~
        -0.20 * value_profile +
        0.35 * identity_strength +
        0.25 * norm_pressure +
        0.30 * threat_perception -
        0.15 * institutional_trust -
        0.10 * cross_group_contact +
        rnorm(n, 0, 0.8)
    ),

    moral_exclusion_risk = plogis(
      0.35 * threat_perception +
      0.30 * dehumanizing_rhetoric +
      0.25 * loyalty_pressure +
      0.20 * identity_strength -
      0.25 * institutional_trust -
      0.20 * cross_group_contact
    )
  )

model_polarization <- lm(
  moral_judgment ~ group + value_profile + identity_strength +
    norm_pressure + threat_perception + institutional_trust +
    cross_group_contact,
  data = df
)

polarization_summary <- tidy(model_polarization, conf.int = TRUE)
polarization_fit <- glance(model_polarization)

model_exclusion <- lm(
  moral_exclusion_risk ~ threat_perception + dehumanizing_rhetoric +
    loyalty_pressure + identity_strength + institutional_trust +
    cross_group_contact,
  data = df
)

exclusion_summary <- tidy(model_exclusion, conf.int = TRUE)

group_summary <- df |>
  group_by(group) |>
  summarise(
    mean_judgment = mean(moral_judgment),
    mean_identity = mean(identity_strength),
    mean_norm_pressure = mean(norm_pressure),
    mean_threat = mean(threat_perception),
    mean_moral_exclusion_risk = mean(moral_exclusion_risk),
    .groups = "drop"
  )

polarization_distance <- abs(diff(group_summary$mean_judgment))

polarization_distance_tbl <- tibble(
  metric = "polarization_distance",
  value = polarization_distance
)

pred_grid <- expand_grid(
  threat_perception = seq(-2, 2, length.out = 100),
  group = c("Group_A", "Group_B"),
  value_profile = 0,
  identity_strength = c(-1, 0, 1),
  norm_pressure = 0,
  institutional_trust = 0,
  cross_group_contact = 0
)

pred_grid$predicted_judgment <- predict(
  model_polarization,
  newdata = pred_grid
)

pred_grid <- pred_grid |>
  mutate(
    identity_label = case_when(
      identity_strength == -1 ~ "Low identity strength",
      identity_strength == 0 ~ "Average identity strength",
      TRUE ~ "High identity strength"
    )
  )

plot_predicted_judgment <- ggplot(
  pred_grid,
  aes(x = threat_perception, y = predicted_judgment)
) +
  geom_line(linewidth = 1) +
  facet_grid(group ~ identity_label) +
  labs(
    title = "Predicted Moral Judgment by Group, Threat, and Identity Strength",
    subtitle = "Threat perception and group identity amplify moral divergence",
    x = "Threat perception",
    y = "Predicted moral judgment"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "social_identity_moral_polarization_simulated_data.csv"))
write_csv(polarization_summary, file.path(output_tables, "social_identity_moral_polarization_model.csv"))
write_csv(polarization_fit, file.path(output_tables, "social_identity_moral_polarization_model_fit.csv"))
write_csv(exclusion_summary, file.path(output_tables, "social_identity_moral_exclusion_model.csv"))
write_csv(group_summary, file.path(output_tables, "social_identity_moral_polarization_group_summary.csv"))
write_csv(polarization_distance_tbl, file.path(output_tables, "social_identity_moral_polarization_distance.csv"))
write_csv(pred_grid, file.path(output_tables, "social_identity_moral_polarization_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_moral_judgment_by_identity_and_threat.png"),
  plot = plot_predicted_judgment,
  width = 12,
  height = 8,
  dpi = 300
)

print(polarization_summary)
print(exclusion_summary)
print(group_summary)
print(polarization_distance_tbl)
