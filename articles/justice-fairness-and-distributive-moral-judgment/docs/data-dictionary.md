# Data Dictionary

## Synthetic variables

| Variable | Description |
|---|---|
| `case_id` | Synthetic case identifier |
| `equality_weight` | Synthetic concern for equal shares, equal standing, or baseline entitlement |
| `equity_weight` | Synthetic concern for contribution, effort, productivity, or proportionality |
| `need_weight` | Synthetic concern for vulnerability, deprivation, or urgency |
| `desert_weight` | Synthetic concern for responsibility, merit, conduct, or deserved reward |
| `priority_worse_off` | Synthetic concern for priority to the worse off |
| `self_interest_bias` | Synthetic self-interest bias in distributive judgment |
| `procedural_trust` | Synthetic trust in distributive procedure or institutional legitimacy |
| `group_distance` | Synthetic social distance from recipient or affected group |
| `historical_repair_salience` | Synthetic salience of historical repair or inherited injustice |
| `distributive_judgment` | Synthetic distributive moral judgment score |
| `support_fair_allocation` | Binary synthetic support indicator for modeled fair allocation |
| `inequity_aversion` | Synthetic inequity-aversion score |
| `need_group` | Need-sensitivity grouping used in summary output |

## Generated outputs

| Output | Description |
|---|---|
| `justice_fairness_distributive_judgment_python.csv` | Python-generated synthetic dataset |
| `justice_fairness_distributive_summary.csv` | Python need-group summary |
| `justice_fairness_distributive_scenarios.csv` | Python scenario grid |
| `justice_fairness_high_need_low_support_cases.csv` | Python high-need low-support synthetic cases |
| `justice_fairness_distributive_judgment_simulated_data.csv` | R-generated synthetic dataset |
| `distributive_judgment_model.csv` | R distributive judgment model coefficients |
| `distributive_judgment_model_fit.csv` | R distributive judgment model fit statistics |
| `fair_allocation_support_model.csv` | R support model coefficients |
| `fair_allocation_support_model_fit.csv` | R support model fit statistics |
| `need_group_summary.csv` | R need-group summary |
| `fair_allocation_prediction_grid.csv` | R prediction grid |
