"""Synthetic developmental moral reasoning model.

This script simulates developmental moral reasoning with both stage-like
ordering and multidimensional domain sensitivity. It reflects the transition
from classical Piaget/Kohlberg stage theory to more plural contemporary
developmental models.

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

    n = 2400

    df = pd.DataFrame(
        {
            "case_id": np.arange(1, n + 1),
            "age": np.random.uniform(6, 25, n),
            "perspective_taking": np.random.normal(0, 1, n),
            "norm_exposure": np.random.normal(0, 1, n),
            "domain_differentiation": np.random.normal(0, 1, n),
            "relational_orientation": np.random.normal(0, 1, n),
            "authority_orientation": np.random.normal(0, 1, n),
            "peer_cooperation": np.random.normal(0, 1, n),
            "cultural_context_support": np.random.normal(0, 1, n),
        }
    )

    df["latent_reasoning"] = (
        0.10 * df["age"]
        + 0.55 * df["perspective_taking"]
        + 0.35 * df["norm_exposure"]
        + 0.45 * df["domain_differentiation"]
        + 0.25 * df["peer_cooperation"]
        + 0.20 * df["cultural_context_support"]
        - 0.20 * df["authority_orientation"]
        + np.random.normal(0, 1, n)
    )

    conditions = [
        df["latent_reasoning"] < -0.75,
        (df["latent_reasoning"] >= -0.75) & (df["latent_reasoning"] < 0.25),
        df["latent_reasoning"] >= 0.25,
    ]

    choices = ["Stage_1_2", "Stage_3_4", "Stage_5_6"]
    df["reasoning_stage"] = np.select(conditions, choices, default="Stage_3_4")

    df["justice_reasoning"] = (
        0.60 * df["latent_reasoning"]
        + 0.25 * df["perspective_taking"]
        + 0.20 * df["domain_differentiation"]
        + np.random.normal(0, 0.8, n)
    )

    df["care_reasoning"] = (
        0.35 * df["latent_reasoning"]
        + 0.50 * df["relational_orientation"]
        + 0.20 * df["perspective_taking"]
        + np.random.normal(0, 0.8, n)
    )

    df["conventional_sensitivity"] = (
        0.25 * df["latent_reasoning"]
        + 0.45 * df["norm_exposure"]
        + 0.35 * df["authority_orientation"]
        - 0.25 * df["domain_differentiation"]
        + np.random.normal(0, 0.8, n)
    )

    df["autonomy_orientation"] = (
        0.40 * df["latent_reasoning"]
        + 0.35 * df["domain_differentiation"]
        + 0.25 * df["peer_cooperation"]
        - 0.20 * df["authority_orientation"]
        + np.random.normal(0, 0.8, n)
    )

    df["developmental_band"] = pd.cut(
        df["age"],
        bins=[0, 10, 14, 18, 100],
        labels=["Childhood", "Early adolescence", "Adolescence", "Young adulthood"],
        right=False,
    )

    stage_order = ["Stage_1_2", "Stage_3_4", "Stage_5_6"]

    stage_summary = (
        df.groupby("reasoning_stage")
        .agg(
            mean_age=("age", "mean"),
            mean_perspective=("perspective_taking", "mean"),
            mean_domain_diff=("domain_differentiation", "mean"),
            mean_justice=("justice_reasoning", "mean"),
            mean_care=("care_reasoning", "mean"),
            mean_conventional=("conventional_sensitivity", "mean"),
            mean_autonomy=("autonomy_orientation", "mean"),
        )
        .reindex(stage_order)
        .reset_index()
    )

    band_summary = (
        df.groupby("developmental_band", observed=False)
        .agg(
            mean_latent_reasoning=("latent_reasoning", "mean"),
            mean_justice=("justice_reasoning", "mean"),
            mean_care=("care_reasoning", "mean"),
            mean_conventional=("conventional_sensitivity", "mean"),
            mean_domain_diff=("domain_differentiation", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for age in np.linspace(6, 25, 40):
        for perspective in [-1, 0, 1]:
            for domain_diff in [-1, 0, 1]:
                latent_reasoning = (
                    0.10 * age
                    + 0.55 * perspective
                    + 0.35 * 0
                    + 0.45 * domain_diff
                    + 0.25 * 0
                    + 0.20 * 0
                    - 0.20 * 0
                )

                if latent_reasoning < -0.75:
                    stage = "Stage_1_2"
                elif latent_reasoning < 0.25:
                    stage = "Stage_3_4"
                else:
                    stage = "Stage_5_6"

                scenario_rows.append(
                    {
                        "age": age,
                        "perspective_taking": perspective,
                        "domain_differentiation": domain_diff,
                        "latent_reasoning": latent_reasoning,
                        "predicted_stage": stage,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_complexity_cases = (
        df[
            (df["justice_reasoning"] > df["justice_reasoning"].quantile(0.75))
            & (df["care_reasoning"] > df["care_reasoning"].quantile(0.75))
            & (
                df["domain_differentiation"]
                > df["domain_differentiation"].quantile(0.75)
            )
        ]
        .sort_values(["latent_reasoning", "perspective_taking"], ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    stage_domain_mismatch_cases = (
        df[
            (
                (df["reasoning_stage"] == "Stage_5_6")
                & (
                    df["conventional_sensitivity"]
                    > df["conventional_sensitivity"].quantile(0.75)
                )
            )
            | (
                (df["reasoning_stage"] == "Stage_1_2")
                & (
                    df["domain_differentiation"]
                    > df["domain_differentiation"].quantile(0.75)
                )
            )
        ]
        .sort_values(
            ["domain_differentiation", "conventional_sensitivity"],
            ascending=False,
        )
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "moral_reasoning_python_simulation.csv", index=False)
    stage_summary.to_csv(output_tables / "moral_reasoning_stage_summary.csv", index=False)
    band_summary.to_csv(output_tables / "moral_reasoning_developmental_band_summary_python.csv", index=False)
    scenario_df.to_csv(output_tables / "moral_reasoning_age_domain_scenarios.csv", index=False)
    high_complexity_cases.to_csv(
        output_tables / "moral_reasoning_high_complexity_cases.csv",
        index=False,
    )
    stage_domain_mismatch_cases.to_csv(
        output_tables / "moral_reasoning_stage_domain_mismatch_cases.csv",
        index=False,
    )

    print("Synthetic moral reasoning outputs written to:", output_tables)
    print(stage_summary)


if __name__ == "__main__":
    main()
