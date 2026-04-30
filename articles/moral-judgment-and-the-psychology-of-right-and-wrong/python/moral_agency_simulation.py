"""Synthetic moral psychology simulation.

This script creates toy moral-agency data for article examples.
It is educational only and not a clinical, legal, ethical-adjudication,
employment-screening, or automated moral-judgment tool.
"""

from pathlib import Path
import csv
import random

random.seed(2525)

n_people = 230
n_periods = 20

people = []

for person_index in range(1, n_people + 1):
    people.append({
        "participant_id": f"P{person_index:03d}",
        "moral_perception": random.uniform(0.20, 0.90),
        "moral_identity": random.uniform(0.20, 0.90),
        "self_regulation": random.uniform(0.20, 0.90),
        "reparative_orientation": random.uniform(0.20, 0.90),
        "failure_dynamics": random.uniform(0.10, 0.90),
    })

records = []
actions = []
observation_id = 1
action_id = 1

for period in range(1, n_periods + 1):
    moral_judgment = random.uniform(0.15, 0.95)
    moral_emotion = random.uniform(0.15, 0.95)

    for person in people:
        agency_score = (
            0.14 * person["moral_perception"] +
            0.13 * moral_judgment +
            0.12 * moral_emotion +
            0.15 * person["moral_identity"] +
            0.15 * person["self_regulation"] +
            0.13 * person["reparative_orientation"] -
            0.17 * person["failure_dynamics"] +
            random.gauss(0.0, 0.03)
        )

        agency_score = max(0.0, min(1.0, agency_score))
        high_alignment = int(agency_score >= 0.65)

        records.append({
            "observation_id": observation_id,
            "participant_id": person["participant_id"],
            "period": period,
            "moral_judgment": round(moral_judgment, 3),
            "moral_emotion": round(moral_emotion, 3),
            "agency_score": round(agency_score, 3),
            "moral_perception": round(person["moral_perception"], 3),
            "moral_identity": round(person["moral_identity"], 3),
            "self_regulation": round(person["self_regulation"], 3),
            "reparative_orientation": round(person["reparative_orientation"], 3),
            "failure_dynamics": round(person["failure_dynamics"], 3),
            "high_moral_agency": high_alignment,
        })

        cost_level = random.uniform(0.0, 1.0)
        recipient_distance = random.uniform(0.0, 1.0)
        helping_probability = max(
            0.0,
            min(
                1.0,
                agency_score + 0.20 * person["reparative_orientation"] - 0.25 * cost_level - 0.15 * recipient_distance
            )
        )
        observed_helping = int(random.random() < helping_probability)

        actions.append({
            "action_id": action_id,
            "participant_id": person["participant_id"],
            "period": period,
            "action_type": random.choice(["helping", "sharing", "repair", "restraint", "accountability"]),
            "cost_level": round(cost_level, 3),
            "recipient_distance": round(recipient_distance, 3),
            "observed_helping": observed_helping,
            "reparative_action": int(observed_helping and person["reparative_orientation"] > 0.55),
        })

        person["moral_identity"] = max(
            0.0,
            min(1.0, person["moral_identity"] + 0.02 * (agency_score - 0.4))
        )
        person["self_regulation"] = max(
            0.0,
            min(1.0, person["self_regulation"] + 0.02 * (agency_score - 0.4))
        )
        person["reparative_orientation"] = max(
            0.0,
            min(1.0, person["reparative_orientation"] + 0.02 * (agency_score - 0.4))
        )
        person["failure_dynamics"] = max(
            0.0,
            min(1.0, person["failure_dynamics"] - 0.01 * agency_score)
        )

        observation_id += 1
        action_id += 1

processed = Path(__file__).resolve().parents[1] / "data" / "processed"
processed.mkdir(parents=True, exist_ok=True)

observations_path = processed / "synthetic_moral_observations.csv"
actions_path = processed / "synthetic_prosocial_actions.csv"

for path, rows in [
    (observations_path, records),
    (actions_path, actions),
]:
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=rows[0].keys())
        writer.writeheader()
        writer.writerows(rows)

print(f"Wrote {len(records)} moral observations to {observations_path}")
print(f"Wrote {len(actions)} prosocial actions to {actions_path}")
