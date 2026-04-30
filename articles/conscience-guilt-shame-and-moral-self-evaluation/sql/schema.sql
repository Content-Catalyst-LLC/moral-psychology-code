-- Article-level synthetic moral psychology schema.
-- Educational only. Not clinical, legal, or automated moral judgment.

CREATE TABLE IF NOT EXISTS moral_observations (
    observation_id INTEGER PRIMARY KEY,
    participant_id TEXT NOT NULL,
    period INTEGER NOT NULL,
    moral_judgment REAL,
    moral_emotion REAL,
    agency_score REAL,
    moral_perception REAL,
    moral_identity REAL,
    self_regulation REAL,
    reparative_orientation REAL,
    failure_dynamics REAL,
    high_moral_agency INTEGER
);

CREATE TABLE IF NOT EXISTS prosocial_actions (
    action_id INTEGER PRIMARY KEY,
    participant_id TEXT NOT NULL,
    period INTEGER NOT NULL,
    action_type TEXT,
    cost_level REAL,
    recipient_distance REAL,
    observed_helping INTEGER,
    reparative_action INTEGER
);

CREATE INDEX IF NOT EXISTS idx_moral_obs_participant
ON moral_observations(participant_id);

CREATE INDEX IF NOT EXISTS idx_moral_obs_period
ON moral_observations(period);

CREATE INDEX IF NOT EXISTS idx_prosocial_participant
ON prosocial_actions(participant_id);

CREATE INDEX IF NOT EXISTS idx_prosocial_period
ON prosocial_actions(period);
