-- SQLite schema for synthetic Methods in Moral Psychology scaffold.
-- Educational and reproducible research scaffold only.

DROP TABLE IF EXISTS construct_map;
DROP TABLE IF EXISTS experimental_conditions;
DROP TABLE IF EXISTS design_types;

CREATE TABLE construct_map (
    construct TEXT NOT NULL,
    indicator_type TEXT NOT NULL,
    example_measure TEXT NOT NULL,
    measurement_warning TEXT NOT NULL
);

CREATE TABLE experimental_conditions (
    condition TEXT PRIMARY KEY,
    description TEXT NOT NULL,
    expected_design_role TEXT NOT NULL
);

CREATE TABLE design_types (
    design_type TEXT PRIMARY KEY,
    strength TEXT NOT NULL,
    risk TEXT NOT NULL,
    best_use TEXT NOT NULL
);

INSERT INTO construct_map VALUES
('wrongness_judgment', 'vignette_rating', 'How morally wrong was the action?', 'Do not collapse with blame or punishment preference'),
('blame_judgment', 'vignette_rating', 'How blameworthy is the actor?', 'Depends on intention knowledge control and excuse'),
('norm_learning', 'developmental_indicator', 'Norm recognition or transgression correction', 'Age tasks must be developmentally appropriate'),
('action_tendency', 'behavioral_task', 'Helping sharing punishing or reporting choice', 'Observed behavior still requires context-sensitive interpretation'),
('moral_identity', 'self_report', 'Centrality of morality to self-concept', 'May be influenced by social desirability and self-presentation'),
('social_desirability', 'response_style', 'Desire to present oneself favorably', 'Can distort self-report and moral self-description');

INSERT INTO experimental_conditions VALUES
('control', 'Baseline scenario without extra intention or excuse cue', 'Reference group for comparison'),
('intent_salient', 'Scenario emphasizes agent intention or knowledge', 'Tests whether intention salience increases wrongness judgment'),
('excuse_salient', 'Scenario emphasizes excuse constraint or reduced control', 'Tests whether excuse salience reduces blame judgment');

INSERT INTO design_types VALUES
('vignette_experiment', 'Causal control over moral scenario features', 'May not predict real-world behavior', 'Testing specific judgment mechanisms'),
('behavioral_task', 'Observed moral choice under structured conditions', 'Meaning and stakes may be ambiguous', 'Studying action tendencies and judgment-action gaps'),
('cross_sectional_developmental', 'Efficient age group comparison', 'Cohort effects and contextual confounding', 'Mapping age-related differences'),
('longitudinal_developmental', 'Tracks within-person change', 'Attrition and repeated-measure effects', 'Studying moral development over time'),
('cross_cultural_comparison', 'Tests generalizability across moral worlds', 'Translation and construct equivalence challenges', 'Extending findings beyond narrow samples'),
('multi_method_assessment', 'Triangulates judgment emotion action and identity', 'More expensive and complex', 'Studying layered moral constructs');
