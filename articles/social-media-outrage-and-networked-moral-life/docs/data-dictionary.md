# Data Dictionary

## Synthetic variables

| Variable | Description |
|---|---|
| `user_id` | Synthetic user identifier |
| `outrage_intensity` | Synthetic felt outrage intensity |
| `expected_reward` | Synthetic expected reward from public expression |
| `algorithmic_amplification` | Synthetic platform-amplification indicator |
| `group_identity_salience` | Synthetic identity-salience indicator |
| `visibility_bias` | Synthetic visibility bias toward extreme or engaging content |
| `contextual_correction` | Synthetic correction, context, deliberation, or repair indicator |
| `misinformation_susceptibility` | Synthetic susceptibility to sharing inaccurate moralized content |
| `cross_group_exposure` | Synthetic exposure to cross-group perspectives |
| `outrage_expression_prob` | Synthetic probability of public outrage expression |
| `outrage_expression` | Binary synthetic public expression indicator |
| `perceived_norm_extremity` | Synthetic perceived norm-extremity score |
| `moralized_sharing` | Synthetic moralized-sharing score |
| `expression_band` | Quartile grouping of expression probability |

## Generated outputs

| Output | Description |
|---|---|
| `social_media_moral_outrage_python.csv` | Python-generated synthetic dataset |
| `social_media_moral_outrage_summary.csv` | Summary by outrage-expression quartile |
| `social_media_moral_outrage_scenarios.csv` | Scenario grid across outrage, identity, and correction |
| `social_media_moral_outrage_high_amplification_cases.csv` | Synthetic high-amplification cases |
| `social_media_moral_outrage_simulated_data.csv` | R-generated synthetic dataset |
| `social_media_outrage_expression_model.csv` | R outrage-expression model coefficients |
| `social_media_norm_distortion_model.csv` | R norm-distortion model coefficients |
| `social_media_moralized_sharing_model.csv` | R moralized-sharing model coefficients |
| `social_media_amplification_summary.csv` | R summary by algorithmic-amplification band |
| `social_media_outrage_expression_predictions.csv` | R prediction grid |
