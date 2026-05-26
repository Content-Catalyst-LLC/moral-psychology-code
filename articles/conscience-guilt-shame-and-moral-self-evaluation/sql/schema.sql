-- SQLite schema for synthetic Conscience, Guilt, Shame, and Moral Self-Evaluation scaffold.
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
('conscience', 'conscience_activation', 'Synthetic activation of moral self-evaluation', 'Not a conscience assessment'),
('wrongdoing', 'perceived_wrongdoing', 'Synthetic recognition that an action or omission violated a standard', 'Not a real wrongdoing determination'),
('responsibility', 'perceived_responsibility', 'Synthetic sense of answerability for action or omission', 'Not a legal or moral-responsibility assessment'),
('exposure', 'exposure_before_others', 'Synthetic visibility of failure before real or imagined observers', 'Not a social exposure measure'),
('norm', 'norm_internalization', 'Synthetic degree to which a moral norm is experienced as inwardly binding', 'Not a real norm-internalization score'),
('self', 'global_self_condemnation', 'Synthetic global negative self-appraisal', 'Not a clinical or psychological assessment'),
('agency', 'agency_capacity', 'Synthetic capacity to respond repair or change', 'Not a psychological assessment'),
('emotion', 'guilt', 'Synthetic act-focused moral self-evaluation', 'Not a guilt assessment'),
('emotion', 'shame', 'Synthetic self-focused exposure or global self-condemnation', 'Not a shame assessment'),
('emotion', 'remorse', 'Synthetic sorrowful responsibility for harm done', 'Not a remorse assessment'),
('repair', 'empathic_acknowledgment', 'Synthetic recognition of harm to another person or group', 'Not an empathy assessment'),
('repair', 'repair_pathway', 'Synthetic practical availability of confession restitution and changed conduct', 'Not a real institutional audit'),
('repair', 'repair_probability', 'Synthetic probability of repair-oriented response', 'Not a prediction of real conduct'),
('repair', 'repair_action', 'Synthetic binary repair-action indicator', 'Not real behavior'),
('avoidance', 'avoidance_probability', 'Synthetic probability of avoidance response', 'Not a prediction of real conduct'),
('avoidance', 'avoidance_action', 'Synthetic binary avoidance-action indicator', 'Not real behavior'),
('defense', 'defensiveness', 'Synthetic self-protective resistance to evidence or correction', 'Not a diagnosis'),
('case_type', 'high_shame_low_repair', 'Synthetic cases with high shame and low repair', 'Not a real-person risk classification'),
('case_type', 'high_guilt_high_repair', 'Synthetic cases with high guilt and high repair', 'Not a real-person classification');

INSERT INTO scenario_notes VALUES
('baseline', 'Average wrongdoing responsibility exposure norms agency defensiveness and repair pathway', 'Moderate synthetic conscience activation'),
('high_wrongdoing_high_responsibility', 'High perceived wrongdoing and responsibility', 'Higher guilt and stronger conscience activation'),
('high_exposure_high_self_condemnation', 'High exposure and global self-condemnation', 'Higher shame and possible avoidance'),
('high_guilt_high_agency', 'High guilt with high agency and repair pathway', 'Higher repair probability'),
('high_shame_low_agency', 'High shame with low agency and weak repair pathway', 'Higher avoidance probability'),
('high_empathy_high_repair_pathway', 'Strong empathic acknowledgment and repair pathway', 'Higher repair action probability'),
('high_defensiveness_high_shame', 'High defensiveness under shame', 'Lower repair and higher avoidance'),
('high_shame_low_repair', 'High shame with weak agency repair pathway or high defensiveness', 'Illustrates shame-heavy self-evaluation without repair'),
('high_guilt_high_repair', 'High guilt with strong empathy and repair pathway', 'Illustrates constructive moral self-evaluation'),
('institutional_shame_culture', 'Exposure is punished more than harm is repaired', 'Concealment and avoidance become more likely'),
('repair_oriented_institution', 'Truth-telling and repair are supported', 'Conscience becomes more constructive and action-guiding');

INSERT INTO risk_factors VALUES
('conscience_reductionism', 'Conscience is treated as a single inner voice', 'Model conscience as differentiated self-evaluation'),
('guilt_shame_confusion', 'Guilt and shame are collapsed into one moral pain', 'Distinguish act-focused guilt from self-focused shame'),
('global_self_condemnation', 'Wrongdoing becomes total self-condemnation', 'Separate action responsibility identity and possibility of repair'),
('scrupulosity', 'Excessive guilt or shame attaches to trivial or impossible standards', 'Use proportionality evidence trusted counsel and compassionate reality testing'),
('moral_numbness', 'Serious harm produces little self-evaluative response', 'Restore consequence visibility affected-person testimony and accountability'),
('rationalization', 'The self redescribes harm as necessary normal or deserved', 'Ask who benefits from the description and who is harmed by it'),
('institutional_shame_culture', 'Exposure is punished more than harm is repaired', 'Create fair credible repair-oriented accountability systems'),
('defensiveness', 'Threat to self-image blocks truth and repair', 'Build humility accountability and repair pathways'),
('symbolic_remorse', 'Emotion substitutes for changed conduct', 'Require restitution changed behavior and follow-through'),
('repair_pathway_absence', 'People cannot see a survivable way to repair', 'Create clear confession restitution and correction processes');
