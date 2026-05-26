-- SQLite schema for synthetic What Is Moral Psychology scaffold.
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
('case', 'person_id', 'Synthetic person identifier', 'Not real personal data'),
('case', 'org_id', 'Synthetic organization identifier', 'Not a real organization'),
('individual', 'moral_identity', 'Synthetic integration of moral commitments into self-concept', 'Not a real moral identity assessment'),
('individual', 'empathic_concern', 'Synthetic concern for suffering vulnerability and need', 'Not a real empathy assessment'),
('individual', 'self_regulation', 'Synthetic capacity for restraint consistency and action under pressure', 'Not a real self-control assessment'),
('individual', 'social_desirability', 'Synthetic tendency to present oneself favorably', 'Not a real response-bias assessment'),
('perception', 'moral_salience', 'Synthetic visibility and urgency of moral features', 'Not a real moral perception score'),
('judgment', 'moral_judgment', 'Synthetic explicit moral endorsement or judgment', 'Not a real moral truth measure'),
('action', 'moral_action', 'Synthetic enacted moral conduct indicator or score', 'Not a real behavior record'),
('gap', 'judgment_action_gap', 'Synthetic difference between endorsed judgment and enacted conduct', 'Not a real moral failure diagnosis'),
('institution', 'institutional_pressure', 'Synthetic pressure that suppresses moral action', 'Not a real institutional audit'),
('institution', 'accountability_climate', 'Synthetic institutional support for accountability', 'Not a real climate survey'),
('institution', 'repair_infrastructure', 'Synthetic availability of apology restitution redesign and follow-up', 'Not a real repair-system audit'),
('institution', 'retaliation_risk', 'Synthetic risk attached to truth-telling or moral action', 'Not a real retaliation assessment'),
('environment', 'high_risk_moral_environment', 'Synthetic high-gap environment', 'Not a real organization classification');

INSERT INTO scenario_notes VALUES
('baseline', 'Average moral identity self-regulation empathy institutional pressure accountability and repair', 'Moderate judgment-action gap'),
('high_identity_high_regulation', 'High moral identity and self-regulation', 'Lower judgment-action gap and higher moral action'),
('high_pressure_low_accountability', 'High institutional pressure with weak accountability', 'Higher judgment-action gap'),
('high_repair_high_accountability', 'High repair infrastructure and accountability climate', 'Lower gap and higher action probability'),
('high_retaliation_risk', 'High retaliation risk attached to moral action', 'Larger gap even when judgment is high'),
('high_salience_high_empathy', 'High moral salience and empathic concern', 'Higher judgment and action if pressure is manageable'),
('public_values_private_silence', 'High judgment but low action under pressure', 'Illustrates moral agency breakdown'),
('institutional_support', 'High accountability and repair with lower retaliation', 'Supports translation of judgment into conduct'),
('moral_disengagement_risk', 'High pressure low salience and weak accountability', 'Increases risk that harm becomes normalized');

INSERT INTO risk_factors VALUES
('judgment_action_gap', 'People endorse moral claims but fail to act under pressure', 'Strengthen self-regulation accountability and repair infrastructure'),
('moral_inattention', 'Harm does not become visible as morally relevant', 'Cultivate moral perception affected-person voice and ethical attention'),
('selective_empathy', 'Care is extended to familiar or favored groups only', 'Use principle perspective-taking and institutional fairness checks'),
('identity_defensiveness', 'Moral self-image blocks correction or apology', 'Build humility feedback and repair-oriented accountability'),
('diffusion_of_responsibility', 'Responsibility is spread so widely that no one acts', 'Clarify roles ownership escalation and repair duties'),
('bureaucratic_distance', 'Procedure hides human consequence', 'Connect metrics to lived effects testimony and accountability'),
('retaliation_risk', 'Truth-telling or repair is punished', 'Protect reporting channels and anti-retaliation systems'),
('performative_judgment', 'Public condemnation replaces concrete responsibility', 'Connect judgment to repair follow-up and proportionality'),
('institutional_blindness', 'Systems make harm difficult to perceive report or correct', 'Audit incentives categories reporting and harmed-party experience'),
('moral_disengagement', 'Harm is justified minimized euphemized or displaced', 'Name mechanisms preserve dignity and strengthen accountability');
