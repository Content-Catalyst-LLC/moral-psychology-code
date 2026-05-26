-- SQLite schema for synthetic Justice, Fairness, and Distributive Moral Judgment scaffold.
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
('equality', 'equality_weight', 'Synthetic concern for equal shares equal standing or baseline entitlement', 'Not a real-person justice preference score'),
('equity', 'equity_weight', 'Synthetic concern for contribution effort productivity or proportionality', 'Contribution depends on opportunity context and hidden labor'),
('need', 'need_weight', 'Synthetic concern for vulnerability deprivation or urgency', 'Need judgments are vulnerable to stigma and deservingness narratives'),
('desert', 'desert_weight', 'Synthetic concern for responsibility merit conduct or deserved reward', 'Desert can obscure luck inherited advantage and structural constraint'),
('priority', 'priority_worse_off', 'Synthetic concern for priority to the worse off', 'Not a policy recommendation'),
('bias', 'self_interest_bias', 'Synthetic self-interest bias in distributive judgment', 'Not a moral diagnosis'),
('procedure', 'procedural_trust', 'Synthetic trust in distributive procedure or institutional legitimacy', 'Not an institutional audit'),
('group', 'group_distance', 'Synthetic social distance from recipient or affected group', 'Not a real group-attitude measure'),
('repair', 'historical_repair_salience', 'Synthetic salience of historical repair or inherited injustice', 'Historical claims require real evidence and context'),
('judgment', 'distributive_judgment', 'Synthetic distributive moral judgment score', 'Not a real policy or person score'),
('support', 'support_fair_allocation', 'Synthetic support indicator for modeled fair allocation', 'Not a prediction of real public opinion'),
('inequity', 'inequity_aversion', 'Synthetic inequity-aversion score', 'Not a psychological assessment');

INSERT INTO scenario_notes VALUES
('baseline', 'Average fairness principle weights bias trust group distance and repair salience', 'Moderate synthetic distributive judgment'),
('high_need_low_bias', 'High need weight with low self-interest bias', 'Higher support for fair allocation'),
('high_need_high_bias', 'High need weight with high self-interest bias', 'Need concern may be suppressed by bias'),
('high_priority_worse_off', 'High priority to the worse off', 'Higher distributive judgment when deprivation is salient'),
('high_group_distance', 'High social distance from recipients', 'Lower distributive support'),
('high_procedural_trust', 'High trust in procedure', 'Higher legitimacy and support'),
('historical_repair_salient', 'High historical repair salience', 'Higher support when present distribution is tied to past injustice'),
('meritocracy_pressure', 'High equity and desert with low repair salience', 'Greater emphasis on contribution and deserved reward');

INSERT INTO risk_factors VALUES
('self_interest_bias', 'Personal advantage distorts fairness judgment', 'Veil-of-ignorance reasoning and stakeholder rotation'),
('status_quo_bias', 'Existing distributions are treated as natural or deserved', 'Historical and institutional production analysis'),
('deservingness_stigma', 'Need is filtered through moralized judgments of recipients', 'Separate need vulnerability agency and structural constraint'),
('meritocracy_blindness', 'Visible success is mistaken for pure merit', 'Analyze starting points opportunity and inherited advantage'),
('group_distance', 'Recipients outside the ingroup are judged less deserving', 'Perspective taking and consistent standards across groups'),
('procedural_masking', 'Fair-looking procedures hide unequal access or unequal burden', 'Audit procedure outcomes appeal access and affected testimony'),
('repair_erasure', 'Historical injustice is excluded from present distributive judgment', 'Document historical continuity and repair claims'),
('principle_shifting', 'Fairness principles are selected opportunistically', 'Require explicit principle selection and consistency checks');
