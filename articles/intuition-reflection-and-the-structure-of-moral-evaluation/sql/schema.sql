-- SQLite schema for synthetic Intuition, Reflection, and Moral Evaluation scaffold.
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
('intuition', 'perceived_harm', 'Synthetic recognition of injury threat vulnerability or damage', 'Not a real harm assessment'),
('intuition', 'affective_activation', 'Synthetic emotional force that makes the case vivid', 'Not an emotion assessment'),
('intuition', 'social_salience', 'Synthetic degree to which the case is socially prominent identity-relevant or publicly charged', 'Not a social influence assessment'),
('intuition', 'group_identity_pressure', 'Synthetic pressure from group belonging identity or loyalty', 'Not a real group-pressure measure'),
('intuition', 'intuitive_appraisal', 'Synthetic rapid first-pass moral evaluation', 'Not a real moral intuition assessment'),
('reflection', 'principled_reasoning', 'Synthetic use of principles consistency tests and normative commitments', 'Not a reasoning ability assessment'),
('reflection', 'evidential_reconsideration', 'Synthetic openness to facts counterevidence and uncertainty', 'Not a real openness or reasoning score'),
('reflection', 'contextual_knowledge', 'Synthetic information about history institutions consequence and situation', 'Not a knowledge assessment'),
('reflection', 'cultural_framing', 'Synthetic interpretive moral vocabulary inherited from social worlds', 'Not a culture diagnosis'),
('reflection', 'institutional_review', 'Synthetic procedural review evidence testing or formal deliberation', 'Not an institutional audit'),
('reflection', 'time_for_reflection', 'Synthetic time or space available for deliberation', 'Not a cognitive capacity measure'),
('reflection', 'reflective_evaluation', 'Synthetic later structured moral evaluation', 'Not a real reasoning assessment'),
('evaluation', 'intuition_weight', 'Synthetic relative weight assigned to intuition in final judgment', 'Not a real cognitive process estimate'),
('evaluation', 'final_moral_evaluation', 'Synthetic final moral evaluation after intuitive and reflective combination', 'Not a moral-worth or judgment-quality score'),
('evaluation', 'reflective_revision', 'Synthetic difference between reflective evaluation and intuitive appraisal', 'Not a real revision measure'),
('evaluation', 'revision_magnitude', 'Synthetic absolute size of reflective revision', 'Not a real cognitive-change measure'),
('case_type', 'high_intuition_high_revision', 'Synthetic high-intuition high-revision case type', 'Not a real-person classification'),
('case_type', 'reflection_correction_case', 'Synthetic case where reflection differs strongly from first-pass intuition', 'Not a real-person or real-judgment classification');

INSERT INTO scenario_notes VALUES
('baseline', 'Average harm affect salience principles evidence context group pressure and review', 'Moderate synthetic final moral evaluation'),
('high_harm_high_affect', 'High perceived harm and affective activation', 'Higher intuitive appraisal and stronger intuition weight'),
('high_group_pressure', 'High group identity pressure and social salience', 'Higher intuition weight and possible motivated appraisal'),
('high_evidence_high_reflection', 'High evidential reconsideration and time for reflection', 'Lower intuition weight and stronger reflective contribution'),
('high_principle_high_context', 'High principled reasoning and contextual knowledge', 'Higher reflective evaluation'),
('intuition_dominant', 'High affect social salience and group pressure with low reflection time', 'Final evaluation tracks intuitive appraisal more strongly'),
('reflection_dominant', 'High evidence time for reflection and institutional review', 'Final evaluation tracks reflective evaluation more strongly'),
('high_intuition_high_revision', 'Strong intuition and large reflective revision', 'Shows conflict between first-pass appraisal and later evaluation'),
('reflection_correction_case', 'Intuitive appraisal and reflective evaluation differ in direction', 'Illustrates reflective correction or reversal'),
('moral_dumbfounding_case', 'Strong intuition with weak explicit reasoning variables', 'Illustrates judgment-before-justification pattern'),
('institutional_review_case', 'High institutional review and evidence testing', 'Illustrates disciplined revision and procedural reflection');

INSERT INTO risk_factors VALUES
('intuition_reductionism', 'Moral evaluation is reduced to immediate gut response', 'Model reflective evaluation and revision explicitly'),
('reflection_reductionism', 'Moral evaluation is reduced to explicit reasoning', 'Model intuitive appraisal salience affect and social influence'),
('post_hoc_rationalization', 'Reasons defend a fixed judgment instead of testing it', 'Require counterevidence revision criteria and affected-person perspective'),
('moral_dumbfounding', 'Certainty remains high while reasons collapse', 'Separate judgment strength from justification quality'),
('group_identity_capture', 'Group pressure makes preferred judgments feel obvious', 'Include dissent cross-group evidence and humility checks'),
('disgust_driven_judgment', 'Emotion becomes self-validating moral certainty', 'Test whether the reaction tracks harm dignity and proportionality'),
('procedural_evasion', 'Reflection or review delays responsibility and repair', 'Use transparent timelines interim care and repair pathways'),
('abstraction_without_care', 'Principled reasoning detaches from lived consequences', 'Reconnect reflection to affected persons and material outcomes'),
('digital_speed_pressure', 'Public attention rewards immediate reaction over careful judgment', 'Slow judgment verify evidence and preserve dignity'),
('institutional_image_protection', 'Review protects reputation rather than truth', 'Separate truth-seeking from public relations and liability control');
