-- SQLite schema for synthetic Social Identity, Group Life, and Moral Polarization scaffold.
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
('identity', 'group', 'Synthetic group label', 'Do not interpret synthetic groups as real political or social populations'),
('values', 'value_profile', 'Synthetic individual value profile', 'Values alone do not explain moral polarization'),
('identity', 'identity_strength', 'Synthetic strength of social or group identity', 'Identity is contextual and not a pathology'),
('norms', 'norm_pressure', 'Synthetic group norm pressure', 'Norm pressure can sustain solidarity or suppress dissent'),
('threat', 'threat_perception', 'Synthetic perceived outgroup or identity threat', 'Threat perception may be real distorted or amplified'),
('trust', 'institutional_trust', 'Synthetic trust in shared institutions or procedures', 'Trust depends on legitimacy accountability and history'),
('contact', 'cross_group_contact', 'Synthetic cross-group recognition or contact', 'Contact quality matters more than contact quantity'),
('rhetoric', 'dehumanizing_rhetoric', 'Synthetic exposure to dehumanizing or exclusionary rhetoric', 'Not a diagnostic or real-content classification'),
('loyalty', 'loyalty_pressure', 'Synthetic pressure to publicly align with group norms', 'Loyalty can support care or punish moral independence'),
('judgment', 'moral_judgment', 'Synthetic group-conditioned moral judgment score', 'Not a real person moral judgment score'),
('exclusion', 'moral_exclusion_risk', 'Synthetic moral exclusion risk value', 'Not a real-person or group assessment'),
('polarization', 'polarization_distance', 'Distance between average group moral judgments', 'Simplified analytic indicator only');

INSERT INTO scenario_notes VALUES
('baseline', 'Average identity norm pressure threat trust and contact', 'Moderate synthetic divergence'),
('high_identity', 'High group identity strength with average threat', 'Higher group-conditioned moral judgment'),
('high_threat', 'High threat perception with average identity', 'Higher divergence and moral exclusion risk'),
('low_trust', 'Low institutional trust with average identity and threat', 'Lower dampening of polarization'),
('high_contact', 'High cross-group contact and institutional trust', 'Lower moral exclusion risk'),
('high_dehumanization', 'High dehumanizing rhetoric and loyalty pressure', 'Higher moral exclusion risk'),
('combined_escalation', 'High identity high threat high norms low trust low contact high dehumanization', 'Highest synthetic polarization and exclusion risk');

INSERT INTO risk_factors VALUES
('ingroup_favoritism', 'Ingroup actions receive more charity and context', 'Accountability norms and cross-group perspective-taking'),
('outgroup_moral_distance', 'Outgroup suffering and motives become less vivid', 'Civic recognition and humanizing contact'),
('identity_threat', 'Criticism is experienced as attack on the group', 'Non-humiliating correction and legitimacy-preserving dialogue'),
('norm_conformity', 'Members fear dissent will signal betrayal', 'Protected internal disagreement and plural group norms'),
('partisan_bias', 'Principles are applied unevenly across group lines', 'Consistent standards and transparent evidence rules'),
('media_amplification', 'Extreme examples become representative symbols', 'Representative sampling and context restoration'),
('dehumanization', 'Opponents are treated as less worthy of concern', 'Dignity norms rights protection and anti-harassment standards'),
('institutional_distrust', 'Shared procedures lose legitimacy', 'Accountable inclusive and transparent institutions');
