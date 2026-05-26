-- SQLite schema for synthetic Moral Reasoning developmental scaffold.
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
('development', 'age', 'Synthetic developmental age from childhood through young adulthood', 'Not real demographic data'),
('development', 'perspective_taking', 'Synthetic capacity to consider intentions viewpoints and reciprocity', 'Not a psychological assessment'),
('development', 'norm_exposure', 'Synthetic exposure to rules norms dialogue and social learning', 'Not a real family or school measure'),
('development', 'domain_differentiation', 'Synthetic distinction among moral conventional personal and prudential domains', 'Not a real developmental assessment'),
('development', 'relational_orientation', 'Synthetic sensitivity to care dependency relationship and responsiveness', 'Not a real care-orientation assessment'),
('development', 'authority_orientation', 'Synthetic tendency to defer to authority rule or external command', 'Not a real authority-orientation assessment'),
('development', 'peer_cooperation', 'Synthetic cooperation mutual respect and peer-rule negotiation', 'Not a real peer relationship measure'),
('development', 'cultural_context_support', 'Synthetic cultural and institutional support for moral dialogue', 'Not a real culture or school assessment'),
('reasoning', 'latent_reasoning', 'Synthetic underlying developmental moral reasoning complexity', 'Not a real moral-development score'),
('reasoning', 'reasoning_stage', 'Synthetic stage-like ordered reasoning category', 'Not a real Kohlberg stage assessment'),
('reasoning', 'justice_reasoning', 'Synthetic justice rights fairness reciprocity and principle dimension', 'Not a real justice-reasoning score'),
('reasoning', 'care_reasoning', 'Synthetic care relationship vulnerability and responsiveness dimension', 'Not a real care-reasoning score'),
('reasoning', 'conventional_sensitivity', 'Synthetic sensitivity to convention authority coordination and local rules', 'Not a real social-domain assessment'),
('reasoning', 'autonomy_orientation', 'Synthetic ability to evaluate rules through cooperation and mutual respect', 'Not a real autonomy assessment'),
('case_type', 'high_complexity_case', 'Synthetic case with high justice care and domain differentiation', 'Not a real-person classification'),
('case_type', 'stage_domain_mismatch_case', 'Synthetic mismatch between stage-like label and domain profile', 'Not a real-person classification'),
('education', 'moral_education_scenario', 'Synthetic moral education or civic formation scenario', 'Not a real school or student evaluation');

INSERT INTO scenario_notes VALUES
('baseline', 'Average developmental predictors and domain profile', 'Moderate synthetic reasoning complexity'),
('high_perspective_taking', 'High perspective-taking with average age and norm exposure', 'Higher justice reasoning and latent reasoning'),
('high_domain_differentiation', 'High distinction among moral conventional personal and prudential domains', 'Higher autonomy orientation and clearer domain profile'),
('high_authority_orientation', 'High deference to authority and external rule structure', 'Higher conventional sensitivity and lower autonomy orientation'),
('high_peer_cooperation', 'High peer cooperation mutual respect and rule negotiation', 'Higher autonomous morality and reasoning complexity'),
('high_relational_orientation', 'High relational care and vulnerability awareness', 'Higher care reasoning'),
('high_cultural_support', 'High support for moral dialogue and reflective norm learning', 'Higher latent reasoning and civic-development potential'),
('preconventional_profile', 'Low latent reasoning with high authority orientation', 'Stage_1_2 style profile'),
('conventional_profile', 'Moderate latent reasoning with social order and norm exposure', 'Stage_3_4 style profile'),
('postconventional_profile', 'Higher latent reasoning with perspective-taking and domain differentiation', 'Stage_5_6 style profile'),
('high_complexity_case', 'High justice care and domain differentiation', 'Plural moral maturity profile'),
('stage_domain_mismatch_case', 'Stage-like category conflicts with domain profile', 'Illustrates why stage labels should not be treated as complete moral profiles');

INSERT INTO risk_factors VALUES
('stage_reductionism', 'Moral development is reduced to one universal ladder', 'Model multiple moral dimensions and domain differentiation'),
('justice_only_bias', 'Care relationship and dependency are undervalued', 'Include care reasoning relational orientation and vulnerability'),
('verbal_reasoning_bias', 'Articulated justification is mistaken for moral maturity', 'Separate reasoning language from action emotion and care'),
('cultural_bias', 'Western liberal abstraction is treated as universal maturity', 'Include cultural context and affected community perspectives'),
('authority_neutrality_error', 'Authority is treated as developmentally neutral despite unequal power', 'Model authority orientation and institutional experience critically'),
('reasoning_action_gap', 'Sophisticated reasoning fails to become conduct', 'Add moral identity emotion courage and situational pressure in extensions'),
('domain_overgeneralization', 'Moral conventional personal and prudential rules are collapsed', 'Model domain differentiation explicitly'),
('school_compliance_error', 'Moral education becomes obedience training', 'Include dialogue care peer cooperation restorative practice and student voice'),
('marginalized_voice_exclusion', 'Developmental theory ignores how marginalized children experience rules and institutions', 'Include power history dignity and lived evidence'),
('measurement_overconfidence', 'Synthetic or coded stages are treated as real moral worth', 'Use outputs only for demonstration and never as personal assessment');
