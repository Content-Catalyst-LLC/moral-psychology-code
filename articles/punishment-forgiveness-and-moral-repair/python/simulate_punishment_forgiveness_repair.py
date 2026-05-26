"""Synthetic punishment, forgiveness, and moral repair model.

This script simulates punishment, forgiveness, and moral repair as distinct but
interacting post-wrong responses.

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
            "wrongdoing_severity": np.random.normal(0, 1, n),
            "offender_responsibility": np.random.normal(0, 1, n),
            "norm_reaffirmation_need": np.random.normal(0, 1, n),
            "acknowledgment": np.random.normal(0, 1, n),
            "amends": np.random.normal(0, 1, n),
            "ongoing_threat": np.random.normal(0, 1, n),
            "restitution": np.random.normal(0, 1, n),
            "institutional_trust": np.random.normal(0, 1, n),
            "victim_recognition": np.random.normal(0, 1, n),
            "structural_reform": np.random.normal(0, 1, n),
        }
    )

    df["punishment_score"] = (
        0.40 * df["wrongdoing_severity"]
        + 0.35 * df["offender_responsibility"]
        + 0.25 * df["norm_reaffirmation_need"]
        + np.random.normal(0, 0.8, n)
    )

    forgiveness_latent = (
        0.35 * df["acknowledgment"]
        + 0.30 * df["amends"]
        - 0.40 * df["ongoing_threat"]
        + 0.15 * df["victim_recognition"]
        + np.random.normal(0, 0.8, n)
    )

    df["forgiveness_probability"] = 1 / (1 + np.exp(-forgiveness_latent))
    df["forgiveness"] = (df["forgiveness_probability"] >= 0.5).astype(int)

    df["moral_repair"] = (
        0.20 * df["punishment_score"]
        + 0.25 * df["forgiveness_probability"]
        + 0.30 * df["restitution"]
        + 0.30 * df["acknowledgment"]
        + 0.25 * df["victim_recognition"]
        + 0.20 * df["institutional_trust"]
        + 0.25 * df["structural_reform"]
        - 0.25 * df["ongoing_threat"]
        + np.random.normal(0, 0.8, n)
    )

    df["threat_group"] = pd.qcut(
        df["ongoing_threat"],
        q=4,
        labels=["Low", "Lower-middle", "Upper-middle", "High"],
    )

    summary = (
        df.groupby("threat_group", observed=False)
        .agg(
            mean_punishment=("punishment_score", "mean"),
            mean_forgiveness=("forgiveness_probability", "mean"),
            mean_repair=("moral_repair", "mean"),
            mean_acknowledgment=("acknowledgment", "mean"),
            mean_restitution=("restitution", "mean"),
            mean_structural_reform=("structural_reform", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for acknowledgment in np.linspace(-2, 2, 41):
        for restitution in [-1, 0, 1]:
            for threat in [-1, 0, 1]:
                forgiveness_probability = 1 / (
                    1
                    + np.exp(
                        -(
                            0.35 * acknowledgment
                            + 0.30 * 0
                            - 0.40 * threat
                            + 0.15 * 0
                        )
                    )
                )

                repair = (
                    0.20 * 0
                    + 0.25 * forgiveness_probability
                    + 0.30 * restitution
                    + 0.30 * acknowledgment
                    + 0.25 * 0
                    + 0.20 * 0
                    + 0.25 * 0
                    - 0.25 * threat
                )

                scenario_rows.append(
                    {
                        "acknowledgment": acknowledgment,
                        "restitution": restitution,
                        "ongoing_threat": threat,
                        "predicted_forgiveness_probability": forgiveness_probability,
                        "predicted_moral_repair": repair,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    low_repair_cases = (
        df.sort_values("moral_repair", ascending=True)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "punishment_forgiveness_moral_repair_python.csv", index=False)
    summary.to_csv(output_tables / "punishment_forgiveness_moral_repair_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "punishment_forgiveness_moral_repair_scenarios.csv", index=False)
    low_repair_cases.to_csv(
        output_tables / "punishment_forgiveness_moral_repair_low_repair_cases.csv",
        index=False,
    )

    print("Synthetic punishment, forgiveness, and moral repair outputs written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
