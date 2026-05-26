-- SQLite schema for synthetic Situationism, Character, and Virtue Stability scaffold.
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
('person', 'person_id', 'Synthetic person identifier', 'Not real personal data'),
('situation', 'situation_id', 'Synthetic situation identifier', 'Not real institutional data'),
('character', 'character_strength', 'Synthetic character strength or virtue-relevant tendency', 'Not a real virtue or moral worth score'),
('self_regulation', 'self_regulation', 'Synthetic self-regulatory capacity', 'Not a psychological assessment'),
('habit', 'habit_strength', 'Synthetic practiced moral habit strength', 'Not a real habit assessment'),
('identity', 'moral_identity', 'Synthetic moral identity centrality', 'Not a real moral identity score'),
('depletion', 'depletion', 'Synthetic depletion fatigue or stress', 'Not a health or psychological measure'),
('pressure', 'situational_pressure', 'Synthetic contextual pressure against moral action', 'Not a real situational audit'),
('voice', 'voice_safety', 'Synthetic protection for warning dissent correction and truth-telling', 'Not a workplace or school assessment'),
('accountability', 'accountability_visibility', 'Synthetic visibility of answerability review and consequence', 'Not a governance audit'),
('interaction', 'character_pressure_interaction', 'Synthetic character-by-pressure interaction', 'Not an empirical interaction estimate'),
('action', 'moral_action_probability', 'Synthetic probability of moral action', 'Not a prediction of real conduct'),
('case', 'high_character_low_action', 'Synthetic cases with high character but low action under pressure', 'Not a real-person risk classification'),
('signature', 'if_then_signature', 'Synthetic situation-linked response pattern', 'Not a personality or character assessment');

INSERT INTO scenario_notes VALUES
('baseline', 'Average character self-regulation habit identity depletion pressure voice safety and accountability', 'Moderate synthetic moral action probability'),
('low_pressure_high_accountability', 'Low situational pressure with high accountability visibility', 'Higher moral action probability'),
('high_pressure_low_voice', 'High pressure with weak voice safety', 'Lower moral action probability'),
('high_character_high_pressure', 'High character strength under high situational pressure', 'Character helps but pressure may suppress action'),
('high_habit_high_pressure', 'Strong habit strength under high pressure', 'Higher resilience than character alone'),
('high_identity_high_depletion', 'Strong moral identity with high depletion', 'Identity supports action but depletion weakens reliability'),
('high_character_low_action', 'High character but high pressure low voice safety and low accountability', 'Illustrates virtue fragility'),
('supportive_institution', 'High voice safety and accountability with moderate pressure', 'Institution supports virtue expression');

INSERT INTO risk_factors VALUES
('heroic_globalism', 'Virtue is treated as flawless cross-situational consistency', 'Use situated reliability and repeated-measures models'),
('radical_situationism', 'Context is treated as eliminating character', 'Model person effects habit identity and resistance patterns'),
('moral_overconfidence', 'People overestimate how well they will act under pressure', 'Precommitment scripts rehearsal and humility practices'),
('authority_pressure', 'Hierarchy suppresses dissent and moral courage', 'Protected escalation refusal rights and leadership accountability'),
('responsibility_diffusion', 'Shared roles make no one feel accountable', 'Responsibility mapping and end-to-end ownership'),
('time_pressure', 'Hurry narrows attention and reduces helping or reflection', 'Decision pauses workload design and ethical review points'),
('depletion', 'Fatigue stress and overload weaken self-regulation', 'Rest staffing sustainable workload and shared care'),
('low_voice_safety', 'Fear of retaliation suppresses truth-telling', 'Whistleblower protection psychological safety and correction norms'),
('hidden_harm', 'Distance and abstraction hide affected persons', 'Human impact visibility testimony and consequence tracking'),
('virtue_branding', 'Character language becomes self-image rather than conduct', 'Evidence accountability repair and cost-bearing action');
