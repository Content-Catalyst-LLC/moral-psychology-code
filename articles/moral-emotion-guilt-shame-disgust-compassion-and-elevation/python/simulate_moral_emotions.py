"""Synthetic moral emotion model.

This script simulates differentiated moral emotions and their downstream effects
on helping, repair, and avoidance. It is designed for analyzing how different
moral-emotional profiles produce different ethical tendencies.

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
            "perceived_wrongdoing": np.random.normal(0, 1, n),
            "specific_responsibility": np.random.normal(0, 1, n),
            "global_self_condemnation": np.random.normal(0, 1, n),
            "exposure_before_others": np.random.normal(0, 1, n),
            "perceived_violation": np.random.normal(0, 1, n),
            "boundary_threat": np.random.normal(0, 1, n),
            "perceived_suffering": np.random.normal(0, 1, n),
            "mind_perception": np.random.normal(0, 1, n),
            "admired_moral_action": np.random.normal(0, 1, n),
            "perceived_moral_excellence": np.random.normal(0, 1, n),
            "agency_capacity": np.random.normal(0, 1, n),
            "repair_pathway": np.random.normal(0, 1, n),
            "social_support": np.random.normal(0, 1, n),
        }
    )

    df["guilt"] = (
        0.55 * df["perceived_wrongdoing"]
        + 0.50 * df["specific_responsibility"]
        + 0.20 * df["agency_capacity"]
        + np.random.normal(0, 0.8, n)
    )

    df["shame"] = (
        0.60 * df["global_self_condemnation"]
        + 0.45 * df["exposure_before_others"]
        - 0.15 * df["agency_capacity"]
        + np.random.normal(0, 0.8, n)
    )

    df["disgust"] = (
        0.60 * df["perceived_violation"]
        + 0.40 * df["boundary_threat"]
        + np.random.normal(0, 0.8, n)
    )

    df["compassion"] = (
        0.65 * df["perceived_suffering"]
        + 0.35 * df["mind_perception"]
        + 0.15 * df["social_support"]
        + np.random.normal(0, 0.8, n)
    )

    df["elevation"] = (
        0.60 * df["admired_moral_action"]
        + 0.45 * df["perceived_moral_excellence"]
        + np.random.normal(0, 0.8, n)
    )

    df["helping_tendency"] = (
        0.35 * df["guilt"]
        + 0.45 * df["compassion"]
        + 0.30 * df["elevation"]
        - 0.20 * df["shame"]
        - 0.15 * df["disgust"]
        + 0.20 * df["repair_pathway"]
        + np.random.normal(0, 0.9, n)
    )

    df["repair_tendency"] = (
        0.45 * df["guilt"]
        - 0.25 * df["shame"]
        + 0.25 * df["compassion"]
        + 0.30 * df["repair_pathway"]
        + 0.20 * df["agency_capacity"]
        + np.random.normal(0, 0.9, n)
    )

    df["avoidance_tendency"] = (
        0.40 * df["shame"]
        + 0.30 * df["disgust"]
        - 0.20 * df["compassion"]
        - 0.15 * df["agency_capacity"]
        + np.random.normal(0, 0.9, n)
    )

    df["constructive_emotion_index"] = (
        df["guilt"] + df["compassion"] + df["elevation"]
    ) / 3

    df["punitive_emotion_index"] = (
        df["shame"] + df["disgust"]
    ) / 2

    df["constructive_group"] = np.where(
        df["constructive_emotion_index"] >= df["constructive_emotion_index"].median(),
        "Higher constructive moral emotion",
        "Lower constructive moral emotion",
    )

    summary = (
        df.groupby("constructive_group")
        .agg(
            mean_helping=("helping_tendency", "mean"),
            mean_repair=("repair_tendency", "mean"),
            mean_avoidance=("avoidance_tendency", "mean"),
            mean_guilt=("guilt", "mean"),
            mean_compassion=("compassion", "mean"),
            mean_elevation=("elevation", "mean"),
            mean_shame=("shame", "mean"),
            mean_disgust=("disgust", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for wrongdoing in np.linspace(-2, 2, 41):
        for suffering in [-1, 0, 1]:
            for exemplar in [-1, 0, 1]:
                guilt = 0.55 * wrongdoing + 0.50 * 0
                compassion = 0.65 * suffering + 0.35 * 0
                elevation = 0.60 * exemplar + 0.45 * 0

                helping = (
                    0.35 * guilt
                    + 0.45 * compassion
                    + 0.30 * elevation
                    - 0.20 * 0
                    - 0.15 * 0
                )

                scenario_rows.append(
                    {
                        "perceived_wrongdoing": wrongdoing,
                        "perceived_suffering": suffering,
                        "admired_moral_action": exemplar,
                        "predicted_guilt": guilt,
                        "predicted_compassion": compassion,
                        "predicted_elevation": elevation,
                        "predicted_helping_tendency": helping,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_shame_high_disgust = (
        df[
            (df["shame"] > df["shame"].quantile(0.75))
            & (df["disgust"] > df["disgust"].quantile(0.75))
        ]
        .sort_values("avoidance_tendency", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    high_compassion_high_elevation = (
        df[
            (df["compassion"] > df["compassion"].quantile(0.75))
            & (df["elevation"] > df["elevation"].quantile(0.75))
        ]
        .sort_values("helping_tendency", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    high_guilt_high_repair = (
        df[
            (df["guilt"] > df["guilt"].quantile(0.75))
            & (df["repair_tendency"] > df["repair_tendency"].quantile(0.75))
        ]
        .sort_values("repair_pathway", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "moral_emotions_python_simulation.csv", index=False)
    summary.to_csv(output_tables / "moral_emotions_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "moral_emotions_scenarios.csv", index=False)
    high_shame_high_disgust.to_csv(
        output_tables / "moral_emotions_high_shame_high_disgust_cases.csv",
        index=False,
    )
    high_compassion_high_elevation.to_csv(
        output_tables / "moral_emotions_high_compassion_high_elevation_cases.csv",
        index=False,
    )
    high_guilt_high_repair.to_csv(
        output_tables / "moral_emotions_high_guilt_high_repair_cases.csv",
        index=False,
    )

    print("Synthetic moral emotion outputs written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
