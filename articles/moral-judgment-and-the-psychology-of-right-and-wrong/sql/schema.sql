-- SQLite schema for synthetic Moral Judgment scaffold.
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
('judgment', 'perceived_harm', 'Synthetic recognition of injury suffering degradation burden or loss', 'Not a real harm assessment'),
('judgment', 'norm_violation', 'Synthetic perceived violation of a duty rule standard or expectation', 'Not a real norm assessment'),
('judgment', 'inferred_intention', 'Synthetic judgment about motive purpose foresight or negligence', 'Not a real intention assessment'),
('judgment', 'emotional_activation', 'Synthetic affective intensity shaping salience and condemnation', 'Not a real emotion assessment'),
('judgment', 'ideological_framing', 'Synthetic cultural ideological or political interpretation', 'Not a real ideology assessment'),
('judgment', 'group_framing', 'Synthetic group-based interpretive frame', 'Not a real group-identity measure'),
('judgment', 'social_pressure', 'Synthetic pressure from audience group norm platform or public context', 'Not a real social-pressure measure'),
('judgment', 'situational_ambiguity', 'Synthetic uncertainty role conflict or contextual complexity', 'Not a real ambiguity score'),
('wrongness', 'latent_wrongness', 'Synthetic latent wrongness severity', 'Not a real moral truth score'),
('wrongness', 'wrongness_rating', 'Synthetic wrongness rating from 1 to 7', 'Not a real assessment of conduct'),
('wrongness', 'judged_wrong', 'Synthetic binary classification of wrongness', 'Not a real judgment classifier'),
('blame', 'perceived_agency', 'Synthetic perceived control knowledge capacity and alternatives', 'Not a real agency assessment'),
('blame', 'repair_opportunity', 'Synthetic availability of apology restitution excuse correction or repair', 'Not a real repair assessment'),
('blame', 'latent_blame', 'Synthetic latent blame severity', 'Not a real blame score'),
('blame', 'blame_rating', 'Synthetic blame rating from 1 to 7', 'Not a real moral-worth score'),
('response', 'dignity_preservation', 'Synthetic dignity-preserving response condition', 'Not a real dignity assessment'),
('response', 'punitive_pressure', 'Synthetic pressure toward punishment humiliation or sanction', 'Not a real risk assessment'),
('response', 'institutional_support', 'Synthetic support for reporting repair protection or accountability', 'Not an institutional audit'),
('response', 'constructive_response_score', 'Synthetic constructive response score', 'Not a real behavior prediction'),
('response', 'constructive_response', 'Synthetic binary constructive response indicator', 'Not a real intervention recommendation'),
('case_type', 'high_pressure_high_judgment', 'Synthetic high-pressure high-judgment case', 'Not a real-person classification'),
('case_type', 'low_repair_high_blame', 'Synthetic low-repair high-blame case', 'Not a real-person classification'),
('case_type', 'wrongness_blame_divergence', 'Synthetic wrongness-blame divergence case', 'Not a real-person classification');

INSERT INTO scenario_notes VALUES
('baseline', 'Average harm norm violation intention emotion ambiguity agency and repair', 'Moderate synthetic wrongness and blame'),
('high_harm_high_intention', 'High perceived harm and inferred intention', 'Higher wrongness and blame'),
('high_norm_violation_low_harm', 'High norm violation but low perceived harm', 'Moderate wrongness with blame depending on agency'),
('high_harm_low_intention', 'High harm but low inferred intention', 'Wrongness may remain high while blame may soften'),
('high_ambiguity', 'High situational ambiguity', 'Reduced certainty and potentially lower blame'),
('high_social_pressure', 'High audience group or public pressure', 'Stronger judgment intensity and potential punitive pressure'),
('high_repair_opportunity', 'High repair opportunity and dignity preservation', 'Higher constructive response'),
('low_repair_high_blame', 'High blame with low repair opportunity', 'Punitive pressure may rise while constructive response weakens'),
('wrongness_blame_divergence', 'Wrongness and blame diverge substantially', 'Illustrates why wrongness and blame must be separated'),
('digital_public_condemnation', 'High social pressure group framing emotion and punitive pressure', 'Judgment accelerates and may outpace context'),
('institutional_accountability', 'High institutional support repair opportunity and dignity preservation', 'Judgment can support accountability and repair');

INSERT INTO risk_factors VALUES
('wrongness_blame_collapse', 'Wrongness blame sanction and repair are treated as one undifferentiated response', 'Model each judgment layer separately'),
('intention_overconfidence', 'Observers infer motive too quickly from identity outcome or group narrative', 'Require evidence alternatives and humility around intention'),
('outcome_neglect', 'Good intentions are used to ignore actual harm', 'Model harm and repair even when intention is low'),
('punitive_overreach', 'Judgment becomes humiliation or punishment without proportion', 'Include dignity preservation repair opportunity and proportionality'),
('moral_evasion', 'Complexity or neutrality is used to avoid clear harm', 'Distinguish genuine ambiguity from avoidance'),
('selective_outage', 'Judgment is stronger for outsiders than allies', 'Compare standards across group boundaries'),
('digital_acceleration', 'Public judgment circulates before facts context or intention are clear', 'Slow judgment verify evidence and preserve dignity'),
('institutional_reputation_protection', 'Institutions frame judgment around liability and image control', 'Separate truth-seeking repair and public relations'),
('dehumanization', 'Wrongdoers or victims are treated as less than fully human', 'Preserve dignity while maintaining accountability'),
('repair_absence', 'Condemnation substitutes for material change', 'Connect judgment to apology restitution redesign protection and follow-up');
