-- SQLite schema for synthetic Social Media, Outrage, and Networked Moral Life scaffold.
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
('outrage', 'outrage_intensity', 'Felt moral outrage in response to perceived wrongdoing', 'Outrage can be morally important or distorted depending on context'),
('reward', 'expected_reward', 'Expected social reward from public expression', 'Reward is not identical to moral validity'),
('algorithm', 'algorithmic_amplification', 'Estimated visibility or ranking advantage', 'Amplification is not the same as public importance'),
('identity', 'group_identity_salience', 'Strength of group or moral-community identity salience', 'Identity can shape expression and interpretation'),
('visibility', 'visibility_bias', 'Overrepresentation of extreme or highly engaging content', 'Visibility is not representativeness'),
('correction', 'contextual_correction', 'Context evidence deliberation or repair that dampens escalation', 'Correction depends on trust and timing'),
('misinformation', 'misinformation_susceptibility', 'Susceptibility to sharing inaccurate moralized content', 'Not a real-person diagnosis'),
('cross_group', 'cross_group_exposure', 'Exposure to different groups or perspectives', 'Contact quality matters more than mere exposure'),
('expression', 'outrage_expression', 'Public expression of outrage', 'Expression is shaped by social and platform incentives'),
('norms', 'perceived_norm_extremity', 'Perceived extremity of visible norms', 'May reflect platform distortion rather than actual group belief'),
('sharing', 'moralized_sharing', 'Sharing of morally charged content', 'Can mobilize solidarity or spread misinformation');

INSERT INTO scenario_notes VALUES
('baseline', 'Average outrage reward amplification identity and correction', 'Moderate synthetic expression probability'),
('high_reward', 'High expected social reward with average outrage', 'Higher probability of public outrage expression'),
('high_identity', 'High group identity salience with average outrage', 'Higher identity-aligned moral expression'),
('high_amplification', 'High algorithmic amplification and visibility bias', 'Higher norm extremity and moralized sharing'),
('high_correction', 'High contextual correction with average outrage', 'Lower public expression probability and lower moralized sharing'),
('combined_escalation', 'High outrage high reward high amplification high identity low correction', 'Highest synthetic expression and norm-distortion risk');

INSERT INTO risk_factors VALUES
('context_collapse', 'Content reaches audiences beyond intended setting', 'Context restoration and slower interpretation'),
('visibility_bias', 'Extreme content appears more representative than it is', 'Representative data and norm clarification'),
('moralized_misinformation', 'False or incomplete claims spread through moral urgency', 'Verification norms and friction before sharing'),
('audience_capture', 'Users adapt moral expression to rewarding audiences', 'Private reflection and diverse accountability'),
('dehumanizing_outrage', 'Targets become symbols or contaminants', 'Human dignity norms and anti-harassment enforcement'),
('viral_sanction', 'Public punishment escalates before evidence is complete', 'Proportionality evidence standards and repair pathways');
