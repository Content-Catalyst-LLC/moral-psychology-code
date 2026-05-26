"""Synthetic hypocrisy, dehumanization, and moral failure model.

This script simulates moral double standards, perceived humanness, ingroup
bias, institutional value-practice gaps, empathic recognition, accountability,
victim visibility, and moral failure probability.

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
            "judgment_other": np.random.normal(0, 1, n),
            "judgment_self": np.random.normal(0, 1, n),
            "perceived_humanness": np.random.normal(0, 1, n),
            "ingroup_bias": np.random.normal(0, 1, n),
            "empathic_recognition": np.random.normal(0, 1, n),
            "public_value_claim": np.random.normal(0, 1, n),
            "actual_practice_integrity": np.random.normal(0, 1, n),
            "accountability_strength": np.random.normal(0, 1, n),
            "victim_visibility": np.random.normal(0, 1, n),
        }
    )

    df["hypocrisy"] = df["judgment_other"] - df["judgment_self"]
    df["dehumanization"] = 1 - df["perceived_humanness"]
    df["institutional_hypocrisy"] = (
        df["public_value_claim"] - df["actual_practice_integrity"]
    )

    latent = (
        0.45 * df["hypocrisy"]
        + 0.40 * df["dehumanization"]
        + 0.30 * df["ingroup_bias"]
        + 0.25 * df["institutional_hypocrisy"]
        - 0.35 * df["empathic_recognition"]
        - 0.25 * df["accountability_strength"]
        - 0.20 * df["victim_visibility"]
        + np.random.normal(0, 0.8, n)
    )

    df["moral_failure_probability"] = 1 / (1 + np.exp(-latent))
    df["moral_failure"] = (df["moral_failure_probability"] >= 0.5).astype(int)

    df["hypocrisy_group"] = np.where(
        df["hypocrisy"] >= df["hypocrisy"].median(),
        "Higher hypocrisy",
        "Lower hypocrisy",
    )

    summary = (
        df.groupby("hypocrisy_group")
        .agg(
            mean_failure_prob=("moral_failure_probability", "mean"),
            failure_rate=("moral_failure", "mean"),
            mean_dehumanization=("dehumanization", "mean"),
            mean_empathy=("empathic_recognition", "mean"),
            mean_institutional_hypocrisy=("institutional_hypocrisy", "mean"),
            mean_accountability=("accountability_strength", "mean"),
            mean_victim_visibility=("victim_visibility", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for hypocrisy in np.linspace(-2, 2, 41):
        for dehumanization in [-1, 0, 1]:
            for institutional_hypocrisy in [-1, 0, 1]:
                latent_scenario = (
                    0.45 * hypocrisy
                    + 0.40 * dehumanization
                    + 0.30 * 0
                    + 0.25 * institutional_hypocrisy
                    - 0.35 * 0
                    - 0.25 * 0
                    - 0.20 * 0
                )

                probability = 1 / (1 + np.exp(-latent_scenario))

                scenario_rows.append(
                    {
                        "hypocrisy": hypocrisy,
                        "dehumanization": dehumanization,
                        "institutional_hypocrisy": institutional_hypocrisy,
                        "predicted_failure_probability": probability,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_risk_cases = (
        df.sort_values("moral_failure_probability", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "hypocrisy_dehumanization_python.csv", index=False)
    summary.to_csv(output_tables / "hypocrisy_dehumanization_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "hypocrisy_dehumanization_scenarios.csv", index=False)
    high_risk_cases.to_csv(
        output_tables / "hypocrisy_dehumanization_high_risk_cases.csv",
        index=False,
    )

    print("Synthetic hypocrisy and dehumanization outputs written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
