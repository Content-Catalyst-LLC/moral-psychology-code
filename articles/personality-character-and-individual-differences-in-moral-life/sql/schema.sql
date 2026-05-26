-- SQLite schema for synthetic Personality, Character, and Moral Variation scaffold.
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
('personality', 'broad_personality', 'Synthetic broad personality structure or dispositional profile', 'Not a real personality assessment'),
('character', 'character_strength', 'Synthetic morally valenced character strength', 'Not a real virtue or character score'),
('identity', 'moral_identity', 'Synthetic centrality of morality to self-concept', 'Not a real moral identity assessment'),
('empathy', 'empathy', 'Synthetic empathic sensitivity to suffering or vulnerability', 'Not a psychological diagnosis'),
('self_regulation', 'conscientious_self_regulation', 'Synthetic self-command reliability and follow-through', 'Not a real conscientiousness score'),
('humility', 'humility', 'Synthetic humility openness to correction and non-defensive learning', 'Not a real humility assessment'),
('bias', 'self_interest_bias', 'Synthetic self-interest bias in moral judgment', 'Not a real moral diagnosis'),
('pressure', 'situational_pressure', 'Synthetic situational or institutional pressure', 'Not an institutional audit'),
('voice_safety', 'voice_safety', 'Synthetic protection for speaking warning dissenting or reporting', 'Not a workplace assessment'),
('accountability', 'accountability_strength', 'Synthetic answerability review and responsibility structure', 'Not a governance audit'),
('profile', 'moral_response_profile', 'Synthetic moral-response profile', 'Not a real-person moral score'),
('action', 'moral_action_probability', 'Synthetic probability of moral action', 'Not a prediction of real conduct'),
('interaction', 'person_situation_interaction', 'Synthetic person-situation interaction', 'Not an empirical estimate');

INSERT INTO scenario_notes VALUES
('baseline', 'Average personality character identity bias pressure voice safety and accountability', 'Moderate synthetic moral action probability'),
('high_character_high_identity', 'High character strength and high moral identity', 'Higher moral response profile'),
('high_identity_high_bias', 'High moral identity with high self-interest bias', 'Identity supports action but bias suppresses it'),
('high_pressure_low_voice', 'High situational pressure and low voice safety', 'Lower moral action probability'),
('high_profile_low_action', 'High moral response profile but high pressure and low accountability', 'Moral action may fail despite strong profile'),
('high_empathy_high_visibility', 'High empathy with high consequence visibility', 'Higher moral response profile and action probability'),
('high_humility_high_accountability', 'High humility and accountability', 'Higher openness to correction and action'),
('strong_context_support', 'High voice safety and accountability with low pressure', 'Higher ethical expression');

INSERT INTO risk_factors VALUES
('trait_essentialism', 'Moral life is reduced to fixed personality or character labels', 'Use person-situation models and longitudinal evidence'),
('context_blindness', 'Institutions blame persons while ignoring incentives and pressure', 'Map organizational context incentives and accountability'),
('moral_vanity', 'Moral identity protects self-image more than conduct', 'Humility correction apology and repair practices'),
('self_interest_bias', 'Personal advantage distorts moral interpretation', 'Conflict disclosure independent review and symmetry tests'),
('empathy_selectivity', 'Empathy focuses on familiar visible or similar persons', 'Principle-based justice and affected-community testimony'),
('obedience_pressure', 'Duty and conscientiousness are captured by authority', 'Voice safety refusal rights and role-specific accountability'),
('virtue_branding', 'Character strengths become identity labels rather than practices', 'Behavioral evidence accountability and cost-bearing action'),
('retaliation_risk', 'Moral courage is suppressed by fear of punishment', 'Whistleblower protection and psychological safety');
