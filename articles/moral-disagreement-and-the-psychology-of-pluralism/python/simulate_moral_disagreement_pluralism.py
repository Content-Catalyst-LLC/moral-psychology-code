"""Synthetic moral disagreement and pluralism model.

This script simulates moral value weighting, identity strength, framing
sensitivity, institutional trust, moral judgment, and pairwise disagreement.

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
            "harm_weight": np.random.normal(0, 1, n),
            "fairness_weight": np.random.normal(0, 1, n),
            "loyalty_weight": np.random.normal(0, 1, n),
            "purity_weight": np.random.normal(0, 1, n),
            "authority_weight": np.random.normal(0, 1, n),
            "care_weight": np.random.normal(0, 1, n),
            "identity_strength": np.random.normal(0, 1, n),
            "framing_sensitivity": np.random.normal(0, 1, n),
            "institutional_trust": np.random.normal(0, 1, n),
            "pluralist_tolerance": np.random.normal(0, 1, n),
        }
    )

    df["moral_judgment"] = (
        0.40 * df["harm_weight"]
        + 0.30 * df["fairness_weight"]
        + 0.20 * df["loyalty_weight"]
        + 0.15 * df["purity_weight"]
        + 0.15 * df["authority_weight"]
        + 0.25 * df["care_weight"]
        + 0.25 * df["identity_strength"]
        + 0.20 * df["framing_sensitivity"]
        + np.random.normal(0, 0.8, n)
    )

    pairs_i = np.random.randint(0, n, 4000)
    pairs_j = np.random.randint(0, n, 4000)

    pairs = pd.DataFrame({"i": pairs_i, "j": pairs_j})
    pairs = pairs[pairs["i"] != pairs["j"]].copy()

    pairs["judgment_i"] = df.iloc[pairs["i"]]["moral_judgment"].values
    pairs["judgment_j"] = df.iloc[pairs["j"]]["moral_judgment"].values
    pairs["disagreement"] = np.abs(pairs["judgment_i"] - pairs["judgment_j"])

    pairs["value_gap"] = (
        np.abs(df.iloc[pairs["i"]]["harm_weight"].values - df.iloc[pairs["j"]]["harm_weight"].values)
        + np.abs(df.iloc[pairs["i"]]["fairness_weight"].values - df.iloc[pairs["j"]]["fairness_weight"].values)
        + np.abs(df.iloc[pairs["i"]]["loyalty_weight"].values - df.iloc[pairs["j"]]["loyalty_weight"].values)
        + np.abs(df.iloc[pairs["i"]]["purity_weight"].values - df.iloc[pairs["j"]]["purity_weight"].values)
        + np.abs(df.iloc[pairs["i"]]["authority_weight"].values - df.iloc[pairs["j"]]["authority_weight"].values)
        + np.abs(df.iloc[pairs["i"]]["care_weight"].values - df.iloc[pairs["j"]]["care_weight"].values)
    )

    pairs["identity_gap"] = np.abs(
        df.iloc[pairs["i"]]["identity_strength"].values
        - df.iloc[pairs["j"]]["identity_strength"].values
    )

    pairs["framing_gap"] = np.abs(
        df.iloc[pairs["i"]]["framing_sensitivity"].values
        - df.iloc[pairs["j"]]["framing_sensitivity"].values
    )

    pairs["trust_gap"] = np.abs(
        df.iloc[pairs["i"]]["institutional_trust"].values
        - df.iloc[pairs["j"]]["institutional_trust"].values
    )

    pairs["pluralist_tolerance_gap"] = np.abs(
        df.iloc[pairs["i"]]["pluralist_tolerance"].values
        - df.iloc[pairs["j"]]["pluralist_tolerance"].values
    )

    pairs["disagreement_band"] = pd.qcut(
        pairs["disagreement"],
        q=4,
        labels=["Low", "Lower-middle", "Upper-middle", "High"],
    )

    summary = (
        pairs.groupby("disagreement_band", observed=False)
        .agg(
            mean_value_gap=("value_gap", "mean"),
            mean_identity_gap=("identity_gap", "mean"),
            mean_framing_gap=("framing_gap", "mean"),
            mean_trust_gap=("trust_gap", "mean"),
            mean_disagreement=("disagreement", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for harm in np.linspace(-2, 2, 25):
        for fairness in np.linspace(-2, 2, 25):
            for loyalty in [-1, 0, 1]:
                judgment = (
                    0.40 * harm
                    + 0.30 * fairness
                    + 0.20 * loyalty
                    + 0.15 * 0
                    + 0.15 * 0
                    + 0.25 * 0
                )

                scenario_rows.append(
                    {
                        "harm_weight": harm,
                        "fairness_weight": fairness,
                        "loyalty_weight": loyalty,
                        "predicted_judgment": judgment,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_disagreement_pairs = (
        pairs.sort_values("disagreement", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "moral_pluralism_profiles_python.csv", index=False)
    pairs.to_csv(output_tables / "moral_disagreement_pairs_python.csv", index=False)
    summary.to_csv(output_tables / "moral_disagreement_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "moral_pluralism_scenarios.csv", index=False)
    high_disagreement_pairs.to_csv(
        output_tables / "moral_disagreement_high_distance_pairs.csv",
        index=False,
    )

    print("Synthetic moral disagreement outputs written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
