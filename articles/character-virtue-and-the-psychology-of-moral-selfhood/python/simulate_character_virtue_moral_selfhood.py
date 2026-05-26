"""Synthetic character, virtue, and moral selfhood model.

This script simulates character strength, moral selfhood profile, and virtuous
action probability from trait disposition, habituated practice, identity integration,
self-regulation, accountability, repair capacity, situational pressure, and
institutional support.

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
            "trait_disposition": np.random.normal(0, 1, n),
            "habituated_practice": np.random.normal(0, 1, n),
            "identity_integration": np.random.normal(0, 1, n),
            "self_regulation": np.random.normal(0, 1, n),
            "accountability": np.random.normal(0, 1, n),
            "repair_capacity": np.random.normal(0, 1, n),
            "situational_pressure": np.random.normal(0, 1, n),
            "institutional_support": np.random.normal(0, 1, n),
        }
    )

    df["character_strength"] = (
        0.35 * df["trait_disposition"]
        + 0.40 * df["habituated_practice"]
        + 0.35 * df["identity_integration"]
        + 0.30 * df["self_regulation"]
        + 0.20 * df["accountability"]
        + np.random.normal(0, 0.8, n)
    )

    df["moral_selfhood_profile"] = (
        0.40 * df["character_strength"]
        + 0.30 * df["identity_integration"]
        + 0.25 * df["accountability"]
        + 0.30 * df["repair_capacity"]
        + 0.20 * df["self_regulation"]
        + np.random.normal(0, 0.8, n)
    )

    action_latent = (
        0.45 * df["character_strength"]
        + 0.30 * df["moral_selfhood_profile"]
        - 0.40 * df["situational_pressure"]
        + 0.25 * df["institutional_support"]
        + 0.20 * df["self_regulation"]
        + np.random.normal(0, 0.8, n)
    )

    df["virtuous_action_probability"] = 1 / (1 + np.exp(-action_latent))
    df["virtuous_action"] = (df["virtuous_action_probability"] >= 0.5).astype(int)

    df["character_group"] = np.where(
        df["character_strength"] >= df["character_strength"].median(),
        "Higher character strength",
        "Lower character strength",
    )

    df["pressure_group"] = np.where(
        df["situational_pressure"] >= df["situational_pressure"].median(),
        "Higher situational pressure",
        "Lower situational pressure",
    )

    summary = (
        df.groupby(["character_group", "pressure_group"])
        .agg(
            mean_action_prob=("virtuous_action_probability", "mean"),
            action_rate=("virtuous_action", "mean"),
            mean_selfhood=("moral_selfhood_profile", "mean"),
            mean_identity=("identity_integration", "mean"),
            mean_repair=("repair_capacity", "mean"),
            mean_pressure=("situational_pressure", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for character in np.linspace(-2, 2, 41):
        for pressure in [-1, 0, 1]:
            for selfhood in [-1, 0, 1]:
                latent = (
                    0.45 * character
                    + 0.30 * selfhood
                    - 0.40 * pressure
                    + 0.25 * 0
                    + 0.20 * 0
                )
                probability = 1 / (1 + np.exp(-latent))

                scenario_rows.append(
                    {
                        "character_strength": character,
                        "situational_pressure": pressure,
                        "moral_selfhood_profile": selfhood,
                        "predicted_virtuous_action_probability": probability,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_character_low_action = (
        df[
            (df["character_strength"] > df["character_strength"].quantile(0.75))
            & (df["virtuous_action"] == 0)
        ]
        .sort_values("situational_pressure", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "character_virtue_moral_selfhood_python.csv", index=False)
    summary.to_csv(output_tables / "character_virtue_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "character_virtue_scenarios.csv", index=False)
    high_character_low_action.to_csv(
        output_tables / "character_virtue_high_character_low_action_cases.csv",
        index=False,
    )

    print("Synthetic character, virtue, and moral selfhood outputs written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
