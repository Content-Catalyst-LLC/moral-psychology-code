-- SQLite schema for synthetic Punishment, Forgiveness, and Moral Repair scaffold.
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
('wrongdoing', 'wrongdoing_severity', 'Synthetic seriousness of the wrong or harm', 'Not a real case severity score'),
('responsibility', 'offender_responsibility', 'Synthetic perceived responsibility of the wrongdoer', 'Not a legal or clinical responsibility assessment'),
('norms', 'norm_reaffirmation_need', 'Synthetic need to publicly reaffirm violated norms', 'Norm reaffirmation can be symbolic if not linked to repair'),
('acknowledgment', 'acknowledgment', 'Synthetic acknowledgment or truth-telling by wrongdoer or institution', 'Words alone do not equal repair'),
('amends', 'amends', 'Synthetic making-amends or repentant action', 'Amends must be tied to material and relational context'),
('threat', 'ongoing_threat', 'Synthetic ongoing threat or unresolved harm', 'High threat may make forgiveness unsafe or premature'),
('restitution', 'restitution', 'Synthetic restitution or compensation', 'Not a real reparations calculation'),
('trust', 'institutional_trust', 'Synthetic trust in institutions or procedures', 'Trust depends on legitimacy accountability and history'),
('recognition', 'victim_recognition', 'Synthetic recognition of harmed person or group standing', 'Recognition should not be performed without agency'),
('reform', 'structural_reform', 'Synthetic structural or institutional reform effort', 'Reform must be evaluated in context'),
('punishment', 'punishment_score', 'Synthetic punishment or sanction intensity', 'Not a sentencing tool'),
('forgiveness', 'forgiveness_probability', 'Synthetic probability of forgiveness under modeled conditions', 'Not a victim expectation or moral requirement'),
('repair', 'moral_repair', 'Synthetic moral-repair outcome', 'Not an assessment of real healing or justice');

INSERT INTO scenario_notes VALUES
('baseline', 'Average wrongdoing responsibility acknowledgment amends threat and restitution', 'Moderate synthetic punishment forgiveness and repair'),
('high_wrongdoing_high_responsibility', 'High severity and high responsibility', 'Higher synthetic punishment score'),
('high_acknowledgment_low_threat', 'High acknowledgment and low ongoing threat', 'Higher synthetic forgiveness probability'),
('high_threat_low_acknowledgment', 'High threat and weak acknowledgment', 'Lower forgiveness and lower repair'),
('high_restitution_high_recognition', 'High restitution and victim recognition', 'Higher synthetic moral repair'),
('punishment_without_repair', 'High punishment but low acknowledgment restitution and reform', 'Norm response without deep repair'),
('repair_oriented_response', 'High acknowledgment restitution recognition trust and reform', 'Higher synthetic moral repair'),
('public_repair_failure', 'High denial low truth-telling low accountability and low reform', 'Lower synthetic public repair');

INSERT INTO risk_factors VALUES
('punitive_simplification', 'Punishment is treated as the whole of justice', 'Repair mapping and victim-centered needs assessment'),
('sentimental_reconciliation', 'Forgiveness or reconciliation is demanded before truth and safety', 'Protect victim agency and distinguish forgiveness from reconciliation'),
('symbolic_closure', 'Public sanction or apology is used to close the case without repair', 'Track restitution reform and long-term accountability'),
('forgiveness_pressure', 'Victims are pressured to forgive for others comfort', 'Respect refusal boundaries and unresolved threat'),
('empty_apology', 'Regret is expressed without responsibility or amends', 'Require acknowledgment restitution and changed conduct'),
('institutional_self_protection', 'Organizations use repair language to protect reputation', 'Independent investigation and public accountability'),
('restorative_coercion', 'Restorative processes are imposed despite power imbalance or danger', 'Voluntary participation safeguards and trauma-informed process'),
('selective_punishment', 'Powerless actors are punished while powerful actors are protected', 'Equal standards transparent procedures and oversight');
