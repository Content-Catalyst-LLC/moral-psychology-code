"""Synthetic propaganda and political polarization model.

This script simulates a moral-psychology model of propaganda, trust,
identity, threat, outrage, democratic trust, cross-group contact,
moral-political judgment, and moral exclusion risk.

Educational and reproducible research scaffold only.
"""

from pathlib import Path

import numpy as np
import pandas as pd


def logistic(x: pd.Series) -> pd.Series:
    """Compute logistic transformation."""
    return 1 / (1 + np.exp(-x))


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
            "trust_allocation": np.random.normal(0, 1, n),
            "identity_salience": np.random.normal(0, 1, n),
            "propaganda_exposure": np.random.normal(0, 1, n),
            "threat_perception": np.random.normal(0, 1, n),
            "outrage_amplification": np.random.normal(0, 1, n),
            "democratic_trust": np.random.normal(0, 1, n),
            "cross_group_contact": np.random.normal(0, 1, n),
        }
    )

    noise = np.random.normal(0, 0.8, n)

    group_a = df["group"] == "Group_A"

    df["moral_political_judgment"] = np.where(
        group_a,
        (
            0.30 * df["value_profile"]
            + 0.20 * df["trust_allocation"]
            + 0.25 * df["identity_salience"]
            + 0.30 * df["propaganda_exposure"]
            + 0.25 * df["threat_perception"]
            + 0.20 * df["outrage_amplification"]
            - 0.15 * df["democratic_trust"]
            - 0.10 * df["cross_group_contact"]
            + noise
        ),
        (
            -0.20 * df["value_profile"]
            - 0.15 * df["trust_allocation"]
            + 0.30 * df["identity_salience"]
            + 0.30 * df["propaganda_exposure"]
            + 0.30 * df["threat_perception"]
            + 0.20 * df["outrage_amplification"]
            - 0.15 * df["democratic_trust"]
            - 0.10 * df["cross_group_contact"]
            + noise
        ),
    )

    exclusion_latent = (
        0.35 * df["threat_perception"]
        + 0.30 * df["propaganda_exposure"]
        + 0.25 * df["outrage_amplification"]
        + 0.20 * df["identity_salience"]
        - 0.25 * df["democratic_trust"]
        - 0.20 * df["cross_group_contact"]
    )

    df["moral_exclusion_risk"] = logistic(exclusion_latent)

    summary = (
        df.groupby("group")
        .agg(
            mean_judgment=("moral_political_judgment", "mean"),
            mean_propaganda=("propaganda_exposure", "mean"),
            mean_threat=("threat_perception", "mean"),
            mean_identity=("identity_salience", "mean"),
            mean_outrage=("outrage_amplification", "mean"),
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

    polarization_summary = pd.DataFrame(
        {
            "metric": ["polarization_distance"],
            "value": [polarization_distance],
        }
    )

    scenario_rows = []

    for group in ["Group_A", "Group_B"]:
        for propaganda in np.linspace(-2, 2, 41):
            for threat in [-1, 0, 1]:
                for democratic_trust in [-1, 0, 1]:
                    if group == "Group_A":
                        judgment = (
                            0.30 * propaganda
                            + 0.25 * threat
                            - 0.15 * democratic_trust
                        )
                    else:
                        judgment = (
                            0.30 * propaganda
                            + 0.30 * threat
                            - 0.15 * democratic_trust
                        )

                    exclusion = 1 / (
                        1
                        + np.exp(
                            -(
                                0.35 * threat
                                + 0.30 * propaganda
                                - 0.25 * democratic_trust
                            )
                        )
                    )

                    scenario_rows.append(
                        {
                            "group": group,
                            "propaganda_exposure": propaganda,
                            "threat_perception": threat,
                            "democratic_trust": democratic_trust,
                            "predicted_judgment": judgment,
                            "predicted_moral_exclusion_risk": exclusion,
                        }
                    )

    scenario_df = pd.DataFrame(scenario_rows)

    high_risk_cases = (
        df.sort_values("moral_exclusion_risk", ascending=False)
        .head(25)
        .reset_index(drop=True)
    )

    df.to_csv(output_tables / "propaganda_polarization_python.csv", index=False)
    summary.to_csv(output_tables / "propaganda_polarization_summary.csv", index=False)
    polarization_summary.to_csv(
        output_tables / "propaganda_polarization_distance.csv",
        index=False,
    )
    scenario_df.to_csv(
        output_tables / "propaganda_polarization_scenarios.csv",
        index=False,
    )
    high_risk_cases.to_csv(
        output_tables / "propaganda_polarization_high_risk_cases.csv",
        index=False,
    )

    print("Synthetic propaganda and polarization data written to:", output_tables)
    print(summary)
    print(polarization_summary)


if __name__ == "__main__":
    main()
