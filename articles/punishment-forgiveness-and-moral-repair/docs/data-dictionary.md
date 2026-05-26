# Data Dictionary

## Synthetic variables

| Variable | Description |
|---|---|
| `case_id` | Synthetic case identifier |
| `wrongdoing_severity` | Synthetic seriousness of wrongdoing |
| `offender_responsibility` | Synthetic perceived responsibility of wrongdoer |
| `norm_reaffirmation_need` | Synthetic need to publicly reaffirm violated norms |
| `acknowledgment` | Synthetic truth-telling or acknowledgment of the wrong |
| `amends` | Synthetic making-amends or repentant action |
| `ongoing_threat` | Synthetic unresolved harm, danger, or threat |
| `restitution` | Synthetic restitution, compensation, or material repair |
| `institutional_trust` | Synthetic trust in institutional process |
| `victim_recognition` | Synthetic recognition of victim standing, dignity, and credibility |
| `structural_reform` | Synthetic institutional or structural reform effort |
| `punishment_score` | Synthetic punishment or sanction intensity |
| `forgiveness_latent` | Latent synthetic forgiveness score |
| `forgiveness_probability` | Synthetic probability of forgiveness |
| `forgiveness` | Binary synthetic forgiveness indicator |
| `moral_repair` | Synthetic moral-repair outcome |
| `threat_group` | Quartile grouping of ongoing threat |

## Generated outputs

| Output | Description |
|---|---|
| `punishment_forgiveness_moral_repair_python.csv` | Python-generated synthetic dataset |
| `punishment_forgiveness_moral_repair_summary.csv` | Python threat-group summary |
| `punishment_forgiveness_moral_repair_scenarios.csv` | Python scenario grid |
| `punishment_forgiveness_moral_repair_low_repair_cases.csv` | Python low-repair synthetic cases |
| `punishment_forgiveness_moral_repair_simulated_data.csv` | R-generated synthetic dataset |
| `punishment_model.csv` | R punishment model coefficients |
| `punishment_model_fit.csv` | R punishment model fit statistics |
| `forgiveness_model.csv` | R forgiveness model coefficients |
| `forgiveness_model_fit.csv` | R forgiveness model fit statistics |
| `moral_repair_model.csv` | R moral repair model coefficients |
| `moral_repair_model_fit.csv` | R moral repair model fit statistics |
| `threat_group_summary.csv` | R threat-group summary |
| `forgiveness_prediction_grid.csv` | R prediction grid |
