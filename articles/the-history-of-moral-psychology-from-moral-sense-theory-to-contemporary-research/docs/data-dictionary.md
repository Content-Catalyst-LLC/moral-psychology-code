# Data Dictionary

## Synthetic variables

| Variable | Description |
|---|---|
| `period` | Synthetic period label in the history of moral psychology |
| `year_mid` | Approximate midpoint year for conceptual visualization |
| `sentiment` | Synthetic emphasis on moral sense, sympathy, moral feeling, approval, and conscience |
| `reason` | Synthetic emphasis on reason, duty, principle, obligation, and reflective agency |
| `development` | Synthetic emphasis on childhood, stages, education, perspective-taking, and moral growth |
| `intuition` | Synthetic emphasis on intuition, rapid evaluation, affective appraisal, and moral dumbfounding |
| `culture_politics` | Synthetic emphasis on culture, politics, pluralism, identity, and group life |
| `neuroscience_experiment` | Synthetic emphasis on neuroscience, experiment, measurement, and lab method |
| `institutions` | Synthetic emphasis on organizations, platforms, law, bureaucracy, and structured moral environments |
| `diversification` | Normalized entropy-style index of explanatory pluralism |
| `dominant_mode` | Highest-weight explanatory mode for a synthetic period |
| `field_center_score` | Simple summed synthetic field-center score |

## Generated outputs

| Output | Description |
|---|---|
| `moral_psychology_history_summary.csv` | Python/R synthetic historical period summary |
| `moral_psychology_history_long.csv` | Long-format explanatory weights by period |
| `moral_psychology_dominant_modes.csv` | Dominant explanatory mode by period |
| `moral_psychology_explanatory_growth.csv` | Net change in explanatory dimensions from first to final period |
| `moral_psychology_historical_shifts.png` | R visualization of explanatory shifts |
| `moral_psychology_diversification.png` | R visualization of diversification |
| `julia_history_summary.csv` | Julia summary of synthetic explanatory weights |
