"""Synthetic justice, fairness, and distributive moral judgment model.

This script simulates competing distributive principles, self-interest bias,
procedural trust, group distance, historical repair salience, distributive
judgment, support for fair allocation, and inequity aversion.

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
            "equality_weight": np.random.normal(0, 1, n),
            "equity_weight": np.random.normal(0, 1, n),
            "need_weight": np.random.normal(0, 1, n),
            "desert_weight": np.random.normal(0, 1, n),
            "priority_worse_off": np.random.normal(0, 1, n),
            "self_interest_bias": np.random.normal(0, 1, n),
            "procedural_trust": np.random.normal(0, 1, n),
            "group_distance": np.random.normal(0, 1, n),
            "historical_repair_salience": np.random.normal(0, 1, n),
        }
    )

    df["distributive_judgment"] = (
        0.30 * df["equality_weight"]
        + 0.25 * df["equity_weight"]
        + 0.25 * df["need_weight"]
        + 0.20 * df["desert_weight"]
        + 0.25 * df["priority_worse_off"]
        - 0.35 * df["self_interest_bias"]
        + 0.20 * df["procedural_trust"]
        - 0.20 * df["group_distance"]
        + 0.20 * df["historical_repair_salience"]
        + np.random.normal(0, 0.8, n)
    )

    df["support_fair_allocation"] = (df["distributive_judgment"] > 0).astype(int)

    df["inequity_aversion"] = (
        0.45 * np.abs(df["equality_weight"])
        + 0.30 * df["need_weight"]
        - 0.25 * df["self_interest_bias"]
        + np.random.normal(0, 0.8, n)
    )

    df["need_group"] = np.where(
        df["need_weight"] >= df["need_weight"].median(),
        "Higher need sensitivity",
        "Lower need sensitivity",
    )

    summary = (
        df.groupby("need_group")
        .agg(
            mean_judgment=("distributive_judgment", "mean"),
            support_rate=("support_fair_allocation", "mean"),
            mean_bias=("self_interest_bias", "mean"),
            mean_priority_worse_off=("priority_worse_off", "mean"),
            mean_historical_repair=("historical_repair_salience", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for need in np.linspace(-2, 2, 41):
        for bias in [-1, 0, 1]:
            for repair in [-1, 0, 1]:
                judgment = (
                    0.30 * 0
                    + 0.25 * 0
                    + 0.25 * need
                    + 0.20 * 0
                    + 0.25 * 0
                    - 0.35 * bias
                    + 0.20 * 0
                    - 0.20 * 0
                    + 0.20 * repair
                )

                support = 1 / (1 + np.exp(-judgment))

                scenario_rows.append(
                    {
                        "need_weight": need,
                        "self_interest_bias": bias,
                        "historical_repair_salience": repair,
                        "predicted_judgment": judgment,
                        "predicted_support_probability": support,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_need_low_support = (
        df[
            (df["need_weight"] > df["need_weight"].quantile(0.75))
            & (df["support_fair_allocation"] == 0)
        ]
        .sort_values("self_interest_bias", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "justice_fairness_distributive_judgment_python.csv", index=False)
    summary.to_csv(output_tables / "justice_fairness_distributive_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "justice_fairness_distributive_scenarios.csv", index=False)
    high_need_low_support.to_csv(
        output_tables / "justice_fairness_high_need_low_support_cases.csv",
        index=False,
    )

    print("Synthetic justice, fairness, and distributive judgment outputs written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
