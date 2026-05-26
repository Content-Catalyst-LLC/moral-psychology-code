"""Synthetic moral agency simulation.

This script simulates moral action as a dynamic process in which salience,
identity, self-regulation, accountability climate, repair infrastructure,
retaliation risk, and institutional pressure jointly shape whether a person
acts on a moral judgment over repeated periods.

Educational and reproducible research scaffold only.
"""

from pathlib import Path
from dataclasses import dataclass

import numpy as np
import pandas as pd


@dataclass
class MoralAgent:
    agent_id: int
    moral_identity: float
    empathic_concern: float
    self_regulation: float
    baseline_salience: float


def logistic(x):
    """Map latent scores to probabilities."""
    return 1 / (1 + np.exp(-x))


def main() -> None:
    np.random.seed(42)

    article_root = Path(__file__).resolve().parents[1]
    output_tables = article_root / "outputs" / "tables"
    output_tables.mkdir(parents=True, exist_ok=True)

    n_agents = 800
    n_periods = 30

    agents = [
        MoralAgent(
            agent_id=i,
            moral_identity=np.random.normal(0, 1),
            empathic_concern=np.random.normal(0, 1),
            self_regulation=np.random.normal(0, 1),
            baseline_salience=np.random.normal(0, 1),
        )
        for i in range(n_agents)
    ]

    periods = pd.DataFrame(
        {
            "time": np.arange(n_periods),
            "institutional_pressure": np.random.normal(0, 0.7, n_periods),
            "accountability_climate": np.random.normal(0, 0.7, n_periods),
            "repair_infrastructure": np.random.normal(0, 0.7, n_periods),
            "retaliation_risk": np.random.normal(0, 0.7, n_periods),
            "moral_visibility": np.random.normal(0, 0.7, n_periods),
        }
    )

    records = []

    for agent in agents:
        for _, row in periods.iterrows():
            moral_salience = (
                0.60 * agent.baseline_salience
                + 0.45 * row["moral_visibility"]
                + np.random.normal(0, 0.4)
            )

            moral_judgment = (
                0.55
                + 0.18 * moral_salience
                + 0.16 * agent.empathic_concern
                + 0.15 * agent.moral_identity
                + np.random.normal(0, 0.20)
            )

            latent_action = (
                -0.25
                + 0.50 * moral_judgment
                + 0.25 * agent.moral_identity
                + 0.22 * agent.self_regulation
                + 0.16 * row["accountability_climate"]
                + 0.14 * row["repair_infrastructure"]
                - 0.30 * row["institutional_pressure"]
                - 0.22 * row["retaliation_risk"]
                + 0.18 * moral_salience
            )

            action_probability = logistic(latent_action)
            moral_action = np.random.binomial(1, action_probability)

            records.append(
                {
                    "agent_id": agent.agent_id,
                    "time": int(row["time"]),
                    "moral_identity": agent.moral_identity,
                    "empathic_concern": agent.empathic_concern,
                    "self_regulation": agent.self_regulation,
                    "baseline_salience": agent.baseline_salience,
                    "institutional_pressure": row["institutional_pressure"],
                    "accountability_climate": row["accountability_climate"],
                    "repair_infrastructure": row["repair_infrastructure"],
                    "retaliation_risk": row["retaliation_risk"],
                    "moral_visibility": row["moral_visibility"],
                    "moral_salience": moral_salience,
                    "moral_judgment": moral_judgment,
                    "action_probability": action_probability,
                    "moral_action": moral_action,
                }
            )

    df = pd.DataFrame(records)

    df["judgment_action_gap"] = df["moral_judgment"] - df["moral_action"]

    df["pressure_bin"] = pd.qcut(
        df["institutional_pressure"],
        q=4,
        labels=[
            "Low pressure",
            "Lower-middle pressure",
            "Upper-middle pressure",
            "High pressure",
        ],
    )

    summary_by_pressure = (
        df.groupby("pressure_bin", observed=False)
        .agg(
            mean_judgment=("moral_judgment", "mean"),
            mean_action=("moral_action", "mean"),
            mean_gap=("judgment_action_gap", "mean"),
            mean_salience=("moral_salience", "mean"),
            mean_repair=("repair_infrastructure", "mean"),
            mean_retaliation=("retaliation_risk", "mean"),
        )
        .reset_index()
    )

    summary_over_time = (
        df.groupby("time")
        .agg(
            mean_judgment=("moral_judgment", "mean"),
            mean_action=("moral_action", "mean"),
            mean_gap=("judgment_action_gap", "mean"),
            mean_pressure=("institutional_pressure", "mean"),
            mean_repair=("repair_infrastructure", "mean"),
            mean_retaliation=("retaliation_risk", "mean"),
        )
        .reset_index()
    )

    risk_report = (
        df.groupby(["time", "pressure_bin"], observed=False)
        .agg(
            action_rate=("moral_action", "mean"),
            average_gap=("judgment_action_gap", "mean"),
            salience=("moral_salience", "mean"),
            pressure=("institutional_pressure", "mean"),
            repair=("repair_infrastructure", "mean"),
            retaliation=("retaliation_risk", "mean"),
            n=("agent_id", "count"),
        )
        .reset_index()
        .sort_values(["average_gap", "action_rate"], ascending=[False, True])
    )

    high_gap_cases = (
        df[df["judgment_action_gap"] > df["judgment_action_gap"].quantile(0.95)]
        .sort_values(["institutional_pressure", "retaliation_risk"], ascending=False)
        .head(50)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "moral_psychology_agent_simulation.csv", index=False)
    summary_by_pressure.to_csv(
        output_tables / "moral_psychology_pressure_summary.csv",
        index=False,
    )
    summary_over_time.to_csv(
        output_tables / "moral_psychology_time_summary.csv",
        index=False,
    )
    risk_report.to_csv(
        output_tables / "moral_psychology_risk_report.csv",
        index=False,
    )
    high_gap_cases.to_csv(
        output_tables / "moral_psychology_high_gap_cases.csv",
        index=False,
    )

    print("Synthetic moral psychology simulation outputs written to:", output_tables)
    print(summary_by_pressure)
    print(risk_report.head(12))


if __name__ == "__main__":
    main()
