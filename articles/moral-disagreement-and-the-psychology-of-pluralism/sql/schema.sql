-- SQLite schema for synthetic Moral Disagreement and the Psychology of Pluralism scaffold.
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
('harm', 'harm_weight', 'Synthetic weighting of perceived harm or suffering', 'Not a real-person moral trait score'),
('fairness', 'fairness_weight', 'Synthetic weighting of fairness equality reciprocity desert or need', 'Fairness can mean different things across frameworks'),
('loyalty', 'loyalty_weight', 'Synthetic weighting of loyalty group obligation or special duty', 'Loyalty can support care or justify partiality'),
('purity', 'purity_weight', 'Synthetic weighting of purity sanctity or symbolic boundary concern', 'Purity meaning depends on tradition and context'),
('authority', 'authority_weight', 'Synthetic weighting of authority order role duty or legitimacy', 'Authority can protect order or enable domination'),
('care', 'care_weight', 'Synthetic weighting of care compassion mercy or relational protection', 'Care can conflict with accountability or impartiality'),
('identity', 'identity_strength', 'Synthetic strength of group identity or belonging', 'Identity is contextual and not pathology'),
('framing', 'framing_sensitivity', 'Synthetic sensitivity to situational narrative or moral framing', 'Frames shape salience before explicit reasoning'),
('trust', 'institutional_trust', 'Synthetic trust in institutions procedures or shared authorities', 'Trust depends on legitimacy accountability and history'),
('tolerance', 'pluralist_tolerance', 'Synthetic tolerance for unresolved moral difference', 'Not an endorsement of unlimited tolerance'),
('judgment', 'moral_judgment', 'Synthetic moral judgment score', 'Not a real-person moral judgment score'),
('distance', 'disagreement_distance', 'Distance between synthetic moral judgments', 'Simplified analytic indicator only');

INSERT INTO scenario_notes VALUES
('baseline', 'Average value weights identity strength framing and trust', 'Moderate synthetic disagreement'),
('high_value_gap', 'Large difference across value weights', 'Higher moral disagreement distance'),
('high_identity_gap', 'Large difference in identity strength', 'Higher disagreement when identity organizes judgment'),
('high_trust_gap', 'Large difference in institutional trust', 'Higher disagreement and weaker shared standards'),
('high_framing_gap', 'Large difference in case framing', 'Higher disagreement despite similar values'),
('pluralist_capacity', 'High trust high accountability high tolerance low exclusion', 'Better institutional management of disagreement'),
('deep_conflict', 'High value gap high identity gap low trust high exclusion', 'Highest synthetic disagreement distance');

INSERT INTO risk_factors VALUES
('value_monism', 'One value is treated as the only legitimate moral consideration', 'Pluralist value mapping and explicit tradeoff analysis'),
('crude_relativism', 'Disagreement is mistaken for anything-goes morality', 'Distinguish pluralism from relativism and preserve moral judgment'),
('identity_defense', 'Criticism of a view is experienced as attack on the group', 'Norms for criticism without humiliation'),
('selective_trust', 'Different communities trust different authorities and evidence standards', 'Transparent procedures and shared verification channels'),
('framing_divergence', 'The same case is narrated through different moral categories', 'Case translation and salience mapping'),
('power_blindness', 'Dominant values are presented as neutral common sense', 'Attention to affected groups and institutional power'),
('bad_faith_pluralism', 'Pluralist language is used to hide cruelty domination or manipulation', 'Accountability and harm-aware critique'),
('intolerance_of_conflict', 'All disagreement is treated as danger or betrayal', 'Pluralist institutions and protected lawful contestation');
