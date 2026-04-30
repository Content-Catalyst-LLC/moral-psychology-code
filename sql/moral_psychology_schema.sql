-- Root schema for moral psychology, moral agency, prosociality,
-- moral identity, vignette studies, and failure-dynamics data.
-- Educational only. Not a clinical, legal, or automated moral-judgment tool.

CREATE TABLE IF NOT EXISTS participants (
    participant_id TEXT PRIMARY KEY,
    context_label TEXT,
    age_band TEXT,
    culture_context TEXT,
    notes TEXT
);

CREATE TABLE IF NOT EXISTS moral_observations (
    observation_id INTEGER PRIMARY KEY,
    participant_id TEXT NOT NULL,
    period INTEGER NOT NULL,
    moral_perception REAL,
    moral_judgment REAL,
    moral_emotion REAL,
    moral_identity REAL,
    self_regulation REAL,
    reparative_orientation REAL,
    failure_dynamics REAL,
    moral_agency REAL,
    high_alignment INTEGER,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS moral_vignettes (
    vignette_id TEXT PRIMARY KEY,
    vignette_domain TEXT,
    harm_level REAL,
    fairness_level REAL,
    responsibility_ambiguity REAL,
    group_identity_salience REAL,
    description TEXT
);

CREATE TABLE IF NOT EXISTS vignette_responses (
    response_id INTEGER PRIMARY KEY,
    participant_id TEXT NOT NULL,
    vignette_id TEXT NOT NULL,
    wrongness_rating REAL,
    blame_rating REAL,
    punishment_rating REAL,
    empathy_rating REAL,
    forgiveness_rating REAL,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS prosocial_actions (
    action_id INTEGER PRIMARY KEY,
    participant_id TEXT NOT NULL,
    period INTEGER,
    action_type TEXT,
    cost_level REAL,
    recipient_distance REAL,
    observed_helping INTEGER,
    reparative_action INTEGER,
    notes TEXT
);
