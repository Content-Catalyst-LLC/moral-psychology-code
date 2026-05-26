.headers on
.mode column

SELECT
    domain,
    variable,
    weight,
    description
FROM domain_weights
ORDER BY weight DESC;

SELECT
    ROUND(SUM(weight), 3) AS total_model_weight
FROM domain_weights;

SELECT
    scenario,
    description
FROM scenario_notes
ORDER BY scenario;
