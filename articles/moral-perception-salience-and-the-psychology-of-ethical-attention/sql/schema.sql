-- SQLite schema for synthetic Moral Perception, Salience, and Ethical Attention scaffold.
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
('salience', 'perceived_harm', 'Synthetic recognition of injury suffering burden or damage', 'Not a real harm assessment'),
('salience', 'visible_vulnerability', 'Synthetic visibility of dependence exposure need fear or unequal risk', 'Not a vulnerability assessment'),
('salience', 'emotional_activation', 'Synthetic affective force that makes a situation morally vivid', 'Not an emotion assessment'),
('salience', 'mind_perception', 'Synthetic recognition that another has feeling perspective agency and experience', 'Not a real mind-perception measure'),
('salience', 'contextual_framing', 'Synthetic interpretive script that shapes whether a situation appears moral', 'Not a real framing assessment'),
('salience', 'attentional_competition', 'Synthetic distraction overload threat metrics or rival cues', 'Not a cognitive-capacity assessment'),
('institution', 'organized_inattention', 'Synthetic institutional design factor that makes harm difficult to see or report', 'Not an institutional audit'),
('attention', 'latent_salience', 'Synthetic underlying moral-salience score', 'Not a real moral perception score'),
('attention', 'focal_attention_probability', 'Synthetic probability that a moral feature becomes focal', 'Not a prediction of real conduct'),
('attention', 'focal_attention', 'Synthetic binary indicator of focal moral attention', 'Not a real attention assessment'),
('judgment', 'intention_attribution', 'Synthetic attribution of intention', 'Not a real moral-judgment measure'),
('judgment', 'reflective_interpretation', 'Synthetic interpretive reflection', 'Not a real reflective-capacity measure'),
('judgment', 'moral_judgment', 'Synthetic downstream moral judgment', 'Not a moral-worth or judgment-quality score'),
('response', 'repair_pathway', 'Synthetic availability of reporting correction restitution or response', 'Not an institutional audit'),
('response', 'ethical_response_tendency', 'Synthetic tendency toward ethical response', 'Not a prediction of real behavior'),
('case_type', 'low_attention_high_harm', 'Synthetic high-harm cases that fail to become focal', 'Not a real-person risk classification'),
('case_type', 'high_salience_high_response', 'Synthetic high-salience high-response cases', 'Not a real-person or institutional classification');

INSERT INTO scenario_notes VALUES
('baseline', 'Average harm vulnerability emotion mind perception framing competition and organized inattention', 'Moderate synthetic focal attention probability'),
('high_harm_high_vulnerability', 'High perceived harm and visible vulnerability', 'Higher moral salience and focal attention probability'),
('high_harm_high_inattention', 'High perceived harm with high organized inattention', 'Lower focal attention despite harm'),
('high_mind_perception_high_harm', 'High mind perception and perceived harm', 'Higher moral salience and judgment'),
('high_competition_high_harm', 'High attentional competition despite high harm', 'Reduced focal attention probability'),
('low_attention_high_harm', 'High harm that remains nonfocal due to competition or organized inattention', 'Illustrates ethical attention failure'),
('high_salience_high_response', 'High salience with available repair pathway', 'Higher ethical response tendency'),
('digital_outrage_salience', 'High emotional activation and low context', 'Potentially high focal attention with distortion risk'),
('bureaucratic_inattention', 'High organized inattention and procedural framing', 'Human consequences become less visible'),
('privilege_invisibility', 'Low perceived harm among protected observers despite real burden', 'Highlights uneven distribution of notice'),
('affected_voice_visibility', 'Affected-person testimony increases mind perception harm perception and framing clarity', 'Higher focal attention and response');

INSERT INTO risk_factors VALUES
('salience_reductionism', 'Moral judgment is studied without asking what became visible first', 'Model attention and salience upstream of judgment'),
('procedural_narrowing', 'Process displaces persons and human consequences', 'Trace lived effects behind categories and workflows'),
('organized_inattention', 'Institutions make harms difficult to see report or name', 'Create reporting channels consequence reviews and affected-person testimony'),
('attentional_competition', 'Metrics deadlines threat or distraction crowd out vulnerability', 'Protect time attention and escalation pathways'),
('mind_perception_failure', 'People are reduced to cases categories costs or risks', 'Restore narrative personhood and affected-person voice'),
('selective_empathy', 'Only familiar vivid or in-group suffering becomes salient', 'Use historical analysis testimony and institutional equity review'),
('digital_attention_distortion', 'Viral outrage crowds out slow structural or chronic harm', 'Build durable attention practices beyond feed-driven reaction'),
('role_blindness', 'Professional role scripts hide dignity power or harm', 'Use role reflection and cross-functional review'),
('privilege_invisibility', 'Protected observers fail to notice burdens faced by others', 'Use access audits lived evidence and humility about field of view'),
('motivated_not_seeing', 'Seeing would create guilt conflict sacrifice or loss of innocence', 'Build accountability around avoidance and the costs of seeing');
