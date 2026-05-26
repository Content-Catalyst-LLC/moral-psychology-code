# Personality, Character, and Individual Differences in Moral Life
# Synthetic R workflow for modeling moral variation.
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
  broad_personality = rnorm(n, 0, 1),
  character_strength = rnorm(n, 0, 1),
  moral_identity = rnorm(n, 0, 1),
  empathy = rnorm(n, 0, 1),
  conscientious_self_regulation = rnorm(n, 0, 1),
  humility = rnorm(n, 0, 1),
  self_interest_bias = rnorm(n, 0, 1),
  situational_pressure = rnorm(n, 0, 1),
  voice_safety = rnorm(n, 0, 1),
  accountability_strength = rnorm(n, 0, 1)
) |>
  mutate(
    moral_response_profile =
      0.20 * broad_personality +
      0.30 * character_strength +
      0.35 * moral_identity +
      0.25 * empathy +
      0.20 * conscientious_self_regulation +
      0.15 * humility -
      0.35 * self_interest_bias +
      rnorm(n, 0, 0.8),

    action_latent =
      0.45 * moral_response_profile -
      0.35 * situational_pressure +
      0.25 * voice_safety +
      0.25 * accountability_strength +
      rnorm(n, 0, 0.9),

    moral_action_probability = plogis(action_latent),
    moral_action = if_else(moral_action_probability >= 0.5, 1, 0)
  )

model_profile <- lm(
  moral_response_profile ~ broad_personality + character_strength +
    moral_identity + empathy + conscientious_self_regulation +
    humility + self_interest_bias,
  data = df
)

profile_summary <- tidy(model_profile, conf.int = TRUE)
profile_fit <- glance(model_profile)

model_action <- glm(
  moral_action ~ moral_response_profile + situational_pressure +
    voice_safety + accountability_strength,
  data = df,
  family = binomial()
)

action_summary <- tidy(
  model_action,
  conf.int = TRUE,
  exponentiate = TRUE
)

action_fit <- glance(model_action)

profile_summary_table <- df |>
  mutate(
    character_group = ntile(character_strength, 4),
    character_group = factor(
      character_group,
      labels = c("Low", "Lower-middle", "Upper-middle", "High")
    ),
    bias_group = if_else(
      self_interest_bias >= median(self_interest_bias),
      "Higher self-interest bias",
      "Lower self-interest bias"
    )
  ) |>
  group_by(character_group, bias_group) |>
  summarize(
    mean_action_prob = mean(moral_action_probability),
    action_rate = mean(moral_action),
    mean_identity = mean(moral_identity),
    mean_empathy = mean(empathy),
    mean_voice_safety = mean(voice_safety),
    .groups = "drop"
  )

pred_grid <- expand_grid(
  moral_identity = seq(-2, 2, length.out = 100),
  self_interest_bias = c(-1, 0, 1),
  broad_personality = 0,
  character_strength = 0,
  empathy = 0,
  conscientious_self_regulation = 0,
  humility = 0
)

pred_grid$predicted_profile <- predict(
  model_profile,
  newdata = pred_grid,
  type = "response"
)

pred_grid <- pred_grid |>
  mutate(
    predicted_action_prob = plogis(
      coef(model_action)["(Intercept)"] +
        coef(model_action)["moral_response_profile"] * predicted_profile +
        coef(model_action)["situational_pressure"] * 0 +
        coef(model_action)["voice_safety"] * 0 +
        coef(model_action)["accountability_strength"] * 0
    ),
    bias_label = case_when(
      self_interest_bias == -1 ~ "Low self-interest bias",
      self_interest_bias == 0 ~ "Average self-interest bias",
      TRUE ~ "High self-interest bias"
    )
  )

plot_action <- ggplot(
  pred_grid,
  aes(x = moral_identity, y = predicted_action_prob)
) +
  geom_line(linewidth = 1) +
  facet_wrap(~ bias_label) +
  labs(
    title = "Predicted Moral Action from Identity and Self-Interest Bias",
    subtitle = "Moral identity supports action, but self-interest bias can suppress it",
    x = "Moral identity",
    y = "Probability of moral action"
  ) +
  theme_minimal(base_size = 12)

write_csv(df, file.path(output_tables, "personality_character_individual_differences_simulated_data.csv"))
write_csv(profile_summary, file.path(output_tables, "moral_response_profile_model.csv"))
write_csv(profile_fit, file.path(output_tables, "moral_response_profile_model_fit.csv"))
write_csv(action_summary, file.path(output_tables, "personality_character_action_model.csv"))
write_csv(action_fit, file.path(output_tables, "personality_character_action_model_fit.csv"))
write_csv(profile_summary_table, file.path(output_tables, "personality_character_profile_summary.csv"))
write_csv(pred_grid, file.path(output_tables, "personality_character_predictions.csv"))

ggsave(
  filename = file.path(output_figures, "predicted_moral_action_by_identity_and_bias.png"),
  plot = plot_action,
  width = 10,
  height = 6,
  dpi = 300
)

print(profile_summary)
print(action_summary)
print(profile_summary_table)
