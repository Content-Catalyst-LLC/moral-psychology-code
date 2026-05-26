-- SQLite schema for synthetic Moral Motivation and Judgment-Action Gap scaffold.
-- Educational and reproducible research scaffold only.

DROP TABLE IF EXISTS component_map;
DROP TABLE IF EXISTS scenario_notes;
DROP TABLE IF EXISTS risk_factors;

CREATE TABLE component_map (
    component TEXT NOT NULL,
    variable TEXT NOT NULL PRIMARY KEY,
    description TEXT NOT NULL,
    interpretive_warning TEXT NOT NULL
);

CREATE TABLE scenario_notes (
    scenario TEXT PRIMARY KEY,
    description TEXT NOT NULL,
    expected_pattern TEXT NOT NULL
);

CREATE TABLE risk_factors (
    risk_factor TEXT PRIMARY KEY,
    mechanism TEXT NOT NULL,
    possible_dampener TEXT NOT NULL
);

INSERT INTO component_map VALUES
('case', 'case_id', 'Synthetic case identifier', 'Not real personal data'),
('judgment', 'moral_judgment', 'Synthetic moral judgment strength', 'Not a real moral reasoning assessment'),
('emotion', 'emotional_activation', 'Synthetic emotional force such as guilt compassion anger shame or elevation', 'Not a clinical or affective assessment'),
('identity', 'moral_identity', 'Synthetic centrality of moral commitments to self-concept', 'Not a moral identity assessment'),
('regulation', 'self_regulation', 'Synthetic capacity to sustain commitment under pressure', 'Not a psychological assessment'),
('pressure', 'situational_pressure', 'Synthetic contextual force against moral action', 'Not a real institutional audit'),
('rationalization', 'rationalization_tendency', 'Synthetic tendency to redescribe or excuse moral failure', 'Not a clinical or character assessment'),
('action', 'moral_action_probability', 'Synthetic probability of moral action', 'Not a prediction of real conduct'),
('action', 'moral_action', 'Synthetic binary moral action indicator', 'Not real behavior'),
('gap', 'judgment_action_gap', 'Synthetic gap between moral judgment and action', 'Not a real moral-worth measure'),
('repair', 'guilt_recognition', 'Synthetic recognition of guilt or wrongdoing', 'Not a clinical guilt measure'),
('repair', 'humility', 'Synthetic openness to correction and limits', 'Not a personality assessment'),
('repair', 'accountability', 'Synthetic answerability to truth others and consequence', 'Not a governance or legal audit'),
('repair', 'defensiveness', 'Synthetic self-protective resistance to evidence or correction', 'Not a diagnosis'),
('repair', 'repair_capacity', 'Synthetic capacity for apology correction restitution and learning', 'Not a real repair assessment'),
('case_type', 'high_judgment_low_action', 'Synthetic cases with high judgment but failed action', 'Not a real-person risk classification'),
('case_type', 'large_gap_low_repair', 'Synthetic cases with large judgment-action gap and low repair capacity', 'Not a real-person risk classification');

INSERT INTO scenario_notes VALUES
('baseline', 'Average moral judgment emotion identity regulation pressure rationalization and repair factors', 'Moderate synthetic moral action probability'),
('high_judgment_low_pressure', 'High moral judgment with low situational pressure', 'Higher moral action probability'),
('high_judgment_high_pressure', 'High moral judgment with high situational pressure', 'Action may fail despite strong judgment'),
('high_emotion_high_identity', 'High emotional activation and moral identity', 'Judgment becomes more action-guiding'),
('high_regulation_high_pressure', 'High self-regulation under high pressure', 'Regulation reduces the pressure effect'),
('high_rationalization_high_pressure', 'High rationalization under high pressure', 'Higher judgment-action gap and lower action'),
('high_guilt_humility_accountability', 'High guilt recognition humility and accountability', 'Higher repair capacity'),
('high_judgment_low_action', 'High judgment but failed action under pressure rationalization or weak regulation', 'Illustrates judgment-action gap'),
('large_gap_low_repair', 'Large gap with high defensiveness and weak accountability', 'Illustrates failure after failure'),
('supportive_institution', 'Institution protects voice repair and ethical follow-through', 'Motivation becomes more likely to become action');

INSERT INTO risk_factors VALUES
('judgment_reductionism', 'Morality is reduced to what people endorse verbally', 'Study motivation action follow-through and repair'),
('verbal_endorsement_bias', 'Moral talk is mistaken for moral reliability', 'Test conduct under cost ambiguity and pressure'),
('situational_pressure', 'Social or institutional pressure blocks action', 'Protect dissent clarify responsibility and reduce retaliation risk'),
('rationalization_drift', 'The self redescribes failure as acceptable', 'Use motive checks affected-person perspective and accountability'),
('emotion_misdirection', 'Emotion motivates action but in distorted or disproportionate ways', 'Interpret and regulate guilt shame anger compassion and disgust'),
('identity_defensiveness', 'Moral self-image protects itself against evidence of failure', 'Build humility and repair identity'),
('moral_licensing', 'Past good conduct licenses present laxity', 'Reject moral credit logic and evaluate present responsibility'),
('fatigue_erosion', 'Depletion weakens action despite judgment', 'Protect rest workload pacing and decision bandwidth'),
('institutional_hypocrisy', 'Institutions state values while rewarding contrary behavior', 'Align incentives metrics and accountability with stated values'),
('repair_avoidance', 'Shame or fear blocks apology correction and restitution', 'Use concrete repair routines and follow-through mechanisms');
