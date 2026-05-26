-- SQLite schema for synthetic Experimental Moral Psychology scaffold.
-- Educational and reproducible research scaffold only.

DROP TABLE IF EXISTS component_map;
DROP TABLE IF EXISTS power_conditions;
DROP TABLE IF EXISTS experimental_design_notes;

CREATE TABLE component_map (
    component TEXT NOT NULL,
    variable TEXT NOT NULL PRIMARY KEY,
    description TEXT NOT NULL,
    interpretive_warning TEXT NOT NULL
);

CREATE TABLE power_conditions (
    condition TEXT PRIMARY KEY,
    description TEXT NOT NULL,
    expected_design_role TEXT NOT NULL
);

CREATE TABLE experimental_design_notes (
    design_feature TEXT PRIMARY KEY,
    example TEXT NOT NULL,
    methodological_value TEXT NOT NULL,
    methodological_risk TEXT NOT NULL
);

INSERT INTO component_map VALUES
('intuition', 'intuition_strength', 'Fast intuitive appraisal strength', 'Do not treat intuition as automatically reliable or unreliable'),
('reflection', 'reflection_strength', 'Deliberative or reflective control', 'Reflection can correct intuition or rationalize it'),
('norm_sensitivity', 'norm_sensitivity', 'Responsiveness to moral norms constraints or prohibitions', 'Not identical to deontological theory'),
('consequence_sensitivity', 'consequence_sensitivity', 'Attention to outcomes welfare or aggregate consequences', 'Not identical to formal utilitarianism'),
('intentionality', 'intentionality', 'Perceived intention or agency', 'May be inferred from outcomes or moral evaluation'),
('excuse', 'excuse_strength', 'Reduced blame due to constraint ignorance or diminished control', 'Must be distinguished from denial of wrongness'),
('group_identity', 'group_identity_salience', 'Salience of group membership or identity', 'Can shape moral attention and blame'),
('power', 'power_condition', 'Experimental power context low control or high', 'Power may alter norm sensitivity and responsibility perception');

INSERT INTO power_conditions VALUES
('low_power', 'Participant or agent is framed as having reduced power', 'May increase sensitivity to constraint vulnerability or norm violation'),
('control', 'Baseline condition without explicit power manipulation', 'Reference group for comparison'),
('high_power', 'Participant or agent is framed as having elevated power', 'May reduce norm sensitivity or alter responsibility interpretation');

INSERT INTO experimental_design_notes VALUES
('vignette_manipulation', 'Change intention or excuse across conditions', 'Isolates causal effect on judgment', 'May oversimplify real moral context'),
('dilemma_response', 'Endorse or reject harmful action for greater outcome', 'Tests conflict between norm and consequence', 'Can be overread as moral philosophy'),
('process_modeling', 'Separate norm sensitivity consequence sensitivity and action tendency', 'Prevents one-dimensional interpretation', 'Depends on model assumptions'),
('response_time', 'Measure speed of judgment', 'Can indicate automaticity or difficulty', 'Speed is not the same as moral validity'),
('cross_cultural_extension', 'Compare judgments across cultures and politics', 'Tests generalizability', 'Requires translation and construct equivalence');
