# Data Dictionary

## Synthetic variables

| Variable | Description |
|---|---|
| `case_id` | Synthetic case identifier |
| `control` | Synthetic relevant control capacity or opportunity to act |
| `knowledge` | Synthetic knowledge, foresight, or epistemic position |
| `role_duty` | Synthetic role duty, office obligation, or professional responsibility |
| `wrongness_severity` | Synthetic severity of wrongdoing or norm violation |
| `motive_malice` | Synthetic malice, negligence, recklessness, or culpable motive indicator |
| `mitigating_excuse` | Synthetic mitigating excuse, duress, incapacity, or constraint |
| `institutional_structure` | Synthetic institutional quality, reporting design, oversight, or structure |
| `victim_recognition` | Synthetic recognition of harmed person or group standing |
| `repair_capacity` | Synthetic capacity for repair, restitution, or changed conduct |
| `prevention_capacity` | Synthetic capacity to prevent recurrence |
| `responsibility` | Synthetic responsibility score |
| `blame_latent` | Latent synthetic blame score |
| `blame_probability` | Synthetic probability of blame assignment |
| `blame_assigned` | Binary synthetic blame assignment indicator |
| `accountability_score` | Synthetic accountability score |
| `accountability_quality` | Synthetic accountability-quality score |
| `responsibility_group` | Quartile grouping of responsibility |

## Generated outputs

| Output | Description |
|---|---|
| `responsibility_blame_accountability_python.csv` | Python-generated synthetic dataset |
| `responsibility_blame_accountability_summary.csv` | Python responsibility-group summary |
| `responsibility_blame_accountability_scenarios.csv` | Python scenario grid |
| `high_accountability_low_blame_cases.csv` | Python high-accountability low-blame synthetic cases |
| `responsibility_blame_accountability_simulated_data.csv` | R-generated synthetic dataset |
| `responsibility_blame_model.csv` | R blame model coefficients |
| `responsibility_blame_model_fit.csv` | R blame model fit statistics |
| `accountability_model.csv` | R accountability model coefficients |
| `accountability_model_fit.csv` | R accountability model fit statistics |
| `accountability_quality_model.csv` | R accountability-quality model coefficients |
| `accountability_quality_model_fit.csv` | R accountability-quality model fit statistics |
| `responsibility_group_summary.csv` | R responsibility-group summary |
| `responsibility_blame_prediction_grid.csv` | R prediction grid |
