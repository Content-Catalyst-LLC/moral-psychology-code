-- SQLite schema for synthetic Prosocial Behavior, Altruism, and Care scaffold.
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
('case', 'case_id', 'Synthetic case identifier', 'Not real personal data'),
('empathy', 'empathic_concern', 'Synthetic empathic concern for another person''s welfare', 'Not a real empathy assessment'),
('norm', 'norm_strength', 'Synthetic social or moral norm strength', 'Not a real norm audit'),
('relationship', 'relational_closeness', 'Synthetic closeness or felt responsibility', 'Not a real relationship measure'),
('vulnerability', 'visible_vulnerability', 'Synthetic visibility of another person''s need or vulnerability', 'Not a real recipient-needs assessment'),
('cost', 'perceived_cost', 'Synthetic cost of helping', 'Not a real burden assessment'),
('support', 'institutional_support', 'Synthetic institutional support for prosocial response', 'Not a workplace school or policy audit'),
('action', 'prosocial_probability', 'Synthetic probability of prosocial action', 'Not a prediction of real conduct'),
('action', 'prosocial_action', 'Synthetic binary prosocial action indicator', 'Not real behavior'),
('motive', 'other_oriented_desire', 'Synthetic desire to benefit another for that person''s sake', 'Not a real altruism assessment'),
('motive', 'self_oriented_payoff', 'Synthetic self-oriented payoff salience', 'Not a real motive assessment'),
('motive', 'altruistic_motive', 'Synthetic altruistic motive strength', 'Not a real altruism score'),
('care', 'attentional_responsiveness', 'Synthetic attentiveness to need over time', 'Not a real care measure'),
('care', 'ongoing_need', 'Synthetic ongoing need or dependence', 'Not a real needs assessment'),
('care', 'burnout', 'Synthetic burnout or depletion pressure', 'Not a burnout diagnosis'),
('care', 'voice_safety', 'Synthetic protection for speaking about unmet care or harm', 'Not a psychological safety assessment'),
('care', 'caregiving_persistence', 'Synthetic sustained care response', 'Not a real caregiving assessment'),
('case_type', 'high_empathy_low_action', 'Synthetic cases with high empathy but low action', 'Not a real-person risk classification'),
('case_type', 'high_burden_care_cases', 'Synthetic high-need high-burnout cases', 'Not a real caregiver or recipient classification');

INSERT INTO scenario_notes VALUES
('baseline', 'Average empathy norms closeness vulnerability cost support burnout and care conditions', 'Moderate synthetic prosocial action probability'),
('high_empathy_low_cost', 'High empathic concern with low perceived cost', 'Higher prosocial action probability'),
('high_empathy_high_cost', 'High empathic concern with high perceived cost', 'Helping may be constrained despite concern'),
('strong_norms_weak_empathy', 'Strong norm pressure with weak empathic concern', 'Prosocial action may occur through obligation or compliance'),
('high_vulnerability_high_responsibility', 'Visible vulnerability and strong relational closeness', 'Higher helping and care response'),
('high_other_concern_low_self_payoff', 'Other-oriented desire dominates self-oriented payoff', 'Higher altruistic motive strength'),
('high_need_high_support', 'Ongoing need with institutional support', 'Higher caregiving persistence'),
('high_need_high_burnout', 'Ongoing need with high burnout and weak support', 'Lower caregiving persistence'),
('high_empathy_low_action', 'High empathy but high cost weak support or low norm clarity', 'Illustrates empathy-action gap');

INSERT INTO risk_factors VALUES
('prosocial_reductionism', 'All beneficial action is treated as one psychological mechanism', 'Distinguish helping altruistic motive cooperation sacrifice and care'),
('motive_purity_error', 'Mixed motives are treated as moral failure', 'Assess whether other-oriented concern is genuinely present and causally important'),
('empathy_action_gap', 'Empathic concern fails to become action under cost ambiguity or diffusion', 'Clarify responsibility reduce cost and create feasible response channels'),
('selective_empathy', 'Concern favors familiar visible or similar others', 'Widen moral recognition through testimony contact and justice norms'),
('reputation_performance', 'Helping becomes image management', 'Test action under low visibility and recipient-centered conditions'),
('reciprocity_exclusion', 'Support is limited to those who can repay', 'Include dependence vulnerability and nonreciprocal care obligations'),
('care_burnout', 'Repeated need and weak support exhaust caregiving persistence', 'Provide rest staffing shared responsibility and institutional support'),
('institutional_hypocrisy', 'Institutions praise care while denying conditions for care', 'Align workload metrics resources incentives and accountability'),
('care_domination', 'Helping overrides recipient agency or dignity', 'Use consent participation listening and respect for agency'),
('responsibility_diffusion', 'Everyone assumes someone else will help', 'Clarify ownership roles escalation and follow-up');
