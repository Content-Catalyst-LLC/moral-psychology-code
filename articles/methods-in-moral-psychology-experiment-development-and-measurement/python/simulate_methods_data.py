"""Synthetic methods model for moral psychology.

This script simulates an integrated moral-psychology methods dataset combining:
- experimental condition
- developmental age variation
- norm learning
- wrongness judgment
- blame judgment
- action tendency
- latent construct measurement

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
            "participant_id": np.arange(1, n + 1),
            "experimental_condition": np.random.choice(
                ["control", "intent_salient", "excuse_salient"], size=n
            ),
            "age": np.random.uniform(8, 70, n),
            "norm_learning": np.random.normal(0, 1, n),
            "reflection": np.random.normal(0, 1, n),
            "social_desirability": np.random.normal(0, 1, n),
        }
    )

    intent_bonus = np.where(df["experimental_condition"] == "intent_salient", 0.35, 0)
    excuse_penalty = np.where(df["experimental_condition"] == "excuse_salient", -0.30, 0)

    df["wrongness_judgment"] = (
        0.25 * df["norm_learning"]
        + 0.15 * df["reflection"]
        + intent_bonus
        + np.random.normal(0, 0.8, n)
    )

    df["blame_judgment"] = (
        0.30 * df["wrongness_judgment"]
        + excuse_penalty
        + 0.10 * (df["age"] / 10)
        + np.random.normal(0, 0.8, n)
    )

    df["action_tendency"] = (
        0.20 * df["wrongness_judgment"]
        + 0.20 * df["blame_judgment"]
        + 0.15 * df["norm_learning"]
        - 0.10 * df["social_desirability"]
        + np.random.normal(0, 0.8, n)
    )

    df["latent_moral_construct"] = (
        0.35 * df["wrongness_judgment"]
        + 0.30 * df["blame_judgment"]
        + 0.20 * df["norm_learning"]
        + 0.15 * df["action_tendency"]
        + np.random.normal(0, 0.8, n)
    )

    summary = (
        df.groupby("experimental_condition")
        .agg(
            mean_wrongness=("wrongness_judgment", "mean"),
            mean_blame=("blame_judgment", "mean"),
            mean_action_tendency=("action_tendency", "mean"),
            mean_latent=("latent_moral_construct", "mean"),
            mean_age=("age", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for age in np.linspace(8, 70, 40):
        for norm in [-1, 0, 1]:
            for condition in ["control", "intent_salient", "excuse_salient"]:
                intent_effect = 0.35 if condition == "intent_salient" else 0
                excuse_effect = -0.30 if condition == "excuse_salient" else 0

                wrongness = 0.25 * norm + 0.15 * 0 + intent_effect
                blame = 0.30 * wrongness + excuse_effect + 0.10 * (age / 10)

                scenario_rows.append(
                    {
                        "age": age,
                        "norm_learning": norm,
                        "experimental_condition": condition,
                        "predicted_wrongness": wrongness,
                        "predicted_blame": blame,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    df["judgment_action_gap"] = df["wrongness_judgment"] - df["action_tendency"]

    gap_cases = (
        df.assign(abs_gap=lambda x: x["judgment_action_gap"].abs())
        .sort_values("abs_gap", ascending=False)
        .head(25)
        .drop(columns=["abs_gap"])
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "methods_moral_psychology_python.csv", index=False)
    summary.to_csv(output_tables / "methods_moral_psychology_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "methods_moral_psychology_scenarios.csv", index=False)
    gap_cases.to_csv(
        output_tables / "methods_moral_psychology_judgment_action_gap_cases.csv",
        index=False,
    )

    print("Synthetic methods data written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
