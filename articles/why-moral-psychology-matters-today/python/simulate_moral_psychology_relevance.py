"""Synthetic systems model for 'Why Moral Psychology Matters Today'.

This script creates synthetic data to demonstrate how multiple contemporary
domains can jointly increase the practical significance of moral psychology.

It is an educational and reproducible research scaffold only.
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
            "political_polarization": np.random.normal(0, 1, n),
            "organizational_risk": np.random.normal(0, 1, n),
            "developmental_moral_learning": np.random.normal(0, 1, n),
            "cross_cultural_variation": np.random.normal(0, 1, n),
            "technology_amplification": np.random.normal(0, 1, n),
            "moral_injury_burden": np.random.normal(0, 1, n),
        }
    )

    df["moral_psychology_significance"] = (
        0.25 * df["political_polarization"]
        + 0.20 * df["organizational_risk"]
        + 0.15 * df["developmental_moral_learning"]
        + 0.15 * df["cross_cultural_variation"]
        + 0.15 * df["technology_amplification"]
        + 0.20 * df["moral_injury_burden"]
        + np.random.normal(0, 0.8, n)
    )

    df["significance_band"] = pd.qcut(
        df["moral_psychology_significance"],
        q=4,
        labels=["Low", "Lower-middle", "Upper-middle", "High"],
    )

    summary = (
        df.groupby("significance_band", observed=False)
        .agg(
            mean_polarization=("political_polarization", "mean"),
            mean_org_risk=("organizational_risk", "mean"),
            mean_developmental_learning=("developmental_moral_learning", "mean"),
            mean_cross_cultural_variation=("cross_cultural_variation", "mean"),
            mean_technology_amplification=("technology_amplification", "mean"),
            mean_moral_injury=("moral_injury_burden", "mean"),
            mean_significance=("moral_psychology_significance", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for polarization in np.linspace(-2, 2, 41):
        for organizational_risk in [-1, 0, 1]:
            for injury in [-1, 0, 1]:
                significance = (
                    0.25 * polarization
                    + 0.20 * organizational_risk
                    + 0.15 * 0
                    + 0.15 * 0
                    + 0.15 * 0
                    + 0.20 * injury
                )

                scenario_rows.append(
                    {
                        "political_polarization": polarization,
                        "organizational_risk": organizational_risk,
                        "moral_injury_burden": injury,
                        "predicted_significance": significance,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_pressure = (
        df.sort_values("moral_psychology_significance", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "why_moral_psychology_matters_python.csv", index=False)
    summary.to_csv(output_tables / "why_moral_psychology_matters_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "why_moral_psychology_matters_scenarios.csv", index=False)
    high_pressure.to_csv(
        output_tables / "why_moral_psychology_matters_high_pressure_cases.csv",
        index=False,
    )

    print("Synthetic data and summaries written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
