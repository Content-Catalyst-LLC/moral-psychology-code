-- SQLite schema for synthetic Moral Self-Regulation scaffold.
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
('judgment', 'moral_judgment', 'Synthetic moral judgment strength', 'Not a real moral reasoning assessment'),
('temptation', 'temptation_intensity', 'Synthetic motivational pull toward morally inconsistent action', 'Not a real temptation assessment'),
('fatigue', 'fatigue', 'Synthetic fatigue or depletion pressure', 'Not a clinical or occupational measure'),
('pressure', 'situational_pressure', 'Synthetic contextual pressure against moral action', 'Not a real institutional audit'),
('regulation', 'self_regulatory_capacity', 'Synthetic capacity to sustain commitment under pressure', 'Not a psychological assessment'),
('identity', 'moral_identity', 'Synthetic centrality of moral commitments to self-concept', 'Not a moral identity assessment'),
('rationalization', 'rationalization_tendency', 'Synthetic tendency to redescribe or excuse moral failure', 'Not a clinical or character assessment'),
('action', 'moral_action_probability', 'Synthetic probability of moral action', 'Not a prediction of real conduct'),
('action', 'moral_action', 'Synthetic binary moral action indicator', 'Not real behavior'),
('weakness', 'weakness_of_will', 'Synthetic judgment-action gap', 'Not a real weakness-of-will diagnosis'),
('repair', 'guilt_recognition', 'Synthetic recognition of guilt or wrongdoing', 'Not a clinical guilt measure'),
('repair', 'humility', 'Synthetic openness to correction and limits', 'Not a personality assessment'),
('repair', 'accountability', 'Synthetic answerability to truth others and consequence', 'Not a governance or legal audit'),
('repair', 'defensiveness', 'Synthetic self-protective resistance to evidence or correction', 'Not a diagnosis'),
('repair', 'repair_capacity', 'Synthetic capacity for apology correction restitution and learning', 'Not a real repair assessment'),
('case_type', 'high_judgment_low_action', 'Synthetic cases with high judgment but failed action', 'Not a real-person risk classification'),
('case_type', 'high_weakness_low_repair', 'Synthetic cases with high weakness and low repair capacity', 'Not a real-person risk classification');

INSERT INTO scenario_notes VALUES
('baseline', 'Average moral judgment temptation fatigue pressure regulation identity rationalization and repair factors', 'Moderate synthetic moral action probability'),
('high_judgment_low_temptation', 'High moral judgment with low temptation', 'Higher moral action probability'),
('high_judgment_high_temptation', 'High moral judgment with high temptation', 'Action may fail despite strong judgment'),
('high_regulation_high_temptation', 'High self-regulatory capacity under high temptation', 'Regulation weakens temptation effect'),
('high_fatigue_high_pressure', 'High fatigue and pressure', 'Lower moral action probability and higher weakness gap'),
('high_identity_high_regulation', 'Strong moral identity and self-regulation', 'Higher moral action and lower weakness'),
('high_rationalization_high_temptation', 'High rationalization under high temptation', 'Higher weakness of will and lower repair'),
('high_guilt_humility_accountability', 'High guilt recognition humility and accountability', 'Higher repair capacity'),
('high_judgment_low_action', 'High judgment with failed action under temptation fatigue pressure or rationalization', 'Illustrates weakness of will'),
('high_weakness_low_repair', 'Large judgment-action gap with low repair capacity', 'Illustrates self-regulation failure after failure'),
('supportive_institution', 'Institution reduces temptation and protects truthful repair', 'Action and repair become more sustainable');

INSERT INTO risk_factors VALUES
('willpower_reductionism', 'Moral failure is reduced to private lack of will', 'Model judgment intention temptation fatigue habit identity and institution together'),
('temptation_narrowing', 'Immediate reward narrows moral attention', 'Use delay friction reminders and consequence visibility'),
('fatigue_erosion', 'Depletion weakens intention maintenance and inhibition', 'Protect rest workload pacing and decision bandwidth'),
('rationalization_drift', 'The self redescribes wrongdoing as acceptable', 'Use motive checks affected-person perspective and accountability'),
('identity_defensiveness', 'Moral self-image resists evidence of failure', 'Build humility confession and repair routines'),
('social_pressure', 'Group approval makes self-betrayal feel prudent', 'Use dissent scripts allies and voice safety'),
('institutional_incentives', 'Systems reward shortcuts silence or image protection', 'Align incentives metrics and accountability with ethical conduct'),
('repair_avoidance', 'Shame or fear blocks apology and correction', 'Use concrete repair deadlines restitution and learning loops'),
('intention_decay', 'Good intentions weaken before action', 'Use implementation intentions reminders and immediate follow-through'),
('emotion_override', 'Anger fear shame or resentment overwhelms restraint', 'Use pause rules emotion labeling and proportionality checks');
