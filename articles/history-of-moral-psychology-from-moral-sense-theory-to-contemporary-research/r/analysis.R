# Synthetic moral psychology analysis.
# Run after the Python script creates data/processed/synthetic_moral_observations.csv.
# Educational only. Not a moral assessment or legal tool.

# install.packages(c("tidyverse", "broom", "scales"))
library(tidyverse)
library(broom)
library(scales)

data_path <- file.path("data", "processed", "synthetic_moral_observations.csv")

if (!file.exists(data_path)) {
  stop("Run: python3 python/moral_agency_simulation.py")
}

moral_data <- read.csv(data_path)

summary_table <- aggregate(
  cbind(
    agency_score,
    moral_judgment,
    moral_emotion,
    moral_perception,
    moral_identity,
    self_regulation,
    reparative_orientation,
    failure_dynamics,
    high_moral_agency
  ) ~ period,
  data = moral_data,
  FUN = mean
)

dir.create("outputs", showWarnings = FALSE, recursive = TRUE)
write.csv(summary_table, file.path("outputs", "moral_agency_period_summary.csv"), row.names = FALSE)

lm_fit <- lm(
  agency_score ~ moral_perception + moral_judgment +
    moral_emotion + moral_identity +
    self_regulation + reparative_orientation +
    failure_dynamics,
  data = moral_data
)

print(summary(lm_fit))
print(tidy(lm_fit, conf.int = TRUE))

logit_fit <- glm(
  high_moral_agency ~ moral_identity + self_regulation +
    moral_perception + reparative_orientation + failure_dynamics,
  family = binomial(link = "logit"),
  data = moral_data
)

print(summary(logit_fit))
print(tidy(logit_fit, conf.int = TRUE, exponentiate = TRUE))

print(summary_table)
