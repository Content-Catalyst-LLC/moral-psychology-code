-- SQLite schema for synthetic Moral Identity and Moral Agency scaffold.
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
('identity', 'internalization', 'Synthetic private centrality of moral traits to self-concept', 'Not a moral identity assessment'),
('identity', 'symbolization', 'Synthetic public expression of moral identity', 'Not a real virtue or display measure'),
('identity', 'narrative_integration', 'Synthetic integration of moral episodes into self-story', 'Not a clinical or psychological assessment'),
('identity', 'norm_integration', 'Synthetic integration of moral norms into self-concept', 'Not a real norm-internalization score'),
('judgment', 'moral_judgment', 'Synthetic moral judgment strength', 'Not a real moral reasoning assessment'),
('regulation', 'self_regulatory_capacity', 'Synthetic capacity to sustain commitment under pressure', 'Not a psychological assessment'),
('pressure', 'situational_pressure', 'Synthetic contextual pressure against moral action', 'Not a real situational audit'),
('identity', 'moral_identity', 'Synthetic moral identity strength', 'Not a real moral worth score'),
('action', 'moral_action_probability', 'Synthetic probability of moral action', 'Not a prediction of real conduct'),
('action', 'moral_action', 'Synthetic binary moral action indicator', 'Not real behavior'),
('repair', 'guilt_recognition', 'Synthetic recognition of guilt or wrongdoing', 'Not a clinical guilt measure'),
('repair', 'humility', 'Synthetic openness to correction and limits', 'Not a personality assessment'),
('repair', 'accountability', 'Synthetic answerability to truth others and consequence', 'Not a governance or legal audit'),
('repair', 'defensiveness', 'Synthetic self-protective resistance to evidence or correction', 'Not a diagnosis'),
('repair', 'repair_capacity', 'Synthetic capacity for apology correction restitution and learning', 'Not a real repair assessment'),
('case_type', 'high_identity_low_action', 'Synthetic cases with high identity but low action under pressure', 'Not a real-person risk classification'),
('case_type', 'high_identity_low_repair', 'Synthetic cases with high identity but low repair capacity', 'Not a real-person risk classification');

INSERT INTO scenario_notes VALUES
('baseline', 'Average internalization symbolization narrative norm judgment regulation pressure and repair factors', 'Moderate synthetic moral action probability'),
('high_internalization_low_pressure', 'High internalization with low situational pressure', 'Higher moral action probability'),
('high_internalization_high_pressure', 'High internalization with high situational pressure', 'Identity supports action but pressure may suppress conduct'),
('high_symbolization_public_action', 'High symbolization under visible moral opportunity', 'More public moral expression'),
('high_identity_low_audience', 'High internalization with low audience visibility', 'Internalized identity supports unseen moral action'),
('high_identity_high_defensiveness', 'High moral identity with high defensiveness', 'Identity may protect self-image and reduce repair'),
('high_humility_high_accountability', 'High humility and accountability with guilt recognition', 'Higher repair capacity'),
('high_identity_low_action', 'High moral identity under high pressure weak regulation or low judgment clarity', 'Illustrates identity-action gap'),
('high_identity_low_repair', 'High moral identity with high defensiveness and weak humility', 'Illustrates moralized selfhood risk'),
('supportive_institution', 'Institution rewards integrity truth-telling and repair', 'Identity becomes more action-guiding and accountable');

INSERT INTO risk_factors VALUES
('moral_identity_reductionism', 'Moral identity is treated as a single virtue score', 'Distinguish internalization symbolization narrative integration action and repair'),
('symbolization_performance', 'Public moral display replaces concrete responsibility', 'Test low-visibility action and recipient-centered conduct'),
('identity_defensiveness', 'Moral self-image resists evidence of wrongdoing', 'Build humility accountability and repair practices'),
('moral_licensing', 'Prior good conduct excuses present harm', 'Evaluate each action by consequence responsibility and repair'),
('group_righteousness', 'Collective identity protects a moral narrative over truth', 'Protect dissent public memory and affected-person testimony'),
('role_moral_blindness', 'Professional or institutional role identity excuses harm', 'Keep role morality answerable to broader ethical standards'),
('shame_collapse', 'Failure becomes self-annihilation rather than responsibility', 'Convert guilt into accountable action and repair'),
('identity_action_gap', 'Strong moral identity fails under pressure or weak regulation', 'Use self-regulation practice role clarity and accountability supports'),
('exclusionary_identity', 'Moral identity is built through contempt for outsiders', 'Test identity through outgroup dignity and power awareness'),
('institutional_hypocrisy', 'Institutions display values while rewarding contrary conduct', 'Align incentives workload recognition and accountability with integrity');
