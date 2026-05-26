-- SQLite schema for synthetic Moral Development Across Adulthood and Aging scaffold.
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
('age', 'age', 'Synthetic adult age from 18 to 85', 'Not real demographic data'),
('band', 'adulthood_band', 'Synthetic adult lifespan band', 'Not a clinical or developmental classification'),
('identity', 'moral_identity', 'Synthetic moral identity integration', 'Not a real moral identity assessment'),
('prosociality', 'prosocial_orientation', 'Synthetic prosocial orientation or care for others', 'Not a real altruism measure'),
('role', 'role_complexity', 'Synthetic adult role complexity and responsibility', 'Not a real family or workplace assessment'),
('emotion', 'moral_emotion_profile', 'Synthetic moral-emotional profile including empathy guilt pride regret and compassion', 'Not a psychological assessment'),
('decision', 'decision_capacity', 'Synthetic cognitive-social decision capacity', 'Not a cognitive test'),
('generativity', 'generativity', 'Synthetic long-horizon concern legacy and intergenerational care', 'Not a real generativity measure'),
('burden', 'caregiving_burden', 'Synthetic burden depletion or care fatigue', 'Not a caregiver assessment'),
('loss', 'loss_reflection', 'Synthetic loss-driven reflection or relational reorientation', 'Not a grief or mental health measure'),
('voice', 'voice_safety', 'Synthetic protection for speaking warning dissenting or reporting', 'Not an institutional audit'),
('accountability', 'accountability_strength', 'Synthetic accountability review and responsibility structure', 'Not a governance audit'),
('profile', 'latent_moral_development', 'Synthetic adult moral-development profile', 'Not a real moral-development score'),
('action', 'moral_action_probability', 'Synthetic probability of moral action', 'Not a prediction of real conduct'),
('case', 'high_development_low_action', 'Synthetic cases with strong profile but low action under burden', 'Not a real-person risk classification');

INSERT INTO scenario_notes VALUES
('baseline', 'Average age identity prosociality role complexity emotion decision capacity burden and accountability', 'Moderate synthetic moral-development profile'),
('emerging_adulthood_identity', 'High moral identity in emerging adulthood', 'Higher moral-development profile through identity formation'),
('midlife_role_complexity', 'High role complexity in midlife', 'Higher responsibility but possible pressure and burden'),
('older_adulthood_generativity', 'High generativity in older adulthood', 'Higher prosocial and legacy-oriented profile'),
('high_burden_low_action', 'High moral-development profile with high caregiving burden and weak support', 'Lower moral action probability'),
('loss_reflection_repair', 'High loss reflection with accountability', 'Higher repair-oriented moral profile'),
('high_voice_safety', 'Strong voice safety and accountability', 'Higher moral action probability'),
('low_support_high_pressure', 'Low voice safety with high burden and pressure', 'Lower ethical expression despite adult commitments');

INSERT INTO risk_factors VALUES
('developmental_closure', 'Adulthood is treated as morally finished after adolescence', 'Lifespan framing and adult role analysis'),
('romantic_aging', 'Aging is assumed to automatically produce wisdom', 'Nonlinear models and evidence-based aging interpretation'),
('decline_reductionism', 'Aging is treated only as loss or decline', 'Dignity-centered models of changing capacity and agency'),
('care_burden', 'Caregiving responsibility narrows moral capacity through exhaustion', 'Shared care infrastructure respite and social support'),
('institutional_pressure', 'Work and institutions suppress conscience and moral action', 'Voice safety accountability and role responsibility mapping'),
('regret_without_repair', 'Regret becomes rumination or defensiveness rather than action', 'Apology restitution testimony and changed conduct'),
('identity_defensiveness', 'Lifetime moral self-story blocks correction', 'Humility evidence and affected-person testimony'),
('ageism', 'Older adults are treated as less visible or less morally agentic', 'Dignity autonomy voice and participatory care design');
