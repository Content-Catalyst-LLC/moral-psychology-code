"""Synthetic social identity and moral polarization model.

This script simulates group-conditioned moral judgment, moral exclusion risk,
and polarization distance using synthetic data.

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
            "group": np.random.choice(["Group_A", "Group_B"], size=n),
            "value_profile": np.random.normal(0, 1, n),
            "identity_strength": np.random.normal(0, 1, n),
            "norm_pressure": np.random.normal(0, 1, n),
            "threat_perception": np.random.normal(0, 1, n),
            "institutional_trust": np.random.normal(0, 1, n),
            "cross_group_contact": np.random.normal(0, 1, n),
            "dehumanizing_rhetoric": np.random.normal(0, 1, n),
            "loyalty_pressure": np.random.normal(0, 1, n),
        }
    )

    noise = np.random.normal(0, 0.8, n)
    group_a = df["group"] == "Group_A"

    df["moral_judgment"] = np.where(
        group_a,
        (
            0.35 * df["value_profile"]
            + 0.30 * df["identity_strength"]
            + 0.20 * df["norm_pressure"]
            + 0.25 * df["threat_perception"]
            - 0.15 * df["institutional_trust"]
            - 0.10 * df["cross_group_contact"]
            + noise
        ),
        (
            -0.20 * df["value_profile"]
            + 0.35 * df["identity_strength"]
            + 0.25 * df["norm_pressure"]
            + 0.30 * df["threat_perception"]
            - 0.15 * df["institutional_trust"]
            - 0.10 * df["cross_group_contact"]
            + noise
        ),
    )

    exclusion_latent = (
        0.35 * df["threat_perception"]
        + 0.30 * df["dehumanizing_rhetoric"]
        + 0.25 * df["loyalty_pressure"]
        + 0.20 * df["identity_strength"]
        - 0.25 * df["institutional_trust"]
        - 0.20 * df["cross_group_contact"]
    )

    df["moral_exclusion_risk"] = 1 / (1 + np.exp(-exclusion_latent))

    summary = (
        df.groupby("group")
        .agg(
            mean_judgment=("moral_judgment", "mean"),
            mean_identity=("identity_strength", "mean"),
            mean_norm_pressure=("norm_pressure", "mean"),
            mean_threat=("threat_perception", "mean"),
            mean_moral_exclusion_risk=("moral_exclusion_risk", "mean"),
        )
        .reset_index()
    )

    if len(summary) == 2:
        polarization_distance = abs(
            summary.loc[0, "mean_judgment"] - summary.loc[1, "mean_judgment"]
        )
    else:
        polarization_distance = np.nan

    polarization_distance_df = pd.DataFrame(
        {
            "metric": ["polarization_distance"],
            "value": [polarization_distance],
        }
    )

    scenario_rows = []

    for group in ["Group_A", "Group_B"]:
        for threat in np.linspace(-2, 2, 41):
            for identity in [-1, 0, 1]:
                for contact in [-1, 0, 1]:
                    if group == "Group_A":
                        judgment = (
                            0.30 * identity
                            + 0.25 * threat
                            - 0.10 * contact
                        )
                    else:
                        judgment = (
                            0.35 * identity
                            + 0.30 * threat
                            - 0.10 * contact
                        )

                    exclusion = 1 / (
                        1
                        + np.exp(
                            -(
                                0.35 * threat
                                + 0.20 * identity
                                - 0.20 * contact
                            )
                        )
                    )

                    scenario_rows.append(
                        {
                            "group": group,
                            "threat_perception": threat,
                            "identity_strength": identity,
                            "cross_group_contact": contact,
                            "predicted_judgment": judgment,
                            "predicted_moral_exclusion_risk": exclusion,
                        }
                    )

    scenario_df = pd.DataFrame(scenario_rows)

    high_exclusion_cases = (
        df.sort_values("moral_exclusion_risk", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "social_identity_moral_polarization_python.csv", index=False)
    summary.to_csv(output_tables / "social_identity_moral_polarization_summary.csv", index=False)
    polarization_distance_df.to_csv(
        output_tables / "social_identity_moral_polarization_distance.csv",
        index=False,
    )
    scenario_df.to_csv(
        output_tables / "social_identity_moral_polarization_scenarios.csv",
        index=False,
    )
    high_exclusion_cases.to_csv(
        output_tables / "social_identity_moral_polarization_high_exclusion_cases.csv",
        index=False,
    )

    print("Synthetic social identity and moral polarization data written to:", output_tables)
    print(summary)
    print(polarization_distance_df)


if __name__ == "__main__":
    main()
