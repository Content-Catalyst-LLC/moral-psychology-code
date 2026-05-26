"""Synthetic moral motivation and judgment-action gap model.

This script simulates moral action and the judgment-action gap from moral
judgment, emotional activation, moral identity, self-regulation, situational
pressure, and rationalization tendency. It also models repair capacity.

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
            "case_id": np.arange(1, n + 1),
            "moral_judgment": np.random.normal(0, 1, n),
            "emotional_activation": np.random.normal(0, 1, n),
            "moral_identity": np.random.normal(0, 1, n),
            "self_regulation": np.random.normal(0, 1, n),
            "situational_pressure": np.random.normal(0, 1, n),
            "rationalization_tendency": np.random.normal(0, 1, n),
            "guilt_recognition": np.random.normal(0, 1, n),
            "humility": np.random.normal(0, 1, n),
            "accountability": np.random.normal(0, 1, n),
            "defensiveness": np.random.normal(0, 1, n),
        }
    )

    action_latent = (
        0.45 * df["moral_judgment"]
        + 0.30 * df["emotional_activation"]
        + 0.35 * df["moral_identity"]
        + 0.40 * df["self_regulation"]
        - 0.50 * df["situational_pressure"]
        - 0.25 * df["rationalization_tendency"]
        + np.random.normal(0, 0.8, n)
    )

    df["moral_action_probability"] = 1 / (1 + np.exp(-action_latent))
    df["moral_action"] = (df["moral_action_probability"] >= 0.5).astype(int)
    df["judgment_action_gap"] = df["moral_judgment"] - df["moral_action"]

    df["repair_capacity"] = (
        0.35 * df["guilt_recognition"]
        + 0.35 * df["humility"]
        + 0.30 * df["accountability"]
        - 0.40 * df["defensiveness"]
        - 0.20 * df["rationalization_tendency"]
        + np.random.normal(0, 0.8, n)
    )

    df["pressure_group"] = pd.qcut(
        df["situational_pressure"],
        q=4,
        labels=["Low", "Lower-middle", "Upper-middle", "High"],
    )

    summary = (
        df.groupby("pressure_group", observed=False)
        .agg(
            mean_judgment=("moral_judgment", "mean"),
            mean_emotion=("emotional_activation", "mean"),
            mean_identity=("moral_identity", "mean"),
            mean_self_regulation=("self_regulation", "mean"),
            mean_action_prob=("moral_action_probability", "mean"),
            action_rate=("moral_action", "mean"),
            mean_gap=("judgment_action_gap", "mean"),
            mean_repair=("repair_capacity", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for judgment in np.linspace(-2, 2, 41):
        for pressure in [-1, 0, 1]:
            for regulation in [-1, 0, 1]:
                latent = (
                    0.45 * judgment
                    + 0.30 * 0
                    + 0.35 * 0
                    + 0.40 * regulation
                    - 0.50 * pressure
                    - 0.25 * 0
                )

                probability = 1 / (1 + np.exp(-latent))

                scenario_rows.append(
                    {
                        "moral_judgment": judgment,
                        "situational_pressure": pressure,
                        "self_regulation": regulation,
                        "predicted_action_probability": probability,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_judgment_low_action = (
        df[
            (df["moral_judgment"] > df["moral_judgment"].quantile(0.75))
            & (df["moral_action"] == 0)
        ]
        .sort_values(
            ["situational_pressure", "rationalization_tendency"],
            ascending=False,
        )
        .head(25)
        .reset_index(drop=True)
    )

    large_gap_low_repair = (
        df[
            (df["judgment_action_gap"] > df["judgment_action_gap"].quantile(0.75))
            & (df["repair_capacity"] < df["repair_capacity"].quantile(0.25))
        ]
        .sort_values("defensiveness", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "moral_motivation_python_simulation.csv", index=False)
    summary.to_csv(output_tables / "moral_motivation_pressure_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "moral_motivation_scenarios.csv", index=False)
    high_judgment_low_action.to_csv(
        output_tables / "moral_motivation_high_judgment_low_action_cases.csv",
        index=False,
    )
    large_gap_low_repair.to_csv(
        output_tables / "moral_motivation_large_gap_low_repair_cases.csv",
        index=False,
    )

    print("Synthetic moral motivation outputs written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
