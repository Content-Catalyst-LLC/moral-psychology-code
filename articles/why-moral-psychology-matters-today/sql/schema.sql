-- SQLite schema for synthetic Moral Psychology article scaffold.
-- Educational and reproducible research scaffold only.

DROP TABLE IF EXISTS domain_weights;
DROP TABLE IF EXISTS scenario_notes;

CREATE TABLE domain_weights (
    domain TEXT NOT NULL,
    variable TEXT NOT NULL PRIMARY KEY,
    weight REAL NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE scenario_notes (
    scenario TEXT PRIMARY KEY,
    description TEXT NOT NULL
);

INSERT INTO domain_weights (domain, variable, weight, description) VALUES
('politics', 'political_polarization', 0.25, 'Polarization and moralized public conflict'),
('organizations', 'organizational_risk', 0.20, 'Institutional risk ethical fading and distributed responsibility'),
('development', 'developmental_moral_learning', 0.15, 'Moral learning across the lifespan'),
('culture', 'cross_cultural_variation', 0.15, 'Variation and overlap in moral judgment across cultures'),
('technology', 'technology_amplification', 0.15, 'Digital moral amplification outrage visibility and networked judgment'),
('moral_injury', 'moral_injury_burden', 0.20, 'Moral injury institutional betrayal conscience and repair');

INSERT INTO scenario_notes (scenario, description) VALUES
('baseline', 'Average levels of all moral-psychological pressure domains'),
('high_polarization', 'Elevated political polarization and moralized public conflict'),
('high_organizational_risk', 'Elevated organizational risk responsibility diffusion and ethical fading'),
('high_technology_amplification', 'Elevated digital amplification outrage visibility and social reward pressure'),
('high_moral_injury', 'Elevated moral injury burden institutional betrayal and conscience strain'),
('combined_pressure', 'High pressure across politics organizations technology and moral injury');
