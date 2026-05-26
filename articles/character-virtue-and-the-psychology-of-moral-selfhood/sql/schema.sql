-- SQLite schema for synthetic Character, Virtue, and Moral Selfhood scaffold.
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
('trait', 'trait_disposition', 'Synthetic trait-like moral disposition', 'Not a personality assessment'),
('habit', 'habituated_practice', 'Synthetic practiced moral habit strength', 'Not a real habit assessment'),
('identity', 'identity_integration', 'Synthetic integration of moral commitments into selfhood', 'Not a moral identity assessment'),
('self_regulation', 'self_regulation', 'Synthetic capacity to sustain commitment under pressure', 'Not a psychological assessment'),
('accountability', 'accountability', 'Synthetic answerability to truth others consequence and correction', 'Not a real accountability audit'),
('repair', 'repair_capacity', 'Synthetic ability to apologize correct restore and learn from failure', 'Not a clinical or legal measure'),
('pressure', 'situational_pressure', 'Synthetic contextual pressure against virtuous action', 'Not a real situational audit'),
('support', 'institutional_support', 'Synthetic institutional support for ethical action', 'Not a workplace or school assessment'),
('character', 'character_strength', 'Synthetic character strength profile', 'Not a real virtue or moral worth score'),
('selfhood', 'moral_selfhood_profile', 'Synthetic moral selfhood profile', 'Not a real moral selfhood score'),
('action', 'virtuous_action_probability', 'Synthetic probability of virtuous action', 'Not a prediction of real conduct'),
('case_type', 'high_character_low_action', 'Synthetic cases with high character but low action under pressure', 'Not a real-person risk classification');

INSERT INTO scenario_notes VALUES
('baseline', 'Average trait habit identity regulation accountability repair pressure and institutional support', 'Moderate synthetic virtuous action probability'),
('high_character_low_pressure', 'High character strength with low situational pressure', 'Higher virtuous action probability'),
('high_character_high_pressure', 'High character strength with high situational pressure', 'Character supports action but pressure may suppress expression'),
('high_selfhood_high_repair', 'High moral selfhood profile and repair capacity', 'Higher action and recovery orientation'),
('low_identity_high_habit', 'Strong habit but weak identity integration', 'Action may occur but selfhood integration is weaker'),
('high_identity_low_repair', 'Strong identity but low repair capacity', 'Moral selfhood may become defensive without repair'),
('supportive_institution', 'High institutional support and accountability', 'Higher virtuous action probability'),
('high_character_low_action', 'High character but high pressure and weak support', 'Illustrates virtue fragility and the need for institutional support');

INSERT INTO risk_factors VALUES
('trait_essentialism', 'Character is treated as a fixed essence rather than a patterned process', 'Use longitudinal situation-sensitive models'),
('virtue_branding', 'Virtue language becomes image management rather than accountable conduct', 'Require evidence repair and affected-person testimony'),
('moral_overconfidence', 'People assume values will survive pressure without practice', 'Use rehearsed commitments and failure-point reflection'),
('identity_defensiveness', 'Moral identity protects self-image from correction', 'Build humility apology and feedback practices'),
('repair_failure', 'Apology or regret fails to become restitution or changed conduct', 'Define repair obligations and follow-through measures'),
('institutional_corrosion', 'Systems reward performance over integrity', 'Align incentives with truth care justice and accountability'),
('situation_blindness', 'Contextual pressure is ignored when judging character', 'Map roles incentives authority and constraints'),
('self_righteousness', 'Claimed virtue becomes superiority or exclusion', 'Test virtue through outgroup concern and power awareness'),
('accountability_gap', 'Responsibility disappears into process or hierarchy', 'Use role mapping consequence tracking and escalation channels');
