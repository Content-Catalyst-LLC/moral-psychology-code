.headers on
.mode column

SELECT
    period,
    year_mid,
    sentiment,
    reason,
    development,
    intuition,
    culture_politics,
    neuroscience_experiment,
    institutions
FROM historical_periods
ORDER BY year_mid;

SELECT
    period,
    major_figures_or_traditions,
    central_question,
    historical_contribution,
    limitation_or_risk
FROM paradigm_notes
ORDER BY (
    SELECT year_mid
    FROM historical_periods
    WHERE historical_periods.period = paradigm_notes.period
);

SELECT
    risk_factor,
    mechanism,
    possible_dampener
FROM risk_factors
ORDER BY risk_factor;
