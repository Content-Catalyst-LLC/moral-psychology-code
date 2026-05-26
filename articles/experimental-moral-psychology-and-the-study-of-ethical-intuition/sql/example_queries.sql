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
    condition,
    description,
    expected_design_role
FROM power_conditions
ORDER BY condition;

SELECT
    design_feature,
    methodological_value,
    methodological_risk
FROM experimental_design_notes
ORDER BY design_feature;
