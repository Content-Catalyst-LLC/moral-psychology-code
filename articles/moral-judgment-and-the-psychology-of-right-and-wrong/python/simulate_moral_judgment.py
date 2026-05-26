"""Synthetic moral judgment model.

This script simulates moral judgment as a dynamic process in which harm
perception, norm violation, intention attribution, emotion, group framing,
social pressure, ambiguity, agency, and repair opportunity shape judgments
of wrongness, blame, and constructive response.

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
            "perceived_harm": np.random.normal(0, 1, n),
            "norm_violation": np.random.normal(0, 1, n),
            "inferred_intention": np.random.normal(0, 1, n),
            "emotional_activation": np.random.normal(0, 1, n),
            "group_framing": np.random.normal(0, 1, n),
            "social_pressure": np.random.normal(0, 1, n),
            "situational_ambiguity": np.random.normal(0, 1, n),
            "perceived_agency": np.random.normal(0, 1, n),
            "repair_opportunity": np.random.normal(0, 1, n),
            "dignity_preservation": np.random.normal(0, 1, n),
            "punitive_pressure": np.random.normal(0, 1, n),
            "institutional_support": np.random.normal(0, 1, n),
        }
    )

    df["latent_wrongness"] = (
        0.70 * df["perceived_harm"]
        + 0.55 * df["norm_violation"]
        + 0.50 * df["inferred_intention"]
        + 0.25 * df["emotional_activation"]
        + 0.20 * df["group_framing"]
        + 0.20 * df["social_pressure"]
        - 0.30 * df["situational_ambiguity"]
        + np.random.normal(0, 0.7, n)
    )

    df["wrongness_rating"] = np.clip(
        1 + 1.2 * df["latent_wrongness"] + np.random.normal(0, 0.8, n),
        1,
        7,
    )

    df["latent_blame"] = (
        0.60 * df["wrongness_rating"]
        + 0.45 * df["perceived_agency"]
        - 0.35 * df["repair_opportunity"]
        + 0.15 * df["emotional_activation"]
        - 0.15 * df["situational_ambiguity"]
        + np.random.normal(0, 0.8, n)
    )

    df["blame_rating"] = np.clip(
        1 + 1.0 * df["latent_blame"] + np.random.normal(0, 0.8, n),
        1,
        7,
    )

    df["judged_wrong"] = (df["wrongness_rating"] >= 4).astype(int)

    df["constructive_response_score"] = (
        0.35 * df["blame_rating"]
        + 0.45 * df["repair_opportunity"]
        + 0.35 * df["dignity_preservation"]
        + 0.25 * df["institutional_support"]
        - 0.30 * df["punitive_pressure"]
        + np.random.normal(0, 0.9, n)
    )

    df["constructive_response"] = (
        df["constructive_response_score"]
        >= df["constructive_response_score"].median()
    ).astype(int)

    df["pressure_bin"] = pd.qcut(
        df["social_pressure"],
        q=4,
        labels=["Low", "Lower-middle", "Upper-middle", "High"],
    )

    pressure_summary = (
        df.groupby("pressure_bin", observed=False)
        .agg(
            mean_wrongness=("wrongness_rating", "mean"),
            mean_blame=("blame_rating", "mean"),
            proportion_judged_wrong=("judged_wrong", "mean"),
            mean_harm=("perceived_harm", "mean"),
            mean_intention=("inferred_intention", "mean"),
            mean_repair=("repair_opportunity", "mean"),
            constructive_response_rate=("constructive_response", "mean"),
        )
        .reset_index()
    )

    harm_values = np.linspace(-2, 2, 41)
    intention_values = [-1, 0, 1]
    pressure_values = [-1, 0, 1]

    scenario_rows = []

    for harm in harm_values:
        for intention in intention_values:
            for pressure in pressure_values:
                latent_wrongness = (
                    0.70 * harm
                    + 0.55 * 0
                    + 0.50 * intention
                    + 0.25 * 0
                    + 0.20 * 0
                    + 0.20 * pressure
                    - 0.30 * 0
                )

                wrongness_rating = np.clip(
                    1 + 1.2 * latent_wrongness,
                    1,
                    7,
                )

                scenario_rows.append(
                    {
                        "perceived_harm": harm,
                        "inferred_intention": intention,
                        "social_pressure": pressure,
                        "predicted_wrongness_rating": wrongness_rating,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_pressure_high_judgment = (
        df[
            (df["social_pressure"] > df["social_pressure"].quantile(0.75))
            & (df["wrongness_rating"] > df["wrongness_rating"].quantile(0.75))
        ]
        .sort_values(
            ["emotional_activation", "group_framing"],
            ascending=False,
        )
        .head(25)
        .reset_index(drop=True)
    )

    low_repair_high_blame = (
        df[
            (df["repair_opportunity"] < df["repair_opportunity"].quantile(0.25))
            & (df["blame_rating"] > df["blame_rating"].quantile(0.75))
        ]
        .sort_values(
            ["blame_rating", "punitive_pressure"],
            ascending=False,
        )
        .head(25)
        .reset_index(drop=True)
    )

    wrongness_blame_divergence = (
        df.assign(
            divergence=(df["wrongness_rating"] - df["blame_rating"]).abs()
        )
        .sort_values("divergence", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "moral_judgment_python_simulation.csv", index=False)
    pressure_summary.to_csv(output_tables / "moral_judgment_pressure_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "moral_judgment_scenario_grid.csv", index=False)
    high_pressure_high_judgment.to_csv(
        output_tables / "moral_judgment_high_pressure_high_judgment_cases.csv",
        index=False,
    )
    low_repair_high_blame.to_csv(
        output_tables / "moral_judgment_low_repair_high_blame_cases.csv",
        index=False,
    )
    wrongness_blame_divergence.to_csv(
        output_tables / "moral_judgment_wrongness_blame_divergence_cases.csv",
        index=False,
    )

    print("Synthetic moral judgment outputs written to:", output_tables)
    print(pressure_summary)


if __name__ == "__main__":
    main()
