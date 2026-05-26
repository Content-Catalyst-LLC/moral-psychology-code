# Data Dictionary

## Synthetic variables

| Variable | Description |
|---|---|
| `case_id` | Synthetic case identifier |
| `perceived_wrongdoing` | Synthetic recognition that an action or omission violated a standard |
| `perceived_responsibility` | Synthetic sense of answerability for action or omission |
| `exposure_before_others` | Synthetic visibility of failure before real or imagined observers |
| `norm_internalization` | Synthetic degree to which a moral norm is experienced as inwardly binding |
| `global_self_condemnation` | Synthetic global negative self-appraisal |
| `empathic_acknowledgment` | Synthetic recognition of harm to another person or group |
| `repair_pathway` | Synthetic practical availability of confession, restitution, and changed conduct |
| `agency_capacity` | Synthetic capacity to respond, repair, or change |
| `defensiveness` | Synthetic self-protective resistance to evidence or correction |
| `guilt` | Synthetic act-focused moral self-evaluation |
| `shame` | Synthetic self-focused exposure or global self-condemnation |
| `conscience_activation` | Synthetic activation of moral self-evaluation |
| `repair_probability` | Synthetic probability of repair-oriented response |
| `repair_action` | Binary synthetic repair-action indicator |
| `avoidance_probability` | Synthetic probability of avoidance response |
| `avoidance_action` | Binary synthetic avoidance-action indicator |

## Generated outputs

| Output | Description |
|---|---|
| `conscience_guilt_shame_python_simulation.csv` | Python-generated synthetic dataset |
| `conscience_guilt_shame_summary.csv` | Python conscience-group summary |
| `conscience_guilt_shame_scenarios.csv` | Python scenario grid |
| `conscience_high_shame_low_repair_cases.csv` | Python high-shame low-repair synthetic cases |
| `conscience_high_guilt_high_repair_cases.csv` | Python high-guilt high-repair synthetic cases |
| `conscience_guilt_shame_simulated_data.csv` | R-generated synthetic dataset |
| `conscience_guilt_model.csv` | R guilt model coefficients |
| `conscience_guilt_model_fit.csv` | R guilt model fit statistics |
| `conscience_shame_model.csv` | R shame model coefficients |
| `conscience_shame_model_fit.csv` | R shame model fit statistics |
| `conscience_repair_model.csv` | R repair model coefficients |
| `conscience_repair_model_fit.csv` | R repair model fit statistics |
| `conscience_avoidance_model.csv` | R avoidance model coefficients |
| `conscience_avoidance_model_fit.csv` | R avoidance model fit statistics |
| `conscience_activation_summary.csv` | R conscience activation summary |
| `conscience_shame_summary.csv` | R shame-band summary |
| `conscience_repair_predictions.csv` | R repair prediction grid |
