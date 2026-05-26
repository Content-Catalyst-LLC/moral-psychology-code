# Data Dictionary

## Synthetic variables

| Variable | Description |
|---|---|
| `participant_id` | Synthetic participant identifier |
| `experimental_condition` | Assigned experimental condition: control, intent salient, or excuse salient |
| `age` | Synthetic participant age from 8 to 70 |
| `norm_learning` | Synthetic standardized indicator of norm acquisition or norm sensitivity |
| `reflection` | Synthetic standardized indicator of reflective processing |
| `social_desirability` | Synthetic standardized response-style indicator |
| `wrongness_judgment` | Synthetic observed wrongness rating |
| `blame_judgment` | Synthetic observed blame rating |
| `action_tendency` | Synthetic behavioral or action-oriented indicator |
| `latent_moral_construct` | Synthetic latent construct composed from several observed indicators |
| `judgment_action_gap` | Difference between wrongness judgment and action tendency |

## Generated outputs

| Output | Description |
|---|---|
| `methods_moral_psychology_python.csv` | Python-generated synthetic dataset |
| `methods_moral_psychology_summary.csv` | Summary by experimental condition |
| `methods_moral_psychology_scenarios.csv` | Scenario grid across age, norm learning, and condition |
| `methods_moral_psychology_judgment_action_gap_cases.csv` | Synthetic cases with large judgment-action gaps |
| `methods_moral_psychology_simulated_data.csv` | R-generated synthetic dataset |
| `methods_moral_psychology_wrongness_model.csv` | R model coefficients for wrongness judgment |
| `methods_moral_psychology_blame_model.csv` | R model coefficients for blame judgment |
| `methods_moral_psychology_latent_model.csv` | R model coefficients for latent construct |
| `methods_moral_psychology_condition_summary.csv` | R summary by experimental condition |
| `methods_moral_psychology_predictions.csv` | R prediction grid |
