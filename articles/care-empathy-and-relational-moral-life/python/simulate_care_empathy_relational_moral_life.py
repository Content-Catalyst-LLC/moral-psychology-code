"""Synthetic care, empathy, and relational moral life model.

This script simulates empathy and caring response from perspective-taking,
affective resonance, situational salience, felt responsibility, perceived
dependence, temporal persistence, burnout, institutional support, and voice safety.

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
            "perspective_taking": np.random.normal(0, 1, n),
            "affective_resonance": np.random.normal(0, 1, n),
            "situational_salience": np.random.normal(0, 1, n),
            "felt_responsibility": np.random.normal(0, 1, n),
            "perceived_dependence": np.random.normal(0, 1, n),
            "temporal_persistence": np.random.normal(0, 1, n),
            "burnout": np.random.normal(0, 1, n),
            "institutional_support": np.random.normal(0, 1, n),
            "voice_safety": np.random.normal(0, 1, n),
        }
    )

    df["empathy"] = (
        0.40 * df["perspective_taking"]
        + 0.35 * df["affective_resonance"]
        + 0.30 * df["situational_salience"]
        + np.random.normal(0, 0.8, n)
    )

    care_latent = (
        0.35 * df["empathy"]
        + 0.40 * df["felt_responsibility"]
        + 0.35 * df["perceived_dependence"]
        + 0.30 * df["temporal_persistence"]
        - 0.40 * df["burnout"]
        + 0.25 * df["institutional_support"]
        + 0.18 * df["voice_safety"]
        + np.random.normal(0, 0.8, n)
    )

    df["caring_response_probability"] = 1 / (1 + np.exp(-care_latent))
    df["caring_response"] = (df["caring_response_probability"] >= 0.5).astype(int)

    df["responsibility_group"] = np.where(
        df["felt_responsibility"] >= df["felt_responsibility"].median(),
        "Higher felt responsibility",
        "Lower felt responsibility",
    )

    df["burnout_group"] = np.where(
        df["burnout"] >= df["burnout"].median(),
        "Higher burnout",
        "Lower burnout",
    )

    summary = (
        df.groupby(["responsibility_group", "burnout_group"])
        .agg(
            mean_empathy=("empathy", "mean"),
            mean_care_prob=("caring_response_probability", "mean"),
            care_rate=("caring_response", "mean"),
            mean_dependence=("perceived_dependence", "mean"),
            mean_persistence=("temporal_persistence", "mean"),
            mean_support=("institutional_support", "mean"),
            mean_voice_safety=("voice_safety", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for empathy in np.linspace(-2, 2, 41):
        for dependence in [-1, 0, 1]:
            for burnout in [-1, 0, 1]:
                latent = (
                    0.35 * empathy
                    + 0.40 * 0
                    + 0.35 * dependence
                    + 0.30 * 0
                    - 0.40 * burnout
                    + 0.25 * 0
                    + 0.18 * 0
                )

                probability = 1 / (1 + np.exp(-latent))

                scenario_rows.append(
                    {
                        "empathy": empathy,
                        "perceived_dependence": dependence,
                        "burnout": burnout,
                        "predicted_caring_response_probability": probability,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    high_empathy_low_care = (
        df[
            (df["empathy"] > df["empathy"].quantile(0.75))
            & (df["caring_response"] == 0)
        ]
        .sort_values("burnout", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "care_empathy_relational_moral_life_python.csv", index=False)
    summary.to_csv(output_tables / "care_empathy_relational_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "care_empathy_relational_scenarios.csv", index=False)
    high_empathy_low_care.to_csv(
        output_tables / "care_empathy_high_empathy_low_care_cases.csv",
        index=False,
    )

    print("Synthetic care, empathy, and relational moral life outputs written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
