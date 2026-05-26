.headers on
.mode column

SELECT
    construct,
    indicator_type,
    example_measure,
    measurement_warning
FROM construct_map
ORDER BY construct;

SELECT
    condition,
    description,
    expected_design_role
FROM experimental_conditions
ORDER BY condition;

SELECT
    design_type,
    strength,
    risk,
    best_use
FROM design_types
ORDER BY design_type;
