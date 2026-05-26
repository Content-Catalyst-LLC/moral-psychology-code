-- SQLite schema for synthetic Moral Emotion scaffold.
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
('appraisal', 'perceived_wrongdoing', 'Synthetic recognition that wrongdoing occurred', 'Not a real wrongdoing determination'),
('appraisal', 'specific_responsibility', 'Synthetic act-focused responsibility appraisal', 'Not a legal or moral-responsibility assessment'),
('appraisal', 'global_self_condemnation', 'Synthetic global negative self-appraisal', 'Not a clinical or psychological assessment'),
('appraisal', 'exposure_before_others', 'Synthetic visibility or imagined exposure before observers', 'Not a social-exposure measure'),
('appraisal', 'perceived_violation', 'Synthetic perception of violation corruption or contamination', 'Not a real violation assessment'),
('appraisal', 'boundary_threat', 'Synthetic perception of boundary threat', 'Not a risk or security assessment'),
('appraisal', 'perceived_suffering', 'Synthetic recognition of suffering vulnerability or need', 'Not a clinical assessment'),
('appraisal', 'mind_perception', 'Synthetic recognition of another as minded and experiencable', 'Not a real empathy or mind-perception measure'),
('appraisal', 'admired_moral_action', 'Synthetic perception of morally admirable action', 'Not a real exemplar score'),
('appraisal', 'perceived_moral_excellence', 'Synthetic perception of morally excellent motive or conduct', 'Not a virtue assessment'),
('support', 'agency_capacity', 'Synthetic capacity to act repair or regulate', 'Not a psychological assessment'),
('support', 'repair_pathway', 'Synthetic availability of confession restitution and changed conduct', 'Not an institutional audit'),
('support', 'social_support', 'Synthetic presence of supportive relational or institutional conditions', 'Not a real support measure'),
('emotion', 'guilt', 'Synthetic act-focused self-condemning moral emotion', 'Not a guilt assessment'),
('emotion', 'shame', 'Synthetic self-focused exposure or global self-condemnation emotion', 'Not a shame assessment'),
('emotion', 'disgust', 'Synthetic boundary-making or violation-response moral emotion', 'Not a disgust assessment'),
('emotion', 'compassion', 'Synthetic other-suffering moral emotion', 'Not a compassion assessment'),
('emotion', 'elevation', 'Synthetic other-praising moral emotion tied to witnessed excellence', 'Not an elevation assessment'),
('outcome', 'helping_tendency', 'Synthetic tendency toward helping or prosocial response', 'Not a prediction of real behavior'),
('outcome', 'repair_tendency', 'Synthetic tendency toward apology restitution or correction', 'Not a prediction of real behavior'),
('outcome', 'avoidance_tendency', 'Synthetic tendency toward withdrawal avoidance or rejection', 'Not a prediction of real behavior'),
('profile', 'constructive_emotion_index', 'Synthetic average of guilt compassion and elevation', 'Not a moral-worth measure'),
('profile', 'punitive_emotion_index', 'Synthetic average of shame and disgust', 'Not a moral-risk score'),
('case_type', 'high_shame_high_disgust', 'Synthetic emotion-profile case type', 'Not a real-person risk classification'),
('case_type', 'high_compassion_high_elevation', 'Synthetic emotion-profile case type', 'Not a real-person classification'),
('case_type', 'high_guilt_high_repair', 'Synthetic emotion-profile case type', 'Not a real-person classification');

INSERT INTO scenario_notes VALUES
('baseline', 'Average appraisals emotions support and response pathways', 'Moderate synthetic helping repair and avoidance tendencies'),
('high_wrongdoing_high_responsibility', 'High perceived wrongdoing and specific responsibility', 'Higher guilt and repair tendency'),
('high_self_condemnation_high_exposure', 'High global self-condemnation and exposure', 'Higher shame and possible avoidance'),
('high_violation_high_boundary_threat', 'High perceived violation and boundary threat', 'Higher disgust and avoidance tendency'),
('high_suffering_high_mind_perception', 'High perceived suffering and mind perception', 'Higher compassion and helping tendency'),
('high_exemplar_high_excellence', 'High admired moral action and perceived excellence', 'Higher elevation and prosocial aspiration'),
('high_guilt_high_repair', 'High guilt with agency and repair pathway', 'Higher repair tendency'),
('high_shame_high_disgust', 'High shame and disgust', 'Higher avoidance or punitive response risk'),
('high_compassion_high_elevation', 'High compassion and elevation', 'Higher helping and prosocial imitation'),
('institutional_shame_climate', 'Institution amplifies shame without repair pathways', 'Hiding defensiveness and avoidance become more likely'),
('institutional_compassion_climate', 'Institution sustains compassion with resources and support', 'Care and helping become more sustainable'),
('institutional_disgust_climate', 'Institution or public culture amplifies disgust toward people or groups', 'Dehumanization exclusion and punitive moralism risk increases');

INSERT INTO risk_factors VALUES
('emotion_reductionism', 'Distinct moral emotions are collapsed into one moral intensity variable', 'Model guilt shame disgust compassion and elevation separately'),
('guilt_shame_confusion', 'Guilt and shame are treated as the same feeling', 'Distinguish act-focused responsibility from global self-condemnation'),
('misplaced_guilt', 'Responsibility is felt where agency was limited or absent', 'Clarify actual responsibility and available repair'),
('humiliating_shame', 'Exposure becomes total self-condemnation or social destruction', 'Preserve dignity while naming responsibility'),
('dehumanizing_disgust', 'People or groups are treated as contaminating or less than human', 'Recenter dignity evidence and concrete harm'),
('selective_compassion', 'Concern flows only toward familiar favored or visible groups', 'Use institutions and testimony to widen moral attention'),
('compassion_fatigue', 'Repeated suffering exposure overwhelms care capacity', 'Support caregivers and distribute responsibility'),
('hero_worship', 'Elevation idealizes the exemplar and replaces practice', 'Translate admiration into concrete habits and accountability'),
('outrage_addiction', 'Anger disgust and shame become rewarding in themselves', 'Slow judgment and require proportional action'),
('institutional_emotion_capture', 'Organizations or media manipulate emotion for power attention or image', 'Audit emotional climates incentives and accountability pathways'),
('symbolic_emotion', 'Feeling substitutes for material repair or care', 'Require action restitution resource commitment and follow-through');
