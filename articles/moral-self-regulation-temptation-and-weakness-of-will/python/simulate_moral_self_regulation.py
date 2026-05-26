"""Synthetic moral self-regulation and weakness-of-will model.

This script simulates moral action and weakness of will from moral judgment,
temptation intensity, fatigue, situational pressure, self-regulatory capacity,
moral identity, and rationalization tendency. It also models repair capacity.

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
            "temptation_intensity": np.random.normal(0, 1, n),
            "fatigue": np.random.normal(0, 1, n),
            "situational_pressure": np.random.normal(0, 1, n),
            "self_regulatory_capacity": np.random.normal(0, 1, n),
            "moral_identity": np.random.normal(0, 1, n),
            "rationalization_tendency": np.random.normal(0, 1, n),
            "guilt_recognition": np.random.normal(0, 1, n),
            "humility": np.random.normal(0, 1, n),
            "accountability": np.random.normal(0, 1, n),
            "defensiveness": np.random.normal(0, 1, n),
        }
    )

    action_latent = (
        0.40 * df["moral_judgment"]
        + 0.35 * df["self_regulatory_capacity"]
        + 0.25 * df["moral_identity"]
        - 0.45 * df["temptation_intensity"]
        - 0.30 * df["fatigue"]
        - 0.35 * df["situational_pressure"]
        - 0.25 * df["rationalization_tendency"]
        + np.random.normal(0, 0.8, n)
    )

    df["moral_action_probability"] = 1 / (1 + np.exp(-action_latent))
    df["moral_action"] = (df["moral_action_probability"] >= 0.5).astype(int)
    df["weakness_of_will"] = df["moral_judgment"] - df["moral_action"]

    df["repair_capacity"] = (
        0.35 * df["guilt_recognition"]
        + 0.35 * df["humility"]
        + 0.30 * df["accountability"]
        - 0.40 * df["defensiveness"]
        - 0.20 * df["rationalization_tendency"]
        + np.random.normal(0, 0.8, n)
    )

    df["temptation_group"] = pd.qcut(
        df["temptation_intensity"],
        q=4,
        labels=["Low", "Lower-middle", "Upper-middle", "High"],
    )

    summary = (
        df.groupby("temptation_group", observed=False)
        .agg(
            mean_judgment=("moral_judgment", "mean"),
            mean_regulation=("self_regulatory_capacity", "mean"),
            mean_identity=("moral_identity", "mean"),
            mean_action_prob=("moral_action_probability", "mean"),
            action_rate=("moral_action", "mean"),
            mean_weakness=("weakness_of_will", "mean"),
            mean_repair=("repair_capacity", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for temptation in np.linspace(-2, 2, 41):
        for regulation in [-1, 0, 1]:
            for fatigue in [-1, 0, 1]:
                latent = (
                    0.40 * 1
                    + 0.35 * regulation
                    + 0.25 * 0
                    - 0.45 * temptation
                    - 0.30 * fatigue
                    - 0.35 * 0
                    - 0.25 * 0
                )
                probability = 1 / (1 + np.exp(-latent))

                scenario_rows.append(
                    {
                        "temptation_intensity": temptation,
                        "self_regulatory_capacity": regulation,
                        "fatigue": fatigue,
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
            ["temptation_intensity", "fatigue", "situational_pressure"],
            ascending=False,
        )
        .head(25)
        .reset_index(drop=True)
    )

    high_weakness_low_repair = (
        df[
            (df["weakness_of_will"] > df["weakness_of_will"].quantile(0.75))
            & (df["repair_capacity"] < df["repair_capacity"].quantile(0.25))
        ]
        .sort_values("rationalization_tendency", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "moral_self_regulation_python_simulation.csv", index=False)
    summary.to_csv(output_tables / "moral_self_regulation_temptation_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "moral_self_regulation_scenarios.csv", index=False)
    high_judgment_low_action.to_csv(
        output_tables / "moral_self_regulation_high_judgment_low_action_cases.csv",
        index=False,
    )
    high_weakness_low_repair.to_csv(
        output_tables / "moral_self_regulation_high_weakness_low_repair_cases.csv",
        index=False,
    )

    print("Synthetic moral self-regulation outputs written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
