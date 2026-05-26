"""Synthetic conscience, guilt, shame, and moral self-evaluation model.

This script simulates differentiated conscience processes and their consequences
for repair versus avoidance. It models how perceived wrongdoing, responsibility,
exposure, global self-condemnation, empathic acknowledgment, agency capacity,
defensiveness, and repair pathways interact to produce guilt, shame, conscience
activation, repair probability, and avoidance probability.

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
            "perceived_responsibility": np.random.normal(0, 1, n),
            "exposure_before_others": np.random.normal(0, 1, n),
            "norm_internalization": np.random.normal(0, 1, n),
            "global_self_condemnation": np.random.normal(0, 1, n),
            "empathic_acknowledgment": np.random.normal(0, 1, n),
            "repair_pathway": np.random.normal(0, 1, n),
            "agency_capacity": np.random.normal(0, 1, n),
            "defensiveness": np.random.normal(0, 1, n),
        }
    )

    df["guilt"] = (
        0.55 * df["perceived_wrongdoing"]
        + 0.50 * df["perceived_responsibility"]
        + 0.25 * df["norm_internalization"]
        + 0.15 * df["agency_capacity"]
        + np.random.normal(0, 0.8, n)
    )

    df["shame"] = (
        0.55 * df["global_self_condemnation"]
        + 0.45 * df["exposure_before_others"]
        + 0.20 * df["norm_internalization"]
        - 0.10 * df["agency_capacity"]
        + np.random.normal(0, 0.8, n)
    )

    df["conscience_activation"] = (
        0.40 * df["guilt"]
        + 0.35 * df["shame"]
        + 0.25 * df["norm_internalization"]
        + 0.20 * df["perceived_responsibility"]
        + np.random.normal(0, 0.7, n)
    )

    repair_latent = (
        0.50 * df["guilt"]
        - 0.30 * df["shame"]
        + 0.35 * df["empathic_acknowledgment"]
        + 0.30 * df["repair_pathway"]
        + 0.20 * df["agency_capacity"]
        - 0.25 * df["defensiveness"]
        + np.random.normal(0, 0.8, n)
    )

    avoidance_latent = (
        0.45 * df["shame"]
        - 0.20 * df["guilt"]
        - 0.20 * df["repair_pathway"]
        - 0.20 * df["agency_capacity"]
        + 0.30 * df["defensiveness"]
        + np.random.normal(0, 0.8, n)
    )

    df["repair_probability"] = 1 / (1 + np.exp(-repair_latent))
    df["repair_action"] = (df["repair_probability"] >= 0.5).astype(int)

    df["avoidance_probability"] = 1 / (1 + np.exp(-avoidance_latent))
    df["avoidance_action"] = (df["avoidance_probability"] >= 0.5).astype(int)

    df["conscience_group"] = np.where(
        df["conscience_activation"] >= df["conscience_activation"].median(),
        "Higher conscience activation",
        "Lower conscience activation",
    )

    summary = (
        df.groupby("conscience_group")
        .agg(
            mean_guilt=("guilt", "mean"),
            mean_shame=("shame", "mean"),
            mean_responsibility=("perceived_responsibility", "mean"),
            mean_agency=("agency_capacity", "mean"),
            mean_repair_prob=("repair_probability", "mean"),
            repair_rate=("repair_action", "mean"),
            mean_avoidance_prob=("avoidance_probability", "mean"),
            avoidance_rate=("avoidance_action", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for guilt in np.linspace(-2, 2, 41):
        for shame in [-1, 0, 1]:
            for agency in [-1, 0, 1]:
                repair_latent = (
                    0.50 * guilt
                    - 0.30 * shame
                    + 0.35 * 0
                    + 0.30 * 0
                    + 0.20 * agency
                    - 0.25 * 0
                )

                avoidance_latent = (
                    0.45 * shame
                    - 0.20 * guilt
                    - 0.20 * 0
                    - 0.20 * agency
                    + 0.30 * 0
                )

                scenario_rows.append(
                    {
                        "guilt": guilt,
                        "shame": shame,
                        "agency_capacity": agency,
                        "predicted_repair_probability": 1 / (1 + np.exp(-repair_latent)),
                        "predicted_avoidance_probability": 1 / (1 + np.exp(-avoidance_latent)),
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_shame_low_repair = (
        df[
            (df["shame"] > df["shame"].quantile(0.75))
            & (df["repair_action"] == 0)
        ]
        .sort_values(["defensiveness", "exposure_before_others"], ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    high_guilt_high_repair = (
        df[
            (df["guilt"] > df["guilt"].quantile(0.75))
            & (df["repair_action"] == 1)
        ]
        .sort_values(["empathic_acknowledgment", "repair_pathway"], ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "conscience_guilt_shame_python_simulation.csv", index=False)
    summary.to_csv(output_tables / "conscience_guilt_shame_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "conscience_guilt_shame_scenarios.csv", index=False)
    high_shame_low_repair.to_csv(
        output_tables / "conscience_high_shame_low_repair_cases.csv",
        index=False,
    )
    high_guilt_high_repair.to_csv(
        output_tables / "conscience_high_guilt_high_repair_cases.csv",
        index=False,
    )

    print("Synthetic conscience outputs written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
