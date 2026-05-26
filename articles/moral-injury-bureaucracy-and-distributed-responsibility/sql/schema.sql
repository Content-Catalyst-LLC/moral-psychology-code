-- SQLite schema for synthetic Moral Injury, Bureaucracy, and Distributed Responsibility scaffold.
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
('conscience', 'conscience_conflict', 'Conflict between personal or professional moral standards and required action', 'Not a diagnosis or individual trait score'),
('betrayal', 'institutional_betrayal', 'Perceived betrayal by authority leadership peers or institution', 'Must be interpreted in institutional context'),
('distribution', 'distributed_responsibility', 'Fragmentation of agency and accountability across roles and procedures', 'Does not mean responsibility disappears'),
('exposure', 'morally_injurious_exposure', 'Exposure to morally injurious events conditions or recurring institutional harm', 'Exposure is synthetic and not clinical evidence'),
('scarcity', 'scarcity_constraint', 'Resource or staffing constraint that prevents morally adequate action', 'Scarcity may be produced by policy or governance choices'),
('accountability', 'accountability_clarity', 'Clarity of agency escalation authority and responsibility', 'High clarity may reduce ambiguity and moral burden'),
('opacity', 'organizational_opacity', 'Unclear decision pathways rules or causal chains', 'Opacity can intensify many-hands conditions'),
('voice', 'protected_voice', 'Protected capacity to raise ethical concerns without retaliation', 'Voice must be institutionally credible to matter'),
('repair', 'repair_capacity', 'Ability of the institution to acknowledge harm and change conditions', 'Repair requires more than individual resilience'),
('injury', 'moral_injury_risk', 'Synthetic risk value representing modeled moral injury pressure', 'Not a real-person clinical or occupational assessment');

INSERT INTO scenario_notes VALUES
('baseline', 'Average conflict betrayal responsibility distribution scarcity and accountability', 'Moderate synthetic moral injury risk'),
('high_betrayal', 'High institutional betrayal with average accountability', 'Higher synthetic moral injury risk'),
('low_accountability', 'Low accountability clarity with average betrayal', 'Higher ambiguity and many-hands pressure'),
('high_scarcity', 'High scarcity constraint with average accountability', 'Higher rule-conscience and care-capacity strain'),
('high_voice', 'High protected voice and repair capacity', 'Lower synthetic moral injury risk'),
('combined_escalation', 'High betrayal high scarcity high distribution low accountability low voice', 'Highest synthetic moral injury risk');

INSERT INTO risk_factors VALUES
('many_hands', 'Responsibility is spread across actors procedures and offices', 'Clear ownership escalation paths and auditability'),
('institutional_betrayal', 'Trusted authority violates professional moral purpose', 'Accountable leadership and credible acknowledgment'),
('rule_conscience_conflict', 'Policy requires action contrary to moral judgment', 'Ethical discretion exception pathways and appeal processes'),
('scarcity_constraint', 'Resource limitations block morally adequate action', 'Staffing resources triage transparency and public accountability'),
('organizational_opacity', 'Harm pathways are hidden by procedure or hierarchy', 'Transparent decision records and responsibility mapping'),
('retaliation_risk', 'Workers fear speaking about moral conflict', 'Protected voice whistleblower support and psychological safety'),
('bureaucratic_distance', 'Human need becomes file code case or metric', 'Relational accountability and client-centered review'),
('repair_failure', 'Institution refuses to acknowledge or change harm-producing conditions', 'Institutional courage and structural reform');
