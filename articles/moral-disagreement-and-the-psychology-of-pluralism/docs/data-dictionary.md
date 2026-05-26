# Data Dictionary

## Synthetic participant-level variables

| Variable | Description |
|---|---|
| `participant_id` | Synthetic participant identifier |
| `harm_weight` | Synthetic weighting of perceived harm or suffering |
| `fairness_weight` | Synthetic weighting of fairness, equality, reciprocity, desert, or need |
| `loyalty_weight` | Synthetic weighting of loyalty or group obligation |
| `purity_weight` | Synthetic weighting of purity, sanctity, or symbolic boundary concern |
| `authority_weight` | Synthetic weighting of authority, order, role duty, or legitimacy |
| `care_weight` | Synthetic weighting of care, compassion, mercy, or relational protection |
| `identity_strength` | Synthetic strength of social or group identity |
| `framing_sensitivity` | Synthetic sensitivity to narrative or situational framing |
| `institutional_trust` | Synthetic trust in procedures, institutions, or shared authorities |
| `pluralist_tolerance` | Synthetic tolerance for unresolved moral difference |
| `moral_judgment` | Synthetic moral judgment score |

## Synthetic pair-level variables

| Variable | Description |
|---|---|
| `i` | First synthetic participant index |
| `j` | Second synthetic participant index |
| `judgment_i` | Moral judgment for participant i |
| `judgment_j` | Moral judgment for participant j |
| `disagreement` | Absolute distance between moral judgments |
| `value_gap` | Sum of absolute differences across synthetic value weights |
| `identity_gap` | Absolute difference in identity strength |
| `framing_gap` | Absolute difference in framing sensitivity |
| `trust_gap` | Absolute difference in institutional trust |
| `pluralist_tolerance_gap` | Absolute difference in pluralist tolerance |

## Generated outputs

| Output | Description |
|---|---|
| `moral_pluralism_profiles_python.csv` | Python-generated synthetic participant profiles |
| `moral_disagreement_pairs_python.csv` | Python-generated synthetic pairwise disagreement data |
| `moral_disagreement_summary.csv` | Python summary by disagreement band |
| `moral_pluralism_scenarios.csv` | Python scenario grid |
| `moral_disagreement_high_distance_pairs.csv` | Python high-disagreement synthetic pairs |
| `moral_pluralism_profiles.csv` | R-generated synthetic participant profiles |
| `moral_disagreement_pairs.csv` | R-generated synthetic pairwise disagreement data |
| `moral_disagreement_model.csv` | R model coefficients |
| `moral_disagreement_model_fit.csv` | R model fit statistics |
| `moral_disagreement_band_summary.csv` | R disagreement-band summary |
| `moral_disagreement_predictions.csv` | R prediction grid |
