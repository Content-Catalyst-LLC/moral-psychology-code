-- SQLite schema for synthetic Care, Empathy, and Relational Moral Life scaffold.
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
('perspective', 'perspective_taking', 'Synthetic perspective-taking capacity', 'Not a psychological assessment'),
('affect', 'affective_resonance', 'Synthetic affective resonance with another person''s state', 'Not a diagnosis or empathy score'),
('salience', 'situational_salience', 'Synthetic visibility or salience of another person''s condition', 'Not a real media or institutional visibility measure'),
('empathy', 'empathy', 'Synthetic empathic activation', 'Not a real empathy assessment'),
('responsibility', 'felt_responsibility', 'Synthetic felt responsibility to respond', 'Not a real moral responsibility score'),
('dependence', 'perceived_dependence', 'Synthetic perceived vulnerability or dependence', 'Not a real recipient-needs assessment'),
('persistence', 'temporal_persistence', 'Synthetic ability to sustain response over time', 'Not a real endurance measure'),
('burnout', 'burnout', 'Synthetic burnout or overload pressure', 'Not a burnout diagnosis'),
('support', 'institutional_support', 'Synthetic institutional support for care', 'Not a workplace healthcare or school audit'),
('voice', 'voice_safety', 'Synthetic protection for speaking about care failures', 'Not a psychological safety assessment'),
('care', 'caring_response_probability', 'Synthetic probability of caring response', 'Not a prediction of real conduct'),
('case_type', 'high_empathy_low_care', 'Synthetic cases with high empathy but low care under overload', 'Not a real-person risk classification');

INSERT INTO scenario_notes VALUES
('baseline', 'Average empathy responsibility dependence persistence burnout support and voice safety', 'Moderate synthetic caring response probability'),
('high_empathy_low_burnout', 'High empathy with low burnout', 'Higher caring response probability'),
('high_empathy_high_burnout', 'High empathy with high burnout', 'Care may be suppressed despite empathic activation'),
('high_responsibility_high_dependence', 'Strong responsibility and visible dependence', 'Higher sustained care'),
('low_responsibility_high_empathy', 'Empathy without felt responsibility', 'Concern may not become durable care'),
('high_institutional_support', 'Strong institutional support and voice safety', 'Higher sustainable care'),
('low_support_high_burnout', 'Weak support with high burnout', 'Lower caring response probability'),
('high_empathy_low_care', 'High empathy with burnout overload weak support or weak responsibility', 'Illustrates empathy-care gap');

INSERT INTO risk_factors VALUES
('empathy_reductionism', 'Care is reduced to brief empathic feeling', 'Distinguish empathic activation from sustained caring response'),
('sentimental_care', 'Care language centers feeling rather than recipient need', 'Use responsiveness dignity agency and follow-through checks'),
('burnout_overload', 'Chronic care burden weakens sustained response', 'Provide rest staffing shared responsibility and institutional support'),
('selective_empathy', 'Concern favors the familiar visible or proximate', 'Widen concern through testimony contact justice norms and structural visibility'),
('care_domination', 'Helping overrides recipient agency or dignity', 'Use consent voice participatory decision-making and respect'),
('caregiver_invisibility', 'Care labor is expected but unrecognized', 'Recognize compensate and distribute care labor fairly'),
('institutional_hypocrisy', 'Organizations praise care while denying conditions for care', 'Align metrics staffing incentives and resources with humane care'),
('voice_suppression', 'Care failures cannot be safely named', 'Protect reporting dissent correction and affected-person testimony'),
('repair_failure', 'Harm in care relationships is minimized or personalized', 'Use apology restitution system redesign and learning loops');
