-- SQLite schema for synthetic Moral Psychology in Organizations and Institutions scaffold.
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
('ethical_sensitivity', 'ethical_sensitivity', 'Capacity to notice morally relevant features of a decision', 'Not a real-person moral score'),
('role_constraint', 'role_constraint', 'Degree to which formal duties narrow perceived responsibility', 'Role constraint is contextual not a trait defect'),
('culture', 'cultural_climate', 'Norms around candor fairness care retaliation and integrity', 'Culture must be interpreted institutionally'),
('pressure', 'performance_pressure', 'Pressure to meet targets or satisfy metrics', 'Pressure can be produced by leadership incentives or markets'),
('hierarchy', 'hierarchy_intensity', 'Strength of authority gradients and command structure', 'Hierarchy can coordinate or suppress ethical concern'),
('diffusion', 'diffusion_responsibility', 'Spread of responsibility across roles systems departments or committees', 'Diffusion does not eliminate responsibility'),
('accountability', 'accountability_strength', 'Clarity enforceability and fairness of responsibility systems', 'Accountability must track power as well as role'),
('voice', 'speak_up_protection', 'Protection for dissent reporting and ethical warning', 'Voice must be credible and protected to matter'),
('alignment', 'value_alignment', 'Alignment between stated mission and actual incentives', 'Values are weak if incentives contradict them'),
('corruption', 'corruption_pressure', 'Pressure that redirects purpose toward capture self-protection or narrow gain', 'Corruption can be systemic rather than only personal'),
('risk', 'unethical_probability', 'Synthetic probability of unethical action under modeled conditions', 'Not a real employee risk score'),
('integrity', 'institutional_integrity', 'Synthetic institutional integrity score', 'Not an audit finding or certification');

INSERT INTO scenario_notes VALUES
('baseline', 'Average pressure hierarchy diffusion accountability and culture', 'Moderate synthetic ethical risk'),
('high_pressure', 'High performance pressure with average accountability', 'Higher synthetic unethical-action probability'),
('low_accountability', 'Low accountability strength with average pressure', 'Higher ethical risk and lower integrity'),
('high_diffusion', 'High diffusion of responsibility with average accountability', 'Higher many-hands pressure'),
('high_speak_up', 'High speak-up protection and value alignment', 'Lower synthetic ethical risk and higher integrity'),
('combined_escalation', 'High pressure high hierarchy high diffusion low accountability low culture', 'Highest synthetic ethical risk'),
('integrity_repair', 'High accountability high voice high value alignment low corruption', 'Higher synthetic institutional integrity');

INSERT INTO risk_factors VALUES
('ethical_fading', 'Ethical dimensions recede behind performance compliance or loyalty frames', 'Ethical pause points and stakeholder review'),
('bounded_ethicality', 'People preserve decent self-image while acting under distorted frames', 'Decision audits and bias-aware reflection'),
('diffusion_of_responsibility', 'Many actors each do a small part of harmful process', 'Named decision ownership and audit trails'),
('hierarchical_silence', 'Authority gradients suppress dissent', 'Protected voice and leadership response norms'),
('metric_fixation', 'Targets replace moral purpose', 'Value-aligned metrics and qualitative consequence review'),
('purpose_drift', 'Institution moves away from legitimating mission', 'Mission-integrity review and public accountability'),
('bureaucratic_distance', 'Human consequences become files cases or dashboards', 'Stakeholder contact and consequence visibility'),
('corruption_pressure', 'Power or incentives redirect institution toward self-protection or capture', 'Independent oversight and transparency');
