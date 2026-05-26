-- SQLite schema for synthetic Moral Psychology, Propaganda, and Political Polarization scaffold.
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
('group', 'group', 'Synthetic political or moral community label', 'Do not treat synthetic groups as real political populations'),
('values', 'value_profile', 'Synthetic value orientation', 'Values alone do not explain polarization'),
('trust', 'trust_allocation', 'Allocation of credibility across sources', 'Trust is shaped by institutions identity and history'),
('identity', 'identity_salience', 'Strength of political or group identity salience', 'Identity can shape how evidence is received'),
('propaganda', 'propaganda_exposure', 'Repeated strategic communication exposure', 'Exposure is not identical to belief or persuasion'),
('threat', 'threat_perception', 'Perceived danger betrayal or moral threat', 'Threat can compress complexity and intensify exclusion'),
('outrage', 'outrage_amplification', 'Amplified anger disgust contempt or humiliation', 'Outrage can signal injustice or be manipulated'),
('democratic_trust', 'democratic_trust', 'Confidence in shared institutions evidence and process', 'Trust can dampen polarization when institutions are legitimate'),
('cross_group_contact', 'cross_group_contact', 'Meaningful contact or recognition across groups', 'Contact must be high-quality to reduce hostility'),
('moral_exclusion', 'moral_exclusion_risk', 'Synthetic risk of excluding opponents from moral concern', 'Not a diagnostic score for real persons');

INSERT INTO scenario_notes VALUES
('baseline', 'Average propaganda threat and democratic trust', 'Moderate synthetic judgment divergence'),
('high_propaganda', 'High propaganda exposure with average trust', 'Increased moral-political judgment divergence'),
('high_threat', 'High threat perception with average propaganda', 'Increased moral exclusion risk'),
('low_democratic_trust', 'Low democratic trust with average exposure', 'Reduced dampening of polarization'),
('high_contact', 'High cross-group contact and democratic trust', 'Lower moral exclusion risk in the synthetic model'),
('combined_escalation', 'High propaganda high threat high outrage low democratic trust', 'Highest synthetic exclusion and divergence risk');

INSERT INTO risk_factors VALUES
('enemy_framing', 'Turns opponents into moral threats', 'Legitimate opposition norms and institutional restraint'),
('dehumanizing_language', 'Weakens empathy and moral concern', 'Civic recognition and rights-protecting institutions'),
('selective_exposure', 'Reinforces identity-confirming narratives', 'Diverse information environments and media literacy'),
('outrage_amplification', 'Rewards emotional escalation', 'Slow deliberation and context restoration'),
('epistemic_fragmentation', 'Breaks shared standards of trust', 'Transparent accountable institutions'),
('moral_exclusion', 'Removes groups from the circle of legitimate concern', 'Cross-group contact and equal dignity norms');
