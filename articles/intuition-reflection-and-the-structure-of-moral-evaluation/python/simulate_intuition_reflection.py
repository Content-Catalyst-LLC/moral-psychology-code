"""Synthetic intuition-reflection model for moral evaluation.

This script simulates repeated moral evaluations in which intuitive appraisal
and reflective interpretation both contribute to final judgment under changing
contextual pressures.

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
            "perceived_harm": np.random.normal(0, 1, n),
            "affective_activation": np.random.normal(0, 1, n),
            "social_salience": np.random.normal(0, 1, n),
            "principled_reasoning": np.random.normal(0, 1, n),
            "evidential_reconsideration": np.random.normal(0, 1, n),
            "contextual_knowledge": np.random.normal(0, 1, n),
            "cultural_framing": np.random.normal(0, 1, n),
            "group_identity_pressure": np.random.normal(0, 1, n),
            "time_for_reflection": np.random.normal(0, 1, n),
            "institutional_review": np.random.normal(0, 1, n),
        }
    )

    df["intuitive_appraisal"] = (
        0.55 * df["perceived_harm"]
        + 0.45 * df["affective_activation"]
        + 0.30 * df["social_salience"]
        + 0.25 * df["group_identity_pressure"]
        + np.random.normal(0, 0.8, n)
    )

    df["reflective_evaluation"] = (
        0.40 * df["principled_reasoning"]
        + 0.35 * df["evidential_reconsideration"]
        + 0.30 * df["contextual_knowledge"]
        + 0.20 * df["cultural_framing"]
        + 0.20 * df["institutional_review"]
        + np.random.normal(0, 0.8, n)
    )

    intuition_weight_latent = (
        0.30
        + 0.35 * df["affective_activation"]
        + 0.25 * df["social_salience"]
        + 0.20 * df["group_identity_pressure"]
        - 0.30 * df["evidential_reconsideration"]
        - 0.25 * df["time_for_reflection"]
        + np.random.normal(0, 0.6, n)
    )

    df["intuition_weight"] = 1 / (1 + np.exp(-intuition_weight_latent))

    df["final_moral_evaluation"] = (
        df["intuition_weight"] * df["intuitive_appraisal"]
        + (1 - df["intuition_weight"]) * df["reflective_evaluation"]
        + np.random.normal(0, 0.4, n)
    )

    df["reflective_revision"] = (
        df["reflective_evaluation"] - df["intuitive_appraisal"]
    )

    df["revision_magnitude"] = df["reflective_revision"].abs()

    df["intuition_group"] = np.where(
        df["intuition_weight"] >= df["intuition_weight"].median(),
        "Higher intuition weight",
        "Lower intuition weight",
    )

    summary = (
        df.groupby("intuition_group")
        .agg(
            mean_intuitive=("intuitive_appraisal", "mean"),
            mean_reflective=("reflective_evaluation", "mean"),
            mean_final=("final_moral_evaluation", "mean"),
            mean_revision=("reflective_revision", "mean"),
            mean_revision_magnitude=("revision_magnitude", "mean"),
            mean_group_pressure=("group_identity_pressure", "mean"),
            mean_time_for_reflection=("time_for_reflection", "mean"),
            mean_institutional_review=("institutional_review", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for harm in np.linspace(-2, 2, 41):
        for principle in [-1, 0, 1]:
            for time_reflection in [-1, 0, 1]:
                intuitive = 0.55 * harm + 0.45 * 0 + 0.30 * 0 + 0.25 * 0
                reflective = 0.40 * principle + 0.35 * 0 + 0.30 * 0 + 0.20 * 0 + 0.20 * 0

                weight_latent = (
                    0.30
                    + 0.35 * 0
                    + 0.25 * 0
                    + 0.20 * 0
                    - 0.30 * 0
                    - 0.25 * time_reflection
                )

                intuition_weight = 1 / (1 + np.exp(-weight_latent))
                final_eval = (
                    intuition_weight * intuitive
                    + (1 - intuition_weight) * reflective
                )

                scenario_rows.append(
                    {
                        "perceived_harm": harm,
                        "principled_reasoning": principle,
                        "time_for_reflection": time_reflection,
                        "intuitive_appraisal": intuitive,
                        "reflective_evaluation": reflective,
                        "intuition_weight": intuition_weight,
                        "final_moral_evaluation": final_eval,
                        "reflective_revision": reflective - intuitive,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_intuition_high_revision = (
        df[
            (df["intuition_weight"] > df["intuition_weight"].quantile(0.75))
            & (df["revision_magnitude"] > df["revision_magnitude"].quantile(0.75))
        ]
        .sort_values(
            ["affective_activation", "evidential_reconsideration"],
            ascending=False,
        )
        .head(25)
        .reset_index(drop=True)
    )

    reflection_correction_cases = (
        df[
            (
                (df["intuitive_appraisal"] > 0.75)
                & (df["reflective_evaluation"] < -0.25)
            )
            | (
                (df["intuitive_appraisal"] < -0.75)
                & (df["reflective_evaluation"] > 0.25)
            )
        ]
        .sort_values("revision_magnitude", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "intuition_reflection_moral_evaluation_python.csv", index=False)
    summary.to_csv(output_tables / "intuition_reflection_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "intuition_reflection_scenarios.csv", index=False)
    high_intuition_high_revision.to_csv(
        output_tables / "intuition_reflection_high_intuition_high_revision_cases.csv",
        index=False,
    )
    reflection_correction_cases.to_csv(
        output_tables / "intuition_reflection_correction_cases.csv",
        index=False,
    )

    print("Synthetic intuition-reflection outputs written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
