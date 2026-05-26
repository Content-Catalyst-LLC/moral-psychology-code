"""Synthetic experimental moral-judgment model.

This script simulates an experimental moral psychology dataset with:
- intuition
- reflection
- norm sensitivity
- consequence sensitivity
- intentionality
- excuse
- group identity salience
- power condition
- moral judgment
- blame probability

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
            "participant_id": np.arange(1, n + 1),
            "intuition_strength": np.random.normal(0, 1, n),
            "reflection_strength": np.random.normal(0, 1, n),
            "norm_sensitivity": np.random.normal(0, 1, n),
            "consequence_sensitivity": np.random.normal(0, 1, n),
            "intentionality": np.random.normal(0, 1, n),
            "excuse_strength": np.random.normal(0, 1, n),
            "group_identity_salience": np.random.normal(0, 1, n),
            "power_condition": np.random.choice(
                ["low_power", "control", "high_power"],
                size=n,
            ),
        }
    )

    power_shift = np.select(
        [
            df["power_condition"] == "high_power",
            df["power_condition"] == "low_power",
        ],
        [-0.20, 0.10],
        default=0,
    )

    df["moral_judgment"] = (
        0.30 * df["intuition_strength"]
        + 0.20 * df["reflection_strength"]
        + 0.25 * df["norm_sensitivity"]
        + 0.25 * df["consequence_sensitivity"]
        + 0.10 * df["group_identity_salience"]
        + power_shift
        + np.random.normal(0, 0.8, n)
    )

    blame_latent = (
        0.35 * df["moral_judgment"]
        + 0.30 * df["intentionality"]
        - 0.25 * df["excuse_strength"]
        + 0.10 * df["norm_sensitivity"]
        + np.random.normal(0, 0.8, n)
    )

    df["blame_probability"] = 1 / (1 + np.exp(-blame_latent))
    df["blame_assigned"] = (df["blame_probability"] >= 0.5).astype(int)

    df["intuition_band"] = pd.qcut(
        df["intuition_strength"],
        q=4,
        labels=["Low", "Lower-middle", "Upper-middle", "High"],
    )

    intuition_summary = (
        df.groupby("intuition_band", observed=False)
        .agg(
            mean_judgment=("moral_judgment", "mean"),
            mean_blame=("blame_probability", "mean"),
            mean_reflection=("reflection_strength", "mean"),
            mean_norm_sensitivity=("norm_sensitivity", "mean"),
            mean_consequence_sensitivity=("consequence_sensitivity", "mean"),
        )
        .reset_index()
    )

    condition_summary = (
        df.groupby("power_condition")
        .agg(
            mean_judgment=("moral_judgment", "mean"),
            mean_blame_probability=("blame_probability", "mean"),
            mean_norm_sensitivity=("norm_sensitivity", "mean"),
            mean_consequence_sensitivity=("consequence_sensitivity", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for intuition in np.linspace(-2, 2, 41):
        for norm in [-1, 0, 1]:
            for reflection in [-1, 0, 1]:
                judgment = (
                    0.30 * intuition
                    + 0.20 * reflection
                    + 0.25 * norm
                    + 0.25 * 0
                )

                scenario_rows.append(
                    {
                        "intuition_strength": intuition,
                        "reflection_strength": reflection,
                        "norm_sensitivity": norm,
                        "predicted_judgment": judgment,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    df["intuition_reflection_gap"] = (
        df["intuition_strength"] - df["reflection_strength"]
    )

    gap_cases = (
        df.assign(abs_gap=lambda x: x["intuition_reflection_gap"].abs())
        .sort_values("abs_gap", ascending=False)
        .head(25)
        .drop(columns=["abs_gap"])
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "experimental_moral_psychology_python.csv", index=False)
    intuition_summary.to_csv(
        output_tables / "experimental_moral_psychology_intuition_summary.csv",
        index=False,
    )
    condition_summary.to_csv(
        output_tables / "experimental_moral_psychology_condition_summary.csv",
        index=False,
    )
    scenario_df.to_csv(
        output_tables / "experimental_moral_psychology_scenarios.csv",
        index=False,
    )
    gap_cases.to_csv(
        output_tables / "experimental_moral_psychology_intuition_reflection_gap_cases.csv",
        index=False,
    )

    print("Synthetic experimental moral psychology data written to:", output_tables)
    print(intuition_summary)
    print(condition_summary)


if __name__ == "__main__":
    main()
