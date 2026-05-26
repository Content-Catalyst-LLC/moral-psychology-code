"""Synthetic moral disengagement and ethical failure model.

This script simulates moral justification, euphemistic language, responsibility
shifting, dehumanization, anticipated guilt, institutional pressure, consequence
visibility, victim recognition, accountability strength, moral disengagement,
and unethical action probability.

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
            "moral_justification": np.random.normal(0, 1, n),
            "euphemistic_language": np.random.normal(0, 1, n),
            "advantageous_comparison": np.random.normal(0, 1, n),
            "responsibility_shifting": np.random.normal(0, 1, n),
            "consequence_distortion": np.random.normal(0, 1, n),
            "dehumanization": np.random.normal(0, 1, n),
            "victim_blaming": np.random.normal(0, 1, n),
            "anticipated_guilt": np.random.normal(0, 1, n),
            "institutional_pressure": np.random.normal(0, 1, n),
            "consequence_visibility": np.random.normal(0, 1, n),
            "victim_recognition": np.random.normal(0, 1, n),
            "accountability_strength": np.random.normal(0, 1, n),
        }
    )

    df["moral_disengagement"] = (
        0.30 * df["moral_justification"]
        + 0.25 * df["euphemistic_language"]
        + 0.20 * df["advantageous_comparison"]
        + 0.30 * df["responsibility_shifting"]
        + 0.25 * df["consequence_distortion"]
        + 0.25 * df["dehumanization"]
        + 0.20 * df["victim_blaming"]
        - 0.20 * df["consequence_visibility"]
        - 0.20 * df["victim_recognition"]
        + np.random.normal(0, 0.8, n)
    )

    latent = (
        0.55 * df["moral_disengagement"]
        - 0.35 * df["anticipated_guilt"]
        + 0.30 * df["institutional_pressure"]
        - 0.25 * df["accountability_strength"]
        + np.random.normal(0, 0.8, n)
    )

    df["unethical_action_probability"] = 1 / (1 + np.exp(-latent))
    df["unethical_action"] = (df["unethical_action_probability"] >= 0.5).astype(int)

    df["disengagement_group"] = pd.qcut(
        df["moral_disengagement"],
        q=4,
        labels=["Low", "Lower-middle", "Upper-middle", "High"],
    )

    summary = (
        df.groupby("disengagement_group", observed=False)
        .agg(
            mean_action_prob=("unethical_action_probability", "mean"),
            action_rate=("unethical_action", "mean"),
            mean_pressure=("institutional_pressure", "mean"),
            mean_guilt=("anticipated_guilt", "mean"),
            mean_accountability=("accountability_strength", "mean"),
            mean_victim_recognition=("victim_recognition", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for disengagement in np.linspace(-2, 2, 41):
        for guilt in [-1, 0, 1]:
            for pressure in [-1, 0, 1]:
                latent_scenario = (
                    0.55 * disengagement
                    - 0.35 * guilt
                    + 0.30 * pressure
                    - 0.25 * 0
                )

                probability = 1 / (1 + np.exp(-latent_scenario))

                scenario_rows.append(
                    {
                        "moral_disengagement": disengagement,
                        "anticipated_guilt": guilt,
                        "institutional_pressure": pressure,
                        "predicted_unethical_action_probability": probability,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_risk_cases = (
        df.sort_values("unethical_action_probability", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "moral_disengagement_python.csv", index=False)
    summary.to_csv(output_tables / "moral_disengagement_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "moral_disengagement_scenarios.csv", index=False)
    high_risk_cases.to_csv(
        output_tables / "moral_disengagement_high_risk_cases.csv",
        index=False,
    )

    print("Synthetic moral disengagement outputs written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
