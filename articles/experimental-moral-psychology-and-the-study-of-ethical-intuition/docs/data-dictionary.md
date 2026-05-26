# Data Dictionary

## Synthetic variables

| Variable | Description |
|---|---|
| `participant_id` | Synthetic participant identifier |
| `intuition_strength` | Synthetic standardized intuitive appraisal strength |
| `reflection_strength` | Synthetic standardized reflective control or deliberative tendency |
| `norm_sensitivity` | Synthetic responsiveness to moral norms and constraints |
| `consequence_sensitivity` | Synthetic responsiveness to outcomes or aggregate welfare |
| `intentionality` | Synthetic perceived intention or agency indicator |
| `excuse_strength` | Synthetic indicator of excuse, constraint, ignorance, or diminished control |
| `group_identity_salience` | Synthetic indicator of identity salience |
| `power_condition` | Synthetic experimental condition: low power, control, or high power |
| `moral_judgment` | Synthetic observed moral judgment score |
| `blame_probability` | Synthetic probability of blame assignment |
| `blame_assigned` | Binary synthetic blame assignment |
| `intuition_band` | Quartile grouping of intuition strength |
| `intuition_reflection_gap` | Difference between intuition and reflection strength |

## Generated outputs

| Output | Description |
|---|---|
| `experimental_moral_psychology_python.csv` | Python-generated synthetic dataset |
| `experimental_moral_psychology_intuition_summary.csv` | Summary by intuition quartile |
| `experimental_moral_psychology_condition_summary.csv` | Summary by power condition |
| `experimental_moral_psychology_scenarios.csv` | Scenario grid across intuition, reflection, and norm sensitivity |
| `experimental_moral_psychology_intuition_reflection_gap_cases.csv` | Synthetic cases with large intuition/reflection gaps |
| `experimental_moral_psychology_simulated_data.csv` | R-generated synthetic dataset |
| `experimental_moral_judgment_model.csv` | R moral judgment model coefficients |
| `experimental_moral_judgment_model_fit.csv` | R model fit statistics |
| `experimental_blame_model.csv` | R blame model coefficients |
| `experimental_condition_summary.csv` | R summary by power condition |
| `experimental_moral_judgment_predictions.csv` | R prediction grid |
