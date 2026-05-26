"""Synthetic cross-cultural moral judgment model.

This script simulates culturally weighted moral judgment and norm-enforcement
tendency using synthetic placeholder cultural contexts.

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
            "culture": np.random.choice(
                ["Context_A", "Context_B", "Context_C"],
                size=n,
            ),
            "harm_sensitivity": np.random.normal(0, 1, n),
            "fairness_sensitivity": np.random.normal(0, 1, n),
            "loyalty_sensitivity": np.random.normal(0, 1, n),
            "authority_sensitivity": np.random.normal(0, 1, n),
            "purity_sensitivity": np.random.normal(0, 1, n),
            "relational_obligation": np.random.normal(0, 1, n),
            "norm_learning": np.random.normal(0, 1, n),
            "sanction_expectation": np.random.normal(0, 1, n),
        }
    )

    noise = np.random.normal(0, 0.8, n)

    context_a = df["culture"] == "Context_A"
    context_b = df["culture"] == "Context_B"

    df["moral_judgment"] = np.select(
        [context_a, context_b],
        [
            (
                0.45 * df["harm_sensitivity"]
                + 0.30 * df["fairness_sensitivity"]
                + 0.10 * df["loyalty_sensitivity"]
                + 0.10 * df["authority_sensitivity"]
                + 0.05 * df["purity_sensitivity"]
                + 0.10 * df["relational_obligation"]
                + 0.15 * df["norm_learning"]
                + noise
            ),
            (
                0.25 * df["harm_sensitivity"]
                + 0.20 * df["fairness_sensitivity"]
                + 0.30 * df["loyalty_sensitivity"]
                + 0.25 * df["authority_sensitivity"]
                + 0.20 * df["purity_sensitivity"]
                + 0.25 * df["relational_obligation"]
                + 0.15 * df["norm_learning"]
                + noise
            ),
        ],
        default=(
            0.30 * df["harm_sensitivity"]
            + 0.25 * df["fairness_sensitivity"]
            + 0.25 * df["loyalty_sensitivity"]
            + 0.20 * df["authority_sensitivity"]
            + 0.15 * df["purity_sensitivity"]
            + 0.20 * df["relational_obligation"]
            + 0.15 * df["norm_learning"]
            + noise
        ),
    )

    enforcement_latent = (
        0.25 * df["sanction_expectation"]
        + 0.25 * df["norm_learning"]
        + 0.20 * df["authority_sensitivity"]
        + 0.20 * df["loyalty_sensitivity"]
        + 0.15 * df["relational_obligation"]
    )

    df["norm_enforcement_tendency"] = 1 / (1 + np.exp(-enforcement_latent))

    summary = (
        df.groupby("culture")
        .agg(
            mean_judgment=("moral_judgment", "mean"),
            mean_harm=("harm_sensitivity", "mean"),
            mean_fairness=("fairness_sensitivity", "mean"),
            mean_loyalty=("loyalty_sensitivity", "mean"),
            mean_authority=("authority_sensitivity", "mean"),
            mean_purity=("purity_sensitivity", "mean"),
            mean_relational_obligation=("relational_obligation", "mean"),
            mean_norm_enforcement=("norm_enforcement_tendency", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for culture in ["Context_A", "Context_B", "Context_C"]:
        for harm in np.linspace(-2, 2, 25):
            for authority in np.linspace(-2, 2, 25):
                if culture == "Context_A":
                    judgment = 0.45 * harm + 0.10 * authority
                elif culture == "Context_B":
                    judgment = 0.25 * harm + 0.25 * authority
                else:
                    judgment = 0.30 * harm + 0.20 * authority

                scenario_rows.append(
                    {
                        "culture": culture,
                        "harm_sensitivity": harm,
                        "authority_sensitivity": authority,
                        "predicted_judgment": judgment,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_enforcement_cases = (
        df.sort_values("norm_enforcement_tendency", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "cross_cultural_moral_profiles_python.csv", index=False)
    summary.to_csv(output_tables / "cross_cultural_moral_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "cross_cultural_moral_scenarios.csv", index=False)
    high_enforcement_cases.to_csv(
        output_tables / "cross_cultural_moral_high_enforcement_cases.csv",
        index=False,
    )

    print("Synthetic cross-cultural moral judgment data written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
