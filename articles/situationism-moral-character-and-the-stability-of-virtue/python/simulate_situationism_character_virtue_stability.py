"""Synthetic situationism, character, and virtue stability model.

This script simulates person-situation interaction in moral action:
character strength, self-regulation, habit strength, moral identity,
depletion, situational pressure, voice safety, accountability visibility,
and moral action probability.

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

    n_people = 600
    n_situations = 12

    people = pd.DataFrame(
        {
            "person_id": np.arange(1, n_people + 1),
            "character_strength": np.random.normal(0, 1, n_people),
            "self_regulation": np.random.normal(0, 1, n_people),
            "habit_strength": np.random.normal(0, 1, n_people),
            "moral_identity": np.random.normal(0, 1, n_people),
            "depletion": np.random.normal(0, 1, n_people),
        }
    )

    situations = pd.DataFrame(
        {
            "situation_id": np.arange(1, n_situations + 1),
            "situational_pressure": np.linspace(-1.6, 1.6, n_situations),
            "voice_safety": np.linspace(1.3, -1.3, n_situations),
            "accountability_visibility": np.linspace(1.2, -1.2, n_situations),
        }
    )

    df = people.merge(situations, how="cross")

    latent = (
        0.42 * df["character_strength"]
        + 0.28 * df["self_regulation"]
        + 0.25 * df["habit_strength"]
        + 0.22 * df["moral_identity"]
        - 0.55 * df["situational_pressure"]
        + 0.25 * df["voice_safety"]
        + 0.25 * df["accountability_visibility"]
        - 0.20 * df["depletion"]
        - 0.22 * df["character_strength"] * df["situational_pressure"]
        + np.random.normal(0, 0.9, len(df))
    )

    df["moral_action_probability"] = 1 / (1 + np.exp(-latent))
    df["moral_action"] = (df["moral_action_probability"] >= 0.5).astype(int)

    df["pressure_band"] = pd.qcut(
        df["situational_pressure"],
        q=4,
        labels=["Low", "Lower-middle", "Upper-middle", "High"],
    )

    summary = (
        df.groupby("pressure_band", observed=False)
        .agg(
            mean_character=("character_strength", "mean"),
            mean_self_regulation=("self_regulation", "mean"),
            mean_habit=("habit_strength", "mean"),
            mean_identity=("moral_identity", "mean"),
            mean_pressure=("situational_pressure", "mean"),
            mean_voice_safety=("voice_safety", "mean"),
            mean_accountability=("accountability_visibility", "mean"),
            mean_action_prob=("moral_action_probability", "mean"),
            action_rate=("moral_action", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for character in np.linspace(-2, 2, 41):
        for pressure in [-1, 0, 1]:
            for habit in [-1, 0, 1]:
                latent_scenario = (
                    0.42 * character
                    + 0.28 * 0
                    + 0.25 * habit
                    + 0.22 * 0
                    - 0.55 * pressure
                    + 0.25 * 0
                    + 0.25 * 0
                    - 0.20 * 0
                    - 0.22 * character * pressure
                )

                probability = 1 / (1 + np.exp(-latent_scenario))

                scenario_rows.append(
                    {
                        "character_strength": character,
                        "situational_pressure": pressure,
                        "habit_strength": habit,
                        "predicted_action_probability": probability,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_character_low_action = (
        df[
            (df["character_strength"] > df["character_strength"].quantile(0.75))
            & (df["moral_action"] == 0)
        ]
        .sort_values("situational_pressure", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "situationism_character_python.csv", index=False)
    summary.to_csv(output_tables / "situationism_character_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "situationism_character_scenarios.csv", index=False)
    high_character_low_action.to_csv(
        output_tables / "situationism_high_character_low_action_cases.csv",
        index=False,
    )

    print("Synthetic situationism and character outputs written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
