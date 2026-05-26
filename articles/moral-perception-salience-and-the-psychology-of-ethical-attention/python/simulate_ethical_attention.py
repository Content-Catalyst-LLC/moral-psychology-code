"""Synthetic ethical-attention model.

This script simulates moral salience under conditions of competing attentional
demands. It models how harm, vulnerability, emotion, mind perception, and
contextual framing increase ethical notice, while attentional competition and
organized inattention reduce it.

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
            "perceived_harm": np.random.normal(0, 1, n),
            "visible_vulnerability": np.random.normal(0, 1, n),
            "emotional_activation": np.random.normal(0, 1, n),
            "mind_perception": np.random.normal(0, 1, n),
            "contextual_framing": np.random.normal(0, 1, n),
            "attentional_competition": np.random.normal(0, 1, n),
            "organized_inattention": np.random.normal(0, 1, n),
            "intention_attribution": np.random.normal(0, 1, n),
            "reflective_interpretation": np.random.normal(0, 1, n),
            "repair_pathway": np.random.normal(0, 1, n),
        }
    )

    latent_salience = (
        0.60 * df["perceived_harm"]
        + 0.50 * df["visible_vulnerability"]
        + 0.35 * df["emotional_activation"]
        + 0.40 * df["mind_perception"]
        + 0.25 * df["contextual_framing"]
        - 0.45 * df["attentional_competition"]
        - 0.35 * df["organized_inattention"]
        + np.random.normal(0, 0.8, n)
    )

    df["latent_salience"] = latent_salience
    df["focal_attention_probability"] = 1 / (1 + np.exp(-latent_salience))
    df["focal_attention"] = (df["focal_attention_probability"] >= 0.5).astype(int)

    df["moral_judgment"] = (
        0.70 * df["focal_attention"]
        + 0.35 * df["intention_attribution"]
        + 0.30 * df["reflective_interpretation"]
        - 0.15 * df["organized_inattention"]
        + np.random.normal(0, 0.9, n)
    )

    df["ethical_response_tendency"] = (
        0.45 * df["focal_attention"]
        + 0.30 * df["moral_judgment"]
        + 0.25 * df["repair_pathway"]
        - 0.20 * df["attentional_competition"]
        - 0.20 * df["organized_inattention"]
        + np.random.normal(0, 0.9, n)
    )

    summary = (
        df.groupby("focal_attention")
        .agg(
            mean_harm=("perceived_harm", "mean"),
            mean_vulnerability=("visible_vulnerability", "mean"),
            mean_emotion=("emotional_activation", "mean"),
            mean_mind_perception=("mind_perception", "mean"),
            mean_competition=("attentional_competition", "mean"),
            mean_organized_inattention=("organized_inattention", "mean"),
            mean_judgment=("moral_judgment", "mean"),
            mean_response=("ethical_response_tendency", "mean"),
        )
        .reset_index()
    )

    scenario_rows = []

    for harm in np.linspace(-2, 2, 41):
        for vulnerability in [-1, 0, 1]:
            for organized_inattention in [-1, 0, 1]:
                latent = (
                    0.60 * harm
                    + 0.50 * vulnerability
                    + 0.35 * 0
                    + 0.40 * 0
                    + 0.25 * 0
                    - 0.45 * 0
                    - 0.35 * organized_inattention
                )

                probability = 1 / (1 + np.exp(-latent))

                scenario_rows.append(
                    {
                        "perceived_harm": harm,
                        "visible_vulnerability": vulnerability,
                        "organized_inattention": organized_inattention,
                        "predicted_focal_attention_probability": probability,
                    }
                )

    scenario_df = pd.DataFrame(scenario_rows)

    low_attention_high_harm = (
        df[
            (df["perceived_harm"] > df["perceived_harm"].quantile(0.75))
            & (df["focal_attention"] == 0)
        ]
        .sort_values(
            ["organized_inattention", "attentional_competition"],
            ascending=False,
        )
        .head(25)
        .reset_index(drop=True)
    )

    high_salience_high_response = (
        df[
            (df["latent_salience"] > df["latent_salience"].quantile(0.75))
            & (
                df["ethical_response_tendency"]
                > df["ethical_response_tendency"].quantile(0.75)
            )
        ]
        .sort_values(
            ["repair_pathway", "mind_perception"],
            ascending=False,
        )
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "ethical_attention_python_simulation.csv", index=False)
    summary.to_csv(output_tables / "ethical_attention_summary.csv", index=False)
    scenario_df.to_csv(output_tables / "ethical_attention_scenarios.csv", index=False)
    low_attention_high_harm.to_csv(
        output_tables / "ethical_attention_low_attention_high_harm_cases.csv",
        index=False,
    )
    high_salience_high_response.to_csv(
        output_tables / "ethical_attention_high_salience_high_response_cases.csv",
        index=False,
    )

    print("Synthetic ethical-attention outputs written to:", output_tables)
    print(summary)


if __name__ == "__main__":
    main()
