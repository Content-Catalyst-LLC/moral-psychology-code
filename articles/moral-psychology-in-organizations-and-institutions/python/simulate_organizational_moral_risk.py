"""Synthetic organizational moral-risk model.

This script simulates ethical sensitivity, role constraint, cultural climate,
performance pressure, hierarchy intensity, diffusion of responsibility,
accountability strength, speak-up protection, value alignment, corruption
pressure, unethical action probability, and institutional integrity.

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
            "employee_id": np.arange(1, n + 1),
            "ethical_sensitivity": np.random.normal(0, 1, n),
            "role_constraint": np.random.normal(0, 1, n),
            "cultural_climate": np.random.normal(0, 1, n),
            "performance_pressure": np.random.normal(0, 1, n),
            "hierarchy_intensity": np.random.normal(0, 1, n),
            "diffusion_responsibility": np.random.normal(0, 1, n),
            "accountability_strength": np.random.normal(0, 1, n),
            "speak_up_protection": np.random.normal(0, 1, n),
            "value_alignment": np.random.normal(0, 1, n),
            "corruption_pressure": np.random.normal(0, 1, n),
        }
    )

    df["moral_decision_tendency"] = (
        0.35 * df["ethical_sensitivity"]
        - 0.25 * df["role_constraint"]
        + 0.30 * df["cultural_climate"]
        - 0.30 * df["performance_pressure"]
        + 0.25 * df["speak_up_protection"]
        + 0.25 * df["value_alignment"]
        + np.random.normal(0, 0.8, n)
    )

    unethical_latent = (
        0.35 * df["performance_pressure"]
        + 0.25 * df["hierarchy_intensity"]
        + 0.30 * df["diffusion_responsibility"]
        - 0.40 * df["accountability_strength"]
        - 0.25 * df["cultural_climate"]
        - 0.20 * df["speak_up_protection"]
        - 0.25 * df["value_alignment"]
        + 0.30 * df["corruption_pressure"]
        + np.random.normal(0, 0.8, n)
    )

    df["unethical_probability"] = 1 / (1 + np.exp(-unethical_latent))
    df["unethical_action"] = (df["unethical_probability"] >= 0.5).astype(int)

    df["institutional_integrity"] = (
        0.30 * df["accountability_strength"]
        + 0.30 * df["speak_up_protection"]
        + 0.30 * df["value_alignment"]
        + 0.20 * df["cultural_climate"]
        - 0.30 * df["corruption_pressure"]
        - 0.20 * df["diffusion_responsibility"]
        + np.random.normal(0, 0.8, n)
    )

    df["accountability_band"] = pd.qcut(
        df["accountability_strength"],
        q=4,
        labels=["Low", "Lower-middle", "Upper-middle", "High"],
    )

    summary = (
        df.groupby("accountability_band", observed=False)
        .agg(
            mean_unethical_prob=("unethical_probability", "mean"),
            unethical_rate=("unethical_action", "mean"),
            mean_pressure=("performance_pressure", "mean"),
            mean_diffusion=("diffusion_responsibility", "mean"),
            mean_integrity=("institutional_integrity", "mean"),
            mean_value_alignment=("value_alignment", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for pressure in np.linspace(-2, 2, 41):
        for accountability in [-1, 0, 1]:
            for diffusion in [-1, 0, 1]:
                latent = (
                    0.35 * pressure
                    + 0.30 * diffusion
                    - 0.40 * accountability
                )

                prob = 1 / (1 + np.exp(-latent))

                scenario_rows.append(
                    {
                        "performance_pressure": pressure,
                        "accountability_strength": accountability,
                        "diffusion_responsibility": diffusion,
                        "predicted_unethical_probability": prob,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_risk_cases = (
        df.sort_values("unethical_probability", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "moral_psychology_organizations_python.csv", index=False)
    summary.to_csv(output_tables / "moral_psychology_organizations_summary.csv", index=False)
    scenario_df.to_csv(
        output_tables / "moral_psychology_organizations_scenarios.csv",
        index=False,
    )
    high_risk_cases.to_csv(
        output_tables / "moral_psychology_organizations_high_risk_cases.csv",
        index=False,
    )

    print("Synthetic organizational moral-risk data written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
