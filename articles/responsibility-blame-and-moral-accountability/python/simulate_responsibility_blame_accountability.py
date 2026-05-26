"""Synthetic responsibility, blame, and accountability model.

This script simulates responsibility, blame probability, accountability score,
and accountability quality as distinct but connected moral constructs.

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
            "control": np.random.normal(0, 1, n),
            "knowledge": np.random.normal(0, 1, n),
            "role_duty": np.random.normal(0, 1, n),
            "wrongness_severity": np.random.normal(0, 1, n),
            "motive_malice": np.random.normal(0, 1, n),
            "mitigating_excuse": np.random.normal(0, 1, n),
            "institutional_structure": np.random.normal(0, 1, n),
            "victim_recognition": np.random.normal(0, 1, n),
            "repair_capacity": np.random.normal(0, 1, n),
            "prevention_capacity": np.random.normal(0, 1, n),
        }
    )

    df["responsibility"] = (
        0.40 * df["control"]
        + 0.35 * df["knowledge"]
        + 0.25 * df["role_duty"]
        + np.random.normal(0, 0.8, n)
    )

    blame_latent = (
        0.40 * df["responsibility"]
        + 0.35 * df["wrongness_severity"]
        + 0.25 * df["motive_malice"]
        - 0.30 * df["mitigating_excuse"]
        + np.random.normal(0, 0.8, n)
    )

    df["blame_probability"] = 1 / (1 + np.exp(-blame_latent))
    df["blame_assigned"] = (df["blame_probability"] >= 0.5).astype(int)

    df["accountability_score"] = (
        0.45 * df["responsibility"]
        + 0.25 * df["institutional_structure"]
        + 0.20 * df["wrongness_severity"]
        + 0.20 * df["repair_capacity"]
        + 0.15 * df["prevention_capacity"]
        + np.random.normal(0, 0.8, n)
    )

    df["accountability_quality"] = (
        0.30 * df["accountability_score"]
        + 0.25 * df["victim_recognition"]
        + 0.25 * df["repair_capacity"]
        + 0.25 * df["prevention_capacity"]
        + 0.20 * df["institutional_structure"]
        + np.random.normal(0, 0.8, n)
    )

    df["responsibility_group"] = pd.qcut(
        df["responsibility"],
        q=4,
        labels=["Low", "Lower-middle", "Upper-middle", "High"],
    )

    summary = (
        df.groupby("responsibility_group", observed=False)
        .agg(
            mean_blame_prob=("blame_probability", "mean"),
            blame_rate=("blame_assigned", "mean"),
            mean_accountability=("accountability_score", "mean"),
            mean_accountability_quality=("accountability_quality", "mean"),
            mean_excuse=("mitigating_excuse", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for responsibility in np.linspace(-2, 2, 41):
        for excuse in [-1, 0, 1]:
            latent = (
                0.40 * responsibility
                + 0.35 * 0
                + 0.25 * 0
                - 0.30 * excuse
            )

            prob = 1 / (1 + np.exp(-latent))

            scenario_rows.append(
                {
                    "responsibility": responsibility,
                    "mitigating_excuse": excuse,
                    "predicted_blame_probability": prob,
                }
            )

    scenario_df = pd.DataFrame(scenario_rows)

    high_accountability_low_blame = (
        df[
            (df["accountability_score"] > df["accountability_score"].quantile(0.75))
            & (df["blame_probability"] < df["blame_probability"].quantile(0.25))
        ]
        .sort_values("accountability_score", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "responsibility_blame_accountability_python.csv", index=False)
    summary.to_csv(output_tables / "responsibility_blame_accountability_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "responsibility_blame_accountability_scenarios.csv", index=False)
    high_accountability_low_blame.to_csv(
        output_tables / "high_accountability_low_blame_cases.csv",
        index=False,
    )

    print("Synthetic responsibility, blame, and accountability outputs written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
