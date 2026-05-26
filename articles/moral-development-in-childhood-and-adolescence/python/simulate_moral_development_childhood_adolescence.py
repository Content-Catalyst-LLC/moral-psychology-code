"""Synthetic moral development in childhood and adolescence model.

This script simulates developmental shifts in perspective-taking, empathic concern,
norm understanding, peer context, family support, school climate, peer-status pressure,
harm understanding, fairness reasoning, conventional sensitivity, personal-autonomy
understanding, and moral action probability.

Educational and reproducible research scaffold only.
"""

from pathlib import Path

import numpy as np
import pandas as pd


def assign_development_band(latent_value: float) -> str:
    """Return synthetic developmental-band label."""
    if latent_value < -0.5:
        return "Early-childhood pattern"
    if latent_value < 0.8:
        return "Middle-childhood pattern"
    return "Adolescent pattern"


def main() -> None:
    np.random.seed(42)

    article_root = Path(__file__).resolve().parents[1]
    output_tables = article_root / "outputs" / "tables"
    output_tables.mkdir(parents=True, exist_ok=True)

    n = 2600

    df = pd.DataFrame(
        {
            "case_id": np.arange(1, n + 1),
            "age": np.random.uniform(5, 18, n),
            "perspective_taking": np.random.normal(0, 1, n),
            "empathic_concern": np.random.normal(0, 1, n),
            "norm_understanding": np.random.normal(0, 1, n),
            "peer_context": np.random.normal(0, 1, n),
            "family_support": np.random.normal(0, 1, n),
            "school_climate": np.random.normal(0, 1, n),
            "peer_status_pressure": np.random.normal(0, 1, n),
        }
    )

    df["latent_moral_development"] = (
        0.12 * df["age"]
        - 0.002 * (df["age"] ** 2)
        + 0.40 * df["perspective_taking"]
        + 0.35 * df["empathic_concern"]
        + 0.38 * df["norm_understanding"]
        + 0.20 * df["peer_context"]
        + 0.25 * df["family_support"]
        + 0.20 * df["school_climate"]
        - 0.20 * df["peer_status_pressure"]
        + np.random.normal(0, 1, n)
    )

    df["harm_understanding"] = (
        0.50 * df["latent_moral_development"]
        + 0.25 * df["empathic_concern"]
        + np.random.normal(0, 0.8, n)
    )

    df["fairness_reasoning"] = (
        0.45 * df["latent_moral_development"]
        + 0.20 * df["perspective_taking"]
        + np.random.normal(0, 0.8, n)
    )

    df["conventional_sensitivity"] = (
        0.30 * df["latent_moral_development"]
        + 0.25 * df["norm_understanding"]
        + np.random.normal(0, 0.8, n)
    )

    df["personal_autonomy_understanding"] = (
        0.25 * df["latent_moral_development"]
        + 0.30 * df["perspective_taking"]
        + 0.18 * df["age"]
        + np.random.normal(0, 0.8, n)
    )

    df["development_band"] = df["latent_moral_development"].apply(assign_development_band)

    latent_action = (
        0.45 * df["latent_moral_development"]
        + 0.30 * df["empathic_concern"]
        + 0.25 * df["school_climate"]
        - 0.30 * df["peer_status_pressure"]
        + np.random.normal(0, 0.9, n)
    )

    df["moral_action_probability"] = 1 / (1 + np.exp(-latent_action))
    df["moral_action"] = (df["moral_action_probability"] >= 0.5).astype(int)

    summary = (
        df.groupby("development_band")
        .agg(
            mean_age=("age", "mean"),
            mean_perspective_taking=("perspective_taking", "mean"),
            mean_empathy=("empathic_concern", "mean"),
            mean_norm_understanding=("norm_understanding", "mean"),
            mean_harm=("harm_understanding", "mean"),
            mean_fairness=("fairness_reasoning", "mean"),
            mean_convention=("conventional_sensitivity", "mean"),
            mean_personal_autonomy=("personal_autonomy_understanding", "mean"),
            mean_action_probability=("moral_action_probability", "mean"),
            action_rate=("moral_action", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for age in np.linspace(5, 18, 40):
        for empathy in [-1, 0, 1]:
            for peer_pressure in [-1, 0, 1]:
                latent = (
                    0.12 * age
                    - 0.002 * (age ** 2)
                    + 0.40 * 0
                    + 0.35 * empathy
                    + 0.38 * 0
                    + 0.20 * 0
                    + 0.25 * 0
                    + 0.20 * 0
                    - 0.20 * peer_pressure
                )

                action_latent = (
                    0.45 * latent
                    + 0.30 * empathy
                    + 0.25 * 0
                    - 0.30 * peer_pressure
                )

                action_probability = 1 / (1 + np.exp(-action_latent))

                scenario_rows.append(
                    {
                        "age": age,
                        "empathic_concern": empathy,
                        "peer_status_pressure": peer_pressure,
                        "latent_moral_development": latent,
                        "predicted_band": assign_development_band(latent),
                        "predicted_action_probability": action_probability,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_development_low_action = (
        df[
            (df["latent_moral_development"] > df["latent_moral_development"].quantile(0.75))
            & (df["moral_action"] == 0)
        ]
        .sort_values("peer_status_pressure", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "moral_development_childhood_adolescence_python.csv", index=False)
    summary.to_csv(output_tables / "moral_development_band_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "moral_development_age_scenarios.csv", index=False)
    high_development_low_action.to_csv(
        output_tables / "moral_development_high_development_low_action_cases.csv",
        index=False,
    )

    print("Synthetic childhood and adolescence moral-development outputs written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
