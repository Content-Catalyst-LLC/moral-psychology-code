-- SQLite schema for synthetic Responsibility, Blame, and Moral Accountability scaffold.
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
('control', 'control', 'Synthetic relevant control capacity or opportunity to act', 'Not a real measure of agency or legal control'),
('knowledge', 'knowledge', 'Synthetic knowledge foresight or epistemic position', 'Not a real epistemic assessment'),
('role', 'role_duty', 'Synthetic role duty office obligation or professional responsibility', 'Role duty depends on real institutional context'),
('wrongness', 'wrongness_severity', 'Synthetic severity of wrongdoing or norm violation', 'Not a real case severity score'),
('motive', 'motive_malice', 'Synthetic malice negligence or culpable motive indicator', 'Not a psychological diagnosis'),
('excuse', 'mitigating_excuse', 'Synthetic mitigating excuse duress or constraint', 'Not a legal mitigation assessment'),
('institution', 'institutional_structure', 'Synthetic quality of institutional structure reporting and oversight', 'Not an institutional audit'),
('recognition', 'victim_recognition', 'Synthetic recognition of harmed person or group standing', 'Recognition must be grounded in real agency and testimony'),
('repair', 'repair_capacity', 'Synthetic capacity for repair restitution or changed conduct', 'Not a real repair plan'),
('prevention', 'prevention_capacity', 'Synthetic capacity to prevent recurrence', 'Not a safety certification'),
('responsibility', 'responsibility', 'Synthetic responsibility score', 'Not a real-person responsibility assessment'),
('blame', 'blame_probability', 'Synthetic probability of blame assignment', 'Not a blame recommendation'),
('accountability', 'accountability_score', 'Synthetic accountability score', 'Not an accountability decision tool'),
('quality', 'accountability_quality', 'Synthetic accountability-quality score', 'Not an evaluation of real justice or repair');

INSERT INTO scenario_notes VALUES
('baseline', 'Average control knowledge role duty wrongness motive excuse and institutional structure', 'Moderate synthetic responsibility blame and accountability'),
('high_control_high_knowledge', 'High control and high knowledge', 'Higher responsibility and blame probability'),
('high_excuse', 'High mitigating excuse', 'Lower blame probability without necessarily eliminating accountability'),
('high_role_duty', 'High role duty with moderate knowledge and control', 'Higher responsibility and accountability'),
('willful_ignorance', 'Low knowledge with high duty to know and high role responsibility', 'Higher accountability despite claimed ignorance'),
('institutional_failure', 'Weak institutional structure with high wrongness and low prevention', 'Lower accountability quality and higher repair need'),
('high_accountability_low_blame', 'High repair and prevention need with mitigating excuse', 'Accountability remains even where blame is reduced'),
('repair_oriented_accountability', 'High victim recognition repair capacity prevention capacity and institutional structure', 'Higher accountability quality');

INSERT INTO risk_factors VALUES
('causal_overreach', 'Causal involvement is mistaken for full moral responsibility', 'Separate causation control knowledge role duty and blame'),
('blame_collapse', 'Responsibility blame and accountability are treated as one concept', 'Use layered responsibility-blame-accountability analysis'),
('scapegoating', 'One actor absorbs blame while systemic conditions remain untouched', 'Pair individual accountability with structural investigation'),
('responsibility_diffusion', 'Distributed systems make serious harm appear ownerless', 'Map role-weighted responsibility and decision authority'),
('willful_ignorance', 'Actors avoid knowledge to preserve deniability', 'Duty-to-know standards reporting obligations and documentation'),
('selective_blame', 'Powerless actors are blamed while powerful actors are protected', 'Transparent standards and oversight'),
('procedural_evasion', 'Institutions equate process compliance with accountability', 'Measure truth repair prevention and public answerability'),
('repair_avoidance', 'Sanction substitutes for restitution reform or prevention', 'Connect accountability to repair capacity and prevention capacity');
