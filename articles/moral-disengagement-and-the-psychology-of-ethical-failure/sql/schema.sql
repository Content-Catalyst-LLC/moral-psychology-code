-- SQLite schema for synthetic Moral Disengagement and Ethical Failure scaffold.
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
('justification', 'moral_justification', 'Synthetic moral justification or higher-purpose reframing', 'Not a real ethical assessment'),
('language', 'euphemistic_language', 'Synthetic use of sanitized or distancing moral language', 'Not a language audit result'),
('comparison', 'advantageous_comparison', 'Synthetic comparison with worse conduct or alternatives', 'Not a real comparative harm assessment'),
('responsibility', 'responsibility_shifting', 'Synthetic displacement or diffusion of responsibility', 'Not a real accountability finding'),
('consequence', 'consequence_distortion', 'Synthetic minimization or distortion of consequences', 'Not a real harm assessment'),
('dehumanization', 'dehumanization', 'Synthetic dehumanization or reduction of perceived moral standing', 'Not a real person or group assessment'),
('victim_blame', 'victim_blaming', 'Synthetic blaming of harmed persons or groups', 'Not a legal or psychological assessment'),
('guilt', 'anticipated_guilt', 'Synthetic anticipated guilt or self-sanction', 'Not a psychological diagnosis'),
('pressure', 'institutional_pressure', 'Synthetic situational or organizational pressure', 'Not an institutional audit'),
('visibility', 'consequence_visibility', 'Synthetic visibility of human consequences', 'Not a real impact assessment'),
('recognition', 'victim_recognition', 'Synthetic recognition of harmed person dignity and standing', 'Not a measure of real testimony'),
('accountability', 'accountability_strength', 'Synthetic accountability strength', 'Not a governance audit'),
('disengagement', 'moral_disengagement', 'Synthetic moral disengagement score', 'Not a real-person moral diagnosis'),
('action', 'unethical_action_probability', 'Synthetic probability of unethical action', 'Not a prediction of real conduct'),
('risk', 'ethical_failure_risk', 'Synthetic ethical failure risk under modeled conditions', 'Not a workplace or institutional risk score');

INSERT INTO scenario_notes VALUES
('baseline', 'Average disengagement pressure guilt accountability and victim recognition', 'Moderate synthetic ethical failure risk'),
('high_disengagement_low_guilt', 'High disengagement with low anticipated guilt', 'Higher unethical action probability'),
('high_pressure_high_disengagement', 'High institutional pressure and high disengagement', 'Higher ethical failure risk'),
('high_accountability', 'Strong accountability with average disengagement', 'Lower unethical action probability'),
('high_victim_recognition', 'High victim recognition and consequence visibility', 'Lower disengagement and lower ethical failure risk'),
('euphemistic_institution', 'High euphemistic language and high responsibility shifting', 'Higher moral disengagement'),
('diffusion_of_responsibility', 'High responsibility shifting with low accountability', 'Higher ethical failure probability'),
('dehumanization_victim_blame', 'High dehumanization and victim blaming', 'Higher disengagement and failure risk');

INSERT INTO risk_factors VALUES
('moral_justification', 'Harm is framed as necessary noble protective or efficient', 'Proportionality review and affected-person impact review'),
('euphemistic_language', 'Harm is sanitized through technical or bureaucratic language', 'Plain-language moral description'),
('advantageous_comparison', 'Wrongdoing is minimized by comparison with worse conduct', 'Direct moral evaluation of the act itself'),
('responsibility_displacement', 'Agency is shifted onto orders leaders policy or necessity', 'Role-specific accountability mapping'),
('responsibility_diffusion', 'Many actors share the process so no one feels answerable', 'End-to-end ownership and responsibility mapping'),
('consequence_distortion', 'Human harm is hidden delayed minimized or abstracted', 'Human impact tracking and testimony'),
('dehumanization', 'Targets are treated as less worthy of full moral regard', 'Humanizing testimony and equal standing safeguards'),
('victim_blaming', 'Harm is reframed as the victim''s fault or deserved consequence', 'Responsibility restoration and power-aware analysis');
