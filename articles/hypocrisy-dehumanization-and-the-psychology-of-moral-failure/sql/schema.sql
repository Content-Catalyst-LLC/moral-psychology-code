-- SQLite schema for synthetic Hypocrisy, Dehumanization, and the Psychology of Moral Failure scaffold.
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
('judgment_other', 'judgment_other', 'Synthetic judgment strictness applied to others', 'Not a real moral judgment score'),
('judgment_self', 'judgment_self', 'Synthetic judgment strictness applied to self or ingroup', 'Not a real moral judgment score'),
('hypocrisy', 'hypocrisy', 'Synthetic asymmetry between judgment of others and judgment of self', 'Not a real-person hypocrisy diagnosis'),
('humanness', 'perceived_humanness', 'Synthetic perceived humanness or full moral standing of a target', 'Not a real dehumanization assessment'),
('dehumanization', 'dehumanization', 'Synthetic reduction in perceived moral standing', 'Not a real group or individual assessment'),
('ingroup', 'ingroup_bias', 'Synthetic ingroup favoritism or group-selective judgment', 'Not a real political or social identity measure'),
('empathy', 'empathic_recognition', 'Synthetic recognition of target suffering dignity and personhood', 'Not a psychological assessment'),
('values', 'public_value_claim', 'Synthetic strength of professed public values', 'Not an institutional audit'),
('practice', 'actual_practice_integrity', 'Synthetic integrity of lived practice compared with stated values', 'Not an institutional audit'),
('institution', 'institutional_hypocrisy', 'Synthetic gap between public values and actual practice', 'Not a real organizational evaluation'),
('accountability', 'accountability_strength', 'Synthetic accountability strength', 'Not a governance audit'),
('visibility', 'victim_visibility', 'Synthetic visibility of harmed persons or affected groups', 'Not a measure of real testimony or harm'),
('failure', 'moral_failure_probability', 'Synthetic probability of moral failure under modeled conditions', 'Not a prediction of real conduct');

INSERT INTO scenario_notes VALUES
('baseline', 'Average hypocrisy dehumanization ingroup bias empathy and accountability', 'Moderate synthetic moral failure risk'),
('high_hypocrisy', 'High double-standard asymmetry', 'Higher synthetic moral failure probability'),
('high_dehumanization', 'Low perceived moral standing or humanness', 'Higher moral failure probability'),
('high_hypocrisy_high_dehumanization', 'High double standards and high moral exclusion', 'Highest synthetic moral failure risk'),
('high_empathy', 'High empathic recognition', 'Lower moral failure probability'),
('high_accountability', 'Strong accountability and victim visibility', 'Lower moral failure probability'),
('institutional_hypocrisy_gap', 'High public values with low actual practice integrity', 'Higher institutional moral failure risk'),
('low_victim_visibility', 'Victims or harmed groups are made abstract or invisible', 'Higher risk of moral failure and ethical distance');

INSERT INTO risk_factors VALUES
('self_serving_asymmetry', 'The self receives nuance while others receive strict judgment', 'Symmetry tests and role reversal'),
('ingroup_protection', 'Allies receive context and opponents receive condemnation', 'Comparable-case analysis across group boundaries'),
('public_virtue_gap', 'Institutions perform values while avoiding costs of practice', 'Value-practice audits and public accountability'),
('dehumanizing_language', 'Persons are reduced to threats burdens pests cases metrics or problems', 'Language audits and humanizing testimony'),
('moral_exclusion', 'Some persons are placed outside full moral concern', 'Recognition practices and equal standing safeguards'),
('bureaucratic_distance', 'Harm becomes abstract through files metrics queues and categories', 'Accountability mapping and victim visibility'),
('victim_invisibility', 'Harmed persons are not seen heard counted or believed', 'Testimony protection and participatory repair'),
('selective_accountability', 'Powerful actors receive protection while others receive discipline', 'Transparent standards and independent oversight');
