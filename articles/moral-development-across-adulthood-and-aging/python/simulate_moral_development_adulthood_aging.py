"""Synthetic moral development across adulthood and aging model.

This script simulates adult lifespan moral development using synthetic data:
age, moral identity, prosocial orientation, role complexity, moral-emotional
profile, decision capacity, generativity, caregiving burden, loss reflection,
voice safety, accountability strength, moral-development profile, and moral action.

Educational and reproducible research scaffold only.
"""

from pathlib import Path

import numpy as np
import pandas as pd


def assign_adulthood_band(age: float) -> str:
    """Return an interpretive adult lifespan band for synthetic age."""
    if age < 30:
        return "Emerging/young adulthood"
    if age < 45:
        return "Early adulthood"
    if age < 60:
        return "Mid-adulthood"
    if age < 75:
        return "Older adulthood"
    return "Advanced old age"


def main() -> None:
    np.random.seed(42)

    article_root = Path(__file__).resolve().parents[1]
    output_tables = article_root / "outputs" / "tables"
    output_tables.mkdir(parents=True, exist_ok=True)

    n = 2600

    df = pd.DataFrame(
        {
            "case_id": np.arange(1, n + 1),
            "age": np.random.uniform(18, 85, n),
            "moral_identity": np.random.normal(0, 1, n),
            "prosocial_orientation": np.random.normal(0, 1, n),
            "role_complexity": np.random.normal(0, 1, n),
            "moral_emotion_profile": np.random.normal(0, 1, n),
            "decision_capacity": np.random.normal(0, 1, n),
            "generativity": np.random.normal(0, 1, n),
            "caregiving_burden": np.random.normal(0, 1, n),
            "loss_reflection": np.random.normal(0, 1, n),
            "voice_safety": np.random.normal(0, 1, n),
            "accountability_strength": np.random.normal(0, 1, n),
        }
    )

    df["latent_moral_development"] = (
        0.03 * df["age"]
        - 0.00025 * (df["age"] ** 2)
        + 0.35 * df["moral_identity"]
        + 0.40 * df["prosocial_orientation"]
        + 0.30 * df["role_complexity"]
        + 0.25 * df["moral_emotion_profile"]
        + 0.20 * df["decision_capacity"]
        + 0.25 * df["generativity"]
        - 0.20 * df["caregiving_burden"]
        + 0.15 * df["loss_reflection"]
        + np.random.normal(0, 1, n)
    )

    df["adulthood_band"] = df["age"].apply(assign_adulthood_band)

    latent_action = (
        0.45 * df["latent_moral_development"]
        + 0.25 * df["voice_safety"]
        + 0.25 * df["accountability_strength"]
        - 0.25 * df["caregiving_burden"]
        + np.random.normal(0, 0.9, n)
    )

    df["moral_action_probability"] = 1 / (1 + np.exp(-latent_action))
    df["moral_action"] = (df["moral_action_probability"] >= 0.5).astype(int)

    summary = (
        df.groupby("adulthood_band")
        .agg(
            mean_age=("age", "mean"),
            mean_identity=("moral_identity", "mean"),
            mean_prosociality=("prosocial_orientation", "mean"),
            mean_role_complexity=("role_complexity", "mean"),
            mean_generativity=("generativity", "mean"),
            mean_burden=("caregiving_burden", "mean"),
            mean_profile=("latent_moral_development", "mean"),
            mean_action_probability=("moral_action_probability", "mean"),
            action_rate=("moral_action", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for age in np.linspace(18, 85, 40):
        for prosocial in [-1, 0, 1]:
            for burden in [-1, 0, 1]:
                latent_profile = (
                    0.03 * age
                    - 0.00025 * (age ** 2)
                    + 0.35 * 0
                    + 0.40 * prosocial
                    + 0.30 * 0
                    + 0.25 * 0
                    + 0.20 * 0
                    + 0.25 * 0
                    - 0.20 * burden
                    + 0.15 * 0
                )

                latent_action_scenario = (
                    0.45 * latent_profile
                    + 0.25 * 0
                    + 0.25 * 0
                    - 0.25 * burden
                )

                action_probability = 1 / (1 + np.exp(-latent_action_scenario))

                scenario_rows.append(
                    {
                        "age": age,
                        "predicted_band": assign_adulthood_band(age),
                        "prosocial_orientation": prosocial,
                        "caregiving_burden": burden,
                        "latent_moral_development": latent_profile,
                        "predicted_action_probability": action_probability,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_development_low_action = (
        df[
            (df["latent_moral_development"] > df["latent_moral_development"].quantile(0.75))
            & (df["moral_action"] == 0)
        ]
        .sort_values("caregiving_burden", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "moral_development_adulthood_aging_python.csv", index=False)
    summary.to_csv(output_tables / "moral_development_adulthood_aging_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "moral_development_adulthood_aging_scenarios.csv", index=False)
    high_development_low_action.to_csv(
        output_tables / "moral_development_high_development_low_action_cases.csv",
        index=False,
    )

    print("Synthetic adulthood and aging moral-development outputs written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
