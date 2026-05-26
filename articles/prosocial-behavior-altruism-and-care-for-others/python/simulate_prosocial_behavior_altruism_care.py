"""Synthetic prosocial behavior, altruism, and care model.

This script simulates prosocial action, altruistic motive, and caregiving
persistence from empathy, norms, relationship, vulnerability, cost, other-oriented
desire, self-oriented payoff, attentional responsiveness, ongoing need, burnout,
institutional support, and voice safety.

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
            "empathic_concern": np.random.normal(0, 1, n),
            "norm_strength": np.random.normal(0, 1, n),
            "relational_closeness": np.random.normal(0, 1, n),
            "visible_vulnerability": np.random.normal(0, 1, n),
            "perceived_cost": np.random.normal(0, 1, n),
            "other_oriented_desire": np.random.normal(0, 1, n),
            "self_oriented_payoff": np.random.normal(0, 1, n),
            "attentional_responsiveness": np.random.normal(0, 1, n),
            "ongoing_need": np.random.normal(0, 1, n),
            "burnout": np.random.normal(0, 1, n),
            "institutional_support": np.random.normal(0, 1, n),
            "voice_safety": np.random.normal(0, 1, n),
        }
    )

    action_latent = (
        0.40 * df["empathic_concern"]
        + 0.30 * df["norm_strength"]
        + 0.25 * df["relational_closeness"]
        + 0.30 * df["visible_vulnerability"]
        - 0.35 * df["perceived_cost"]
        + 0.18 * df["institutional_support"]
        + np.random.normal(0, 0.8, n)
    )

    df["prosocial_probability"] = 1 / (1 + np.exp(-action_latent))
    df["prosocial_action"] = (df["prosocial_probability"] >= 0.5).astype(int)

    df["altruistic_motive"] = (
        0.55 * df["other_oriented_desire"]
        - 0.35 * df["self_oriented_payoff"]
        + 0.20 * df["empathic_concern"]
        + np.random.normal(0, 0.8, n)
    )

    df["caregiving_persistence"] = (
        0.35 * df["attentional_responsiveness"]
        + 0.40 * df["ongoing_need"]
        - 0.30 * df["burnout"]
        + 0.25 * df["institutional_support"]
        + 0.15 * df["voice_safety"]
        + np.random.normal(0, 0.8, n)
    )

    df["empathy_group"] = np.where(
        df["empathic_concern"] >= df["empathic_concern"].median(),
        "Higher empathy",
        "Lower empathy",
    )

    df["cost_group"] = np.where(
        df["perceived_cost"] >= df["perceived_cost"].median(),
        "Higher cost",
        "Lower cost",
    )

    summary = (
        df.groupby(["empathy_group", "cost_group"])
        .agg(
            mean_help_prob=("prosocial_probability", "mean"),
            action_rate=("prosocial_action", "mean"),
            mean_altruism=("altruistic_motive", "mean"),
            mean_care=("caregiving_persistence", "mean"),
            mean_norm_strength=("norm_strength", "mean"),
            mean_vulnerability=("visible_vulnerability", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for empathy in np.linspace(-2, 2, 41):
        for cost in [-1, 0, 1]:
            for vulnerability in [-1, 0, 1]:
                latent = (
                    0.40 * empathy
                    + 0.30 * 0
                    + 0.25 * 0
                    + 0.30 * vulnerability
                    - 0.35 * cost
                    + 0.18 * 0
                )
                probability = 1 / (1 + np.exp(-latent))

                scenario_rows.append(
                    {
                        "empathic_concern": empathy,
                        "perceived_cost": cost,
                        "visible_vulnerability": vulnerability,
                        "predicted_help_probability": probability,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_empathy_low_action = (
        df[
            (df["empathic_concern"] > df["empathic_concern"].quantile(0.75))
            & (df["prosocial_action"] == 0)
        ]
        .sort_values("perceived_cost", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    high_burden_care_cases = (
        df[
            (df["ongoing_need"] > df["ongoing_need"].quantile(0.75))
            & (df["burnout"] > df["burnout"].quantile(0.75))
        ]
        .sort_values("institutional_support", ascending=True)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "prosocial_behavior_python_simulation.csv", index=False)
    summary.to_csv(output_tables / "prosocial_behavior_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "prosocial_behavior_scenarios.csv", index=False)
    high_empathy_low_action.to_csv(
        output_tables / "prosocial_high_empathy_low_action_cases.csv",
        index=False,
    )
    high_burden_care_cases.to_csv(
        output_tables / "prosocial_high_burden_care_cases.csv",
        index=False,
    )

    print("Synthetic prosocial behavior outputs written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
