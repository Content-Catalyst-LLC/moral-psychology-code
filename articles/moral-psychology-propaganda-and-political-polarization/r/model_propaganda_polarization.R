# Moral Psychology, Propaganda, and Political Polarization
# Synthetic R workflow for propaganda and moral-polarization modeling.
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

n <- 2500

df <- tibble(
  participant_id = 1:n,
  group = sample(c("Group_A", "Group_B"), n, replace = TRUE),
  value_profile = rnorm(n, 0, 1),
  trust_allocation = rnorm(n, 0, 1),
  identity_salience = rnorm(n, 0, 1),
  propaganda_exposure = rnorm(n, 0, 1),
  threat_perception = rnorm(n, 0, 1),
  outrage_amplification = rnorm(n, 0, 1),
  democratic_trust = rnorm(n, 0, 1),
  cross_group_contact = rnorm(n, 0, 1)
) |>
  mutate(
    moral_political_judgment = case_when(
      group == "Group_A" ~
        0.30 * value_profile +
        0.20 * trust_allocation +
        0.25 * identity_salience +
        0.30 * propaganda_exposure +
        0.25 * threat_perception +
        0.20 * outrage_amplification -
        0.15 * democratic_trust -
        0.10 * cross_group_contact +
        rnorm(n, 0, 0.8),

      TRUE ~
        -0.20 * value_profile -
        0.15 * trust_allocation +
        0.30 * identity_salience +
        0.30 * propaganda_exposure +
        0.30 * threat_perception +
        0.20 * outrage_amplification -
        0.15 * democratic_trust -
        0.10 * cross_group_contact +
        rnorm(n, 0, 0.8)
    ),

    moral_exclusion_risk = plogis(
      0.35 * threat_perception +
      0.30 * propaganda_exposure +
      0.25 * outrage_amplification +
      0.20 * identity_salience -
      0.25 * democratic_trust -
      0.20 * cross_group_contact
    )
  )

model_polarization <- lm(
  moral_political_judgment ~ group + value_profile + trust_allocation +
    identity_salience + propaganda_exposure + threat_perception +
    outrage_amplification + democratic_trust + cross_group_contact,
  data = df
)

polarization_summary <- tidy(model_polarization, conf.int = TRUE)
polarization_fit <- glance(model_polarization)

model_exclusion <- lm(
  moral_exclusion_risk ~ propaganda_exposure + threat_perception +
    outrage_amplification + identity_salience +
    democratic_trust + cross_group_contact,
  data = df
)

exclusion_summary <- tidy(model_exclusion, conf.int = TRUE)

group_summary <- df |>
  group_by(group) |>
  summarise(
    mean_judgment = mean(moral_political_judgment),
    mean_propaganda = mean(propaganda_exposure),
    mean_threat = mean(threat_perception),
    mean_outrage = mean(outrage_amplification),
    mean_moral_exclusion_risk = mean(moral_exclusion_risk),
    .groups = "drop"
  )

polarization_distance <- abs(diff(group_summary$mean_judgment))

polarization_distance_tbl <- tibble(
  metric = "polarization_distance",
  value = polarization_distance
)

pred_grid <- expand_grid(
  propaganda_exposure = seq(-2, 2, length.out = 100),
  trust_allocation = c(-1, 0, 1),
  group = c("Group_A", "Group_B"),
  value_profile = 0,
  identity_salience = 0,
  threat_perception = 0,
  outrage_amplification = 0,
  democratic_trust = 0,
  cross_group_contact = 0
)

pred_grid$predicted_judgment <- predict(
  model_polarization,
  newdata = pred_grid
)

pred_grid <- pred_grid |>
  mutate(
    trust_label = case_when(
      trust_allocation == -1 ~ "Low institutional trust",
      trust_allocation == 0 ~ "Average institutional trust",
      TRUE ~ "High institutional trust"
    )
  )

plot_predicted_judgment <- ggplot(
  pred_grid,
  aes(x = propaganda_exposure, y = predicted_judgment)
) +
  geom_line(linewidth = 1) +
  facet_grid(group ~ trust_label) +
  labs(
    title = "Predicted Moral-Political Judgment under Propaganda Exposure",
    subtitle = "Propaganda shifts judgment through identity, trust, and threat",
    x = "Propaganda exposure",
    y = "Predicted moral-political judgment"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "propaganda_polarization_simulated_data.csv"))
write_csv(polarization_summary, file.path(output_tables, "propaganda_polarization_model.csv"))
write_csv(polarization_fit, file.path(output_tables, "propaganda_polarization_model_fit.csv"))
write_csv(exclusion_summary, file.path(output_tables, "moral_exclusion_model.csv"))
write_csv(group_summary, file.path(output_tables, "propaganda_polarization_group_summary.csv"))
write_csv(polarization_distance_tbl, file.path(output_tables, "propaganda_polarization_distance.csv"))
write_csv(pred_grid, file.path(output_tables, "propaganda_polarization_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_judgment_under_propaganda_exposure.png"),
  plot = plot_predicted_judgment,
  width = 11,
  height = 7,
  dpi = 300
)

print(polarization_summary)
print(exclusion_summary)
print(group_summary)
print(polarization_distance_tbl)
