.headers on
.mode column

SELECT
    component,
    variable,
    description,
    interpretive_warning
FROM component_map
ORDER BY component;

SELECT
    scenario,
    description,
    expected_pattern
FROM scenario_notes
ORDER BY scenario;

SELECT
    risk_factor,
    mechanism,
    possible_dampener
FROM risk_factors
ORDER BY risk_factor;
