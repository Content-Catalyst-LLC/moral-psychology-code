# Data Dictionary

## Synthetic variables

| Variable | Description |
|---|---|
| `case_id` | Synthetic case identifier |
| `judgment_other` | Synthetic judgment strictness applied to others |
| `judgment_self` | Synthetic judgment strictness applied to self or ingroup |
| `hypocrisy` | Synthetic asymmetry between judgment of others and judgment of self |
| `perceived_humanness` | Synthetic perceived humanness or moral standing |
| `dehumanization` | Synthetic reduction in perceived moral standing |
| `ingroup_bias` | Synthetic ingroup favoritism or selective group judgment |
| `empathic_recognition` | Synthetic recognition of target suffering, dignity, and personhood |
| `public_value_claim` | Synthetic strength of professed public values |
| `actual_practice_integrity` | Synthetic integrity of actual practice |
| `institutional_hypocrisy` | Synthetic gap between public values and actual practice |
| `accountability_strength` | Synthetic accountability strength |
| `victim_visibility` | Synthetic visibility of harmed persons or affected groups |
| `failure_latent` | Latent synthetic moral failure score |
| `moral_failure_probability` | Synthetic probability of moral failure |
| `moral_failure` | Binary synthetic moral failure indicator |
| `hypocrisy_group` | Hypocrisy grouping used in summaries |

## Generated outputs

| Output | Description |
|---|---|
| `hypocrisy_dehumanization_python.csv` | Python-generated synthetic dataset |
| `hypocrisy_dehumanization_summary.csv` | Python hypocrisy-group summary |
| `hypocrisy_dehumanization_scenarios.csv` | Python scenario grid |
| `hypocrisy_dehumanization_high_risk_cases.csv` | Python high-risk synthetic cases |
| `hypocrisy_dehumanization_simulated_data.csv` | R-generated synthetic dataset |
| `hypocrisy_dehumanization_model.csv` | R moral failure model coefficients |
| `hypocrisy_dehumanization_model_fit.csv` | R model fit statistics |
| `hypocrisy_group_summary.csv` | R hypocrisy-group summary |
| `hypocrisy_dehumanization_predictions.csv` | R prediction grid |
