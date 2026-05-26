"""Synthetic personality, character, and moral variation model.

This script simulates broad personality, character strength, moral identity,
empathy, self-regulation, humility, self-interest bias, situational pressure,
voice safety, accountability strength, moral response profiles, and moral action.

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
            "broad_personality": np.random.normal(0, 1, n),
            "character_strength": np.random.normal(0, 1, n),
            "moral_identity": np.random.normal(0, 1, n),
            "empathy": np.random.normal(0, 1, n),
            "conscientious_self_regulation": np.random.normal(0, 1, n),
            "humility": np.random.normal(0, 1, n),
            "self_interest_bias": np.random.normal(0, 1, n),
            "situational_pressure": np.random.normal(0, 1, n),
            "voice_safety": np.random.normal(0, 1, n),
            "accountability_strength": np.random.normal(0, 1, n),
        }
    )

    df["moral_response_profile"] = (
        0.20 * df["broad_personality"]
        + 0.30 * df["character_strength"]
        + 0.35 * df["moral_identity"]
        + 0.25 * df["empathy"]
        + 0.20 * df["conscientious_self_regulation"]
        + 0.15 * df["humility"]
        - 0.35 * df["self_interest_bias"]
        + np.random.normal(0, 0.8, n)
    )

    latent = (
        0.45 * df["moral_response_profile"]
        - 0.35 * df["situational_pressure"]
        + 0.25 * df["voice_safety"]
        + 0.25 * df["accountability_strength"]
        + np.random.normal(0, 0.9, n)
    )

    df["moral_action_probability"] = 1 / (1 + np.exp(-latent))
    df["moral_action"] = (df["moral_action_probability"] >= 0.5).astype(int)

    df["character_group"] = np.where(
        df["character_strength"] >= df["character_strength"].median(),
        "Higher character",
        "Lower character",
    )

    df["bias_group"] = np.where(
        df["self_interest_bias"] >= df["self_interest_bias"].median(),
        "Higher self-interest bias",
        "Lower self-interest bias",
    )

    summary = (
        df.groupby(["character_group", "bias_group"])
        .agg(
            mean_action_prob=("moral_action_probability", "mean"),
            action_rate=("moral_action", "mean"),
            mean_identity=("moral_identity", "mean"),
            mean_empathy=("empathy", "mean"),
            mean_voice_safety=("voice_safety", "mean"),
            mean_accountability=("accountability_strength", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for identity in np.linspace(-2, 2, 41):
        for bias in [-1, 0, 1]:
            for pressure in [-1, 0, 1]:
                profile = (
                    0.20 * 0
                    + 0.30 * 0
                    + 0.35 * identity
                    + 0.25 * 0
                    + 0.20 * 0
                    + 0.15 * 0
                    - 0.35 * bias
                )

                latent_scenario = (
                    0.45 * profile
                    - 0.35 * pressure
                    + 0.25 * 0
                    + 0.25 * 0
                )

                probability = 1 / (1 + np.exp(-latent_scenario))

                scenario_rows.append(
                    {
                        "moral_identity": identity,
                        "self_interest_bias": bias,
                        "situational_pressure": pressure,
                        "predicted_profile": profile,
                        "predicted_action_probability": probability,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_profile_low_action = (
        df[
            (df["moral_response_profile"] > df["moral_response_profile"].quantile(0.75))
            & (df["moral_action"] == 0)
        ]
        .sort_values("situational_pressure", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "personality_character_individual_differences_python.csv", index=False)
    summary.to_csv(output_tables / "personality_character_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "personality_character_scenarios.csv", index=False)
    high_profile_low_action.to_csv(
        output_tables / "personality_character_high_profile_low_action_cases.csv",
        index=False,
    )

    print("Synthetic personality, character, and individual-difference outputs written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
