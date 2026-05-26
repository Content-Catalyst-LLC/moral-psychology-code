"""Synthetic moral identity and moral agency model.

This script simulates moral identity as a function of internalization,
symbolization, narrative integration, and norm integration. It then models moral
action probability and repair capacity from identity, judgment, self-regulation,
situational pressure, humility, accountability, guilt recognition, and defensiveness.

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
            "internalization": np.random.normal(0, 1, n),
            "symbolization": np.random.normal(0, 1, n),
            "narrative_integration": np.random.normal(0, 1, n),
            "norm_integration": np.random.normal(0, 1, n),
            "moral_judgment": np.random.normal(0, 1, n),
            "self_regulatory_capacity": np.random.normal(0, 1, n),
            "situational_pressure": np.random.normal(0, 1, n),
            "guilt_recognition": np.random.normal(0, 1, n),
            "humility": np.random.normal(0, 1, n),
            "accountability": np.random.normal(0, 1, n),
            "defensiveness": np.random.normal(0, 1, n),
        }
    )

    df["moral_identity"] = (
        0.50 * df["internalization"]
        + 0.22 * df["symbolization"]
        + 0.35 * df["narrative_integration"]
        + 0.30 * df["norm_integration"]
        + np.random.normal(0, 0.8, n)
    )

    action_latent = (
        0.35 * df["moral_judgment"]
        + 0.45 * df["moral_identity"]
        + 0.30 * df["self_regulatory_capacity"]
        - 0.40 * df["situational_pressure"]
        + np.random.normal(0, 0.8, n)
    )

    df["moral_action_probability"] = 1 / (1 + np.exp(-action_latent))
    df["moral_action"] = (df["moral_action_probability"] >= 0.5).astype(int)

    df["repair_capacity"] = (
        0.35 * df["guilt_recognition"]
        + 0.35 * df["humility"]
        + 0.30 * df["accountability"]
        - 0.45 * df["defensiveness"]
        + 0.20 * df["moral_identity"]
        + np.random.normal(0, 0.8, n)
    )

    df["identity_group"] = np.where(
        df["moral_identity"] >= df["moral_identity"].median(),
        "Higher moral identity",
        "Lower moral identity",
    )

    df["pressure_group"] = np.where(
        df["situational_pressure"] >= df["situational_pressure"].median(),
        "Higher situational pressure",
        "Lower situational pressure",
    )

    identity_summary = (
        df.groupby(["identity_group", "pressure_group"])
        .agg(
            mean_action_prob=("moral_action_probability", "mean"),
            action_rate=("moral_action", "mean"),
            mean_judgment=("moral_judgment", "mean"),
            mean_self_regulation=("self_regulatory_capacity", "mean"),
            mean_pressure=("situational_pressure", "mean"),
            mean_repair=("repair_capacity", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for identity in np.linspace(-2, 2, 41):
        for pressure in [-1, 0, 1]:
            for regulation in [-1, 0, 1]:
                latent = (
                    0.35 * 0
                    + 0.45 * identity
                    + 0.30 * regulation
                    - 0.40 * pressure
                )
                probability = 1 / (1 + np.exp(-latent))

                scenario_rows.append(
                    {
                        "moral_identity": identity,
                        "situational_pressure": pressure,
                        "self_regulatory_capacity": regulation,
                        "predicted_action_probability": probability,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_identity_low_action = (
        df[
            (df["moral_identity"] > df["moral_identity"].quantile(0.75))
            & (df["moral_action"] == 0)
        ]
        .sort_values("situational_pressure", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    high_identity_low_repair = (
        df[
            (df["moral_identity"] > df["moral_identity"].quantile(0.75))
            & (df["repair_capacity"] < df["repair_capacity"].quantile(0.25))
        ]
        .sort_values("defensiveness", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "moral_identity_python_simulation.csv", index=False)
    identity_summary.to_csv(output_tables / "moral_identity_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "moral_identity_scenarios.csv", index=False)
    high_identity_low_action.to_csv(
        output_tables / "moral_identity_high_identity_low_action_cases.csv",
        index=False,
    )
    high_identity_low_repair.to_csv(
        output_tables / "moral_identity_high_identity_low_repair_cases.csv",
        index=False,
    )

    print("Synthetic moral identity outputs written to:", output_tables)
    print(identity_summary)


if __name__ == "__main__":
    main()
