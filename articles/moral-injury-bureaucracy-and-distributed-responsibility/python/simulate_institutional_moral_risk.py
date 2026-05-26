"""Synthetic institutional moral risk model.

This script simulates moral injury pressure in bureaucratic settings,
including conscience conflict, institutional betrayal, distributed responsibility,
morally injurious exposure, scarcity constraint, accountability clarity,
organizational opacity, protected voice, and repair capacity.

Educational and reproducible research scaffold only.
"""

from pathlib import Path

import numpy as np
import pandas as pd


def logistic(x: pd.Series) -> pd.Series:
    """Compute logistic transformation."""
    return 1 / (1 + np.exp(-x))


def main() -> None:
    np.random.seed(42)

    article_root = Path(__file__).resolve().parents[1]
    output_tables = article_root / "outputs" / "tables"
    output_tables.mkdir(parents=True, exist_ok=True)

    n = 2600

    df = pd.DataFrame(
        {
            "worker_id": np.arange(1, n + 1),
            "conscience_conflict": np.random.normal(0, 1, n),
            "institutional_betrayal": np.random.normal(0, 1, n),
            "distributed_responsibility": np.random.normal(0, 1, n),
            "morally_injurious_exposure": np.random.normal(0, 1, n),
            "scarcity_constraint": np.random.normal(0, 1, n),
            "accountability_clarity": np.random.normal(0, 1, n),
            "organizational_opacity": np.random.normal(0, 1, n),
            "protected_voice": np.random.normal(0, 1, n),
            "repair_capacity": np.random.normal(0, 1, n),
        }
    )

    df["many_hands_pressure"] = (
        0.50 * df["distributed_responsibility"]
        + 0.35 * df["organizational_opacity"]
        - 0.25 * df["accountability_clarity"]
    )

    latent = (
        0.30 * df["conscience_conflict"]
        + 0.30 * df["institutional_betrayal"]
        + 0.25 * df["distributed_responsibility"]
        + 0.30 * df["morally_injurious_exposure"]
        + 0.20 * df["scarcity_constraint"]
        + 0.20 * df["organizational_opacity"]
        - 0.25 * df["accountability_clarity"]
        - 0.20 * df["protected_voice"]
        - 0.20 * df["repair_capacity"]
        + np.random.normal(0, 0.8, n)
    )

    df["moral_injury_risk"] = logistic(latent)
    df["elevated_moral_injury"] = (df["moral_injury_risk"] >= 0.5).astype(int)

    df["accountability_band"] = pd.qcut(
        df["accountability_clarity"],
        q=4,
        labels=["Low", "Lower-middle", "Upper-middle", "High"],
    )

    summary = (
        df.groupby("accountability_band", observed=False)
        .agg(
            mean_mi_risk=("moral_injury_risk", "mean"),
            elevated_rate=("elevated_moral_injury", "mean"),
            mean_betrayal=("institutional_betrayal", "mean"),
            mean_distribution=("distributed_responsibility", "mean"),
            mean_many_hands_pressure=("many_hands_pressure", "mean"),
            mean_repair_capacity=("repair_capacity", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for betrayal in np.linspace(-2, 2, 41):
        for accountability in [-1, 0, 1]:
            for distribution in [-1, 0, 1]:
                for repair in [-1, 0, 1]:
                    scenario_latent = (
                        0.30 * 0
                        + 0.30 * betrayal
                        + 0.25 * distribution
                        + 0.30 * 0
                        + 0.20 * 0
                        + 0.20 * 0
                        - 0.25 * accountability
                        - 0.20 * 0
                        - 0.20 * repair
                    )

                    scenario_rows.append(
                        {
                            "institutional_betrayal": betrayal,
                            "accountability_clarity": accountability,
                            "distributed_responsibility": distribution,
                            "repair_capacity": repair,
                            "predicted_moral_injury_risk": 1
                            / (1 + np.exp(-scenario_latent)),
                        }
                    )

    scenario_df = pd.DataFrame(scenario_rows)

    high_risk_cases = (
        df.sort_values("moral_injury_risk", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "moral_injury_bureaucracy_python.csv", index=False)
    summary.to_csv(output_tables / "moral_injury_bureaucracy_summary.csv", index=False)
    scenario_df.to_csv(
        output_tables / "moral_injury_bureaucracy_scenarios.csv",
        index=False,
    )
    high_risk_cases.to_csv(
        output_tables / "moral_injury_bureaucracy_high_risk_cases.csv",
        index=False,
    )

    print("Synthetic institutional moral risk data written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
