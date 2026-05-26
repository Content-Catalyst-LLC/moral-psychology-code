-- SQLite schema for synthetic Moral Development in Childhood and Adolescence scaffold.
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
('age', 'age', 'Synthetic age from 5 to 18', 'Not real demographic data'),
('band', 'development_band', 'Synthetic childhood or adolescent developmental pattern', 'Not a clinical or developmental classification'),
('cognition', 'perspective_taking', 'Synthetic capacity to understand another perspective', 'Not a cognitive assessment'),
('emotion', 'empathic_concern', 'Synthetic empathic concern for another person', 'Not a psychological diagnosis'),
('norms', 'norm_understanding', 'Synthetic understanding of norms rules and obligations', 'Not a real norm-learning assessment'),
('peers', 'peer_context', 'Synthetic peer context and peer learning', 'Not a real peer assessment'),
('family', 'family_support', 'Synthetic family support and moral socialization', 'Not a family assessment'),
('school', 'school_climate', 'Synthetic school climate and institutional support', 'Not a school audit'),
('status', 'peer_status_pressure', 'Synthetic peer-status pressure or threat of exclusion', 'Not a real peer risk score'),
('harm', 'harm_understanding', 'Synthetic harm-based moral understanding', 'Not a child moral score'),
('fairness', 'fairness_reasoning', 'Synthetic fairness reasoning', 'Not a child moral score'),
('convention', 'conventional_sensitivity', 'Synthetic conventional-rule sensitivity', 'Not a child norm score'),
('autonomy', 'personal_autonomy_understanding', 'Synthetic personal-domain or autonomy understanding', 'Not a developmental assessment'),
('profile', 'latent_moral_development', 'Synthetic moral-development profile', 'Not a real moral-development score'),
('action', 'moral_action_probability', 'Synthetic moral action probability', 'Not a prediction of real conduct'),
('case', 'high_development_low_action', 'Synthetic cases with strong profile but low action under peer pressure', 'Not a real-person risk classification');

INSERT INTO scenario_notes VALUES
('baseline', 'Average age empathy norm understanding peer context family support school climate and peer pressure', 'Moderate synthetic moral-development profile'),
('early_childhood_harm', 'Younger child with strong empathic concern', 'Higher harm understanding but limited autonomy reasoning'),
('middle_childhood_fairness', 'Middle childhood with family and peer support', 'Higher fairness and reciprocity pattern'),
('adolescent_identity_pressure', 'Adolescent pattern with high peer-status pressure', 'Moral action may be suppressed despite stronger development'),
('high_school_climate', 'Supportive school climate and family support', 'Higher moral action probability'),
('low_support_high_pressure', 'Weak family support and school climate with high peer pressure', 'Lower action probability'),
('domain_differentiation', 'Distinct harm fairness convention and autonomy scores', 'Shows social-domain structure'),
('high_development_low_action', 'Strong latent development but high peer-status pressure', 'Illustrates moral insight-action gap in adolescence');

INSERT INTO risk_factors VALUES
('obedience_reductionism', 'Moral development is reduced to rule-following and compliance', 'Teach reasons repair fairness and authority critique'),
('stage_reductionism', 'Development is reduced to one universal reasoning ladder', 'Use multidimensional and domain-sensitive models'),
('early_competence_romanticism', 'Early moral sensitivity is treated as complete morality', 'Distinguish early capacities from mature moral agency'),
('peer_conformity', 'Young people suppress conscience to preserve belonging', 'Protected voice bystander education and restorative peer norms'),
('digital_status_pressure', 'Online approval replaces responsibility as moral guide', 'Media literacy slow reflection and repair-centered accountability'),
('school_injustice', 'Institutions teach unequal moral standing through biased discipline', 'Bias-aware restorative transparent and accountable practices'),
('empathy_selectivity', 'Care focuses on familiar visible or high-status persons', 'Perspective-taking inclusive curriculum and equal concern practice'),
('family_hypocrisy', 'Adults teach moral language but model inconsistent conduct', 'Adult accountability apology repair and consistent practice');
