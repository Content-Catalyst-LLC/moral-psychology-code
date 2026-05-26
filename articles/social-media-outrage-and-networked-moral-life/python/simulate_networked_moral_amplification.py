"""Synthetic networked moral amplification model.

This script simulates social media outrage, expected reward,
algorithmic amplification, group-identity salience, visibility bias,
contextual correction, perceived norm extremity, misinformation susceptibility,
and moralized sharing.

Educational and reproducible research scaffold only.
"""

from pathlib import Path

import numpy as np
import pandas as pd


def main() -> None:
    np.random.seed(42)

    article_root = Path(__file__).resolve().parents[1]
    output_tables = article_root / "outputs" / "tables"
    output_tables.mkdir(parents=True, exist_ok=True)

    n = 2600

    df = pd.DataFrame(
        {
            "user_id": np.arange(1, n + 1),
            "outrage_intensity": np.random.normal(0, 1, n),
            "expected_reward": np.random.normal(0, 1, n),
            "algorithmic_amplification": np.random.normal(0, 1, n),
            "group_identity_salience": np.random.normal(0, 1, n),
            "visibility_bias": np.random.normal(0, 1, n),
            "contextual_correction": np.random.normal(0, 1, n),
            "misinformation_susceptibility": np.random.normal(0, 1, n),
            "cross_group_exposure": np.random.normal(0, 1, n),
        }
    )

    expression_latent = (
        0.35 * df["outrage_intensity"]
        + 0.30 * df["expected_reward"]
        + 0.25 * df["algorithmic_amplification"]
        + 0.25 * df["group_identity_salience"]
        - 0.15 * df["contextual_correction"]
        + np.random.normal(0, 0.8, n)
    )

    df["outrage_expression_prob"] = 1 / (1 + np.exp(-expression_latent))
    df["outrage_expression"] = (df["outrage_expression_prob"] >= 0.5).astype(int)

    df["perceived_norm_extremity"] = (
        0.40 * df["visibility_bias"]
        + 0.25 * df["algorithmic_amplification"]
        + 0.20 * df["outrage_expression"]
        - 0.15 * df["cross_group_exposure"]
        + np.random.normal(0, 0.8, n)
    )

    df["moralized_sharing"] = (
        0.30 * df["outrage_intensity"]
        + 0.25 * df["group_identity_salience"]
        + 0.25 * df["misinformation_susceptibility"]
        + 0.20 * df["expected_reward"]
        - 0.15 * df["contextual_correction"]
        + np.random.normal(0, 0.8, n)
    )

    df["expression_band"] = pd.qcut(
        df["outrage_expression_prob"],
        q=4,
        labels=["Low", "Lower-middle", "Upper-middle", "High"],
    )

    summary = (
        df.groupby("expression_band", observed=False)
        .agg(
            mean_expression_probability=("outrage_expression_prob", "mean"),
            mean_norm_extremity=("perceived_norm_extremity", "mean"),
            mean_reward=("expected_reward", "mean"),
            mean_amplification=("algorithmic_amplification", "mean"),
            mean_moralized_sharing=("moralized_sharing", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for outrage in np.linspace(-2, 2, 41):
        for identity in [-1, 0, 1]:
            for correction in [-1, 0, 1]:
                latent = (
                    0.35 * outrage
                    + 0.30 * 0
                    + 0.25 * 0
                    + 0.25 * identity
                    - 0.15 * correction
                )

                prob = 1 / (1 + np.exp(-latent))

                scenario_rows.append(
                    {
                        "outrage_intensity": outrage,
                        "group_identity_salience": identity,
                        "contextual_correction": correction,
                        "predicted_expression_probability": prob,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_amplification_cases = (
        df.sort_values(
            [
                "outrage_expression_prob",
                "perceived_norm_extremity",
                "moralized_sharing",
            ],
            ascending=False,
        )
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "social_media_moral_outrage_python.csv", index=False)
    summary.to_csv(output_tables / "social_media_moral_outrage_summary.csv", index=False)
    scenario_df.to_csv(
        output_tables / "social_media_moral_outrage_scenarios.csv",
        index=False,
    )
    high_amplification_cases.to_csv(
        output_tables / "social_media_moral_outrage_high_amplification_cases.csv",
        index=False,
    )

    print("Synthetic networked moral amplification data written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
