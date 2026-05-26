"""Map synthetic historical shifts in moral psychology.

This script models moral psychology as a historical sequence of paradigms and
computes how synthetic explanatory weights change over time.

Educational and reproducible research scaffold only.
"""

from pathlib import Path
import math
import pandas as pd


def normalized_entropy(values: list[float]) -> float:
    total = sum(values)
    if total <= 0:
        return 0.0
    probabilities = [value / total for value in values if value > 0]
    raw_entropy = -sum(p * math.log(p) for p in probabilities)
    max_entropy = math.log(len(values))
    return raw_entropy / max_entropy


def main() -> None:
    article_root = Path(__file__).resolve().parents[1]
    output_tables = article_root / "outputs" / "tables"
    output_tables.mkdir(parents=True, exist_ok=True)

    history = pd.DataFrame(
        [
            {
                "period": "Moral Sense Theory",
                "year_mid": 1735,
                "sentiment": 0.80,
                "reason": 0.30,
                "development": 0.10,
                "intuition": 0.35,
                "culture_politics": 0.10,
                "neuroscience_experiment": 0.00,
                "institutions": 0.15,
            },
            {
                "period": "Hume and Smith",
                "year_mid": 1765,
                "sentiment": 0.85,
                "reason": 0.35,
                "development": 0.10,
                "intuition": 0.40,
                "culture_politics": 0.15,
                "neuroscience_experiment": 0.00,
                "institutions": 0.25,
            },
            {
                "period": "Rationalist Countercurrent",
                "year_mid": 1785,
                "sentiment": 0.20,
                "reason": 0.90,
                "development": 0.10,
                "intuition": 0.10,
                "culture_politics": 0.10,
                "neuroscience_experiment": 0.00,
                "institutions": 0.20,
            },
            {
                "period": "Nineteenth-Century Social and Evolutionary Shifts",
                "year_mid": 1880,
                "sentiment": 0.35,
                "reason": 0.45,
                "development": 0.25,
                "intuition": 0.30,
                "culture_politics": 0.35,
                "neuroscience_experiment": 0.05,
                "institutions": 0.40,
            },
            {
                "period": "Developmental Tradition",
                "year_mid": 1965,
                "sentiment": 0.20,
                "reason": 0.75,
                "development": 0.95,
                "intuition": 0.20,
                "culture_politics": 0.15,
                "neuroscience_experiment": 0.20,
                "institutions": 0.20,
            },
            {
                "period": "Care and Domain Critiques",
                "year_mid": 1985,
                "sentiment": 0.35,
                "reason": 0.45,
                "development": 0.70,
                "intuition": 0.30,
                "culture_politics": 0.35,
                "neuroscience_experiment": 0.25,
                "institutions": 0.30,
            },
            {
                "period": "Social Learning and Moral Disengagement",
                "year_mid": 1995,
                "sentiment": 0.35,
                "reason": 0.45,
                "development": 0.55,
                "intuition": 0.35,
                "culture_politics": 0.40,
                "neuroscience_experiment": 0.35,
                "institutions": 0.55,
            },
            {
                "period": "Intuitionist / Dual-Process Era",
                "year_mid": 2005,
                "sentiment": 0.55,
                "reason": 0.35,
                "development": 0.30,
                "intuition": 0.90,
                "culture_politics": 0.35,
                "neuroscience_experiment": 0.85,
                "institutions": 0.35,
            },
            {
                "period": "Experimental Moral Psychology Era",
                "year_mid": 2015,
                "sentiment": 0.50,
                "reason": 0.40,
                "development": 0.35,
                "intuition": 0.80,
                "culture_politics": 0.60,
                "neuroscience_experiment": 0.95,
                "institutions": 0.50,
            },
            {
                "period": "Contemporary Pluralist and Institutional Era",
                "year_mid": 2025,
                "sentiment": 0.45,
                "reason": 0.40,
                "development": 0.45,
                "intuition": 0.75,
                "culture_politics": 0.85,
                "neuroscience_experiment": 0.80,
                "institutions": 0.90,
            },
        ]
    )

    dimensions = [
        "sentiment",
        "reason",
        "development",
        "intuition",
        "culture_politics",
        "neuroscience_experiment",
        "institutions",
    ]

    history["diversification"] = history[dimensions].apply(
        lambda row: normalized_entropy(row.tolist()),
        axis=1,
    )

    weights = {dimension: 1.0 for dimension in dimensions}

    history["field_center_score"] = history[dimensions].apply(
        lambda row: sum(row[dimension] * weights[dimension] for dimension in dimensions),
        axis=1,
    )

    history["dominant_mode"] = history[dimensions].idxmax(axis=1)

    history_long = history.melt(
        id_vars=["period", "year_mid", "diversification", "field_center_score"],
        value_vars=dimensions,
        var_name="dimension",
        value_name="weight",
    )

    dominant_summary = history[
        ["period", "year_mid", "dominant_mode", "diversification", "field_center_score"]
    ]

    growth_rows = []

    for dimension in dimensions:
        first_value = history.iloc[0][dimension]
        last_value = history.iloc[-1][dimension]
        growth_rows.append(
            {
                "dimension": dimension,
                "first_period_value": first_value,
                "contemporary_value": last_value,
                "net_change": last_value - first_value,
            }
        )

    growth_summary = pd.DataFrame(growth_rows).sort_values(
        "net_change",
        ascending=False,
    )

    history.to_csv(output_tables / "moral_psychology_history_summary.csv", index=False)
    history_long.to_csv(output_tables / "moral_psychology_history_long.csv", index=False)
    dominant_summary.to_csv(output_tables / "moral_psychology_dominant_modes.csv", index=False)
    growth_summary.to_csv(output_tables / "moral_psychology_explanatory_growth.csv", index=False)

    print("Synthetic moral psychology history outputs written to:", output_tables)
    print(dominant_summary)
    print(growth_summary)


if __name__ == "__main__":
    main()
