# Cross-Cultural Moral Psychology

This article-level repository folder supports the article **“Cross-Cultural Moral Psychology.”** It provides reproducible scaffolding for synthetic data, cross-cultural moral-profile modeling, norm-enforcement analysis, moral-weighting scenarios, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that cross-cultural moral psychology must resist two temptations at once: naive universalism, which treats moral cognition as identical everywhere, and crude relativism, which treats moral difference as total incomparability. The strongest view is more demanding: moral judgment varies significantly across cultures and politics while drawing on overlapping human capacities involving intention, causation, suffering, agency, norm learning, cooperation, social evaluation, and the interpretation of harm.

## Purpose

This folder supports transparent, reproducible exploration of cross-cultural moral psychology, especially:

- harm sensitivity
- fairness sensitivity
- loyalty sensitivity
- authority sensitivity
- purity sensitivity
- relational obligation
- norm learning
- sanction expectation
- norm-enforcement tendency
- culturally weighted moral judgment
- moral-profile variation
- cultural disagreement distance
- value pluralism
- measurement caution

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real cultures, nations, religions, ethnic groups, political communities, institutions, or populations.

## Folder structure

```text
cross-cultural-moral-psychology/
├── c/
├── cpp/
├── data/
│   ├── raw/
│   └── processed/
├── docs/
├── fortran/
├── go/
├── julia/
├── notebooks/
├── outputs/
│   ├── figures/
│   └── tables/
├── python/
├── r/
├── rust/
├── sql/
└── README.md
```

## Conceptual model

Cross-cultural moral judgment can be modeled as a common cognitive base filtered through culturally variable weightings:

\[
J_{ic} = \alpha_c H_i + \beta_c F_i + \gamma_c L_i + \delta_c A_i + \varepsilon_{ic}
\]

where:

- \(J_{ic}\) = moral judgment of person \(i\) in cultural context \(c\)
- \(H_i\) = harm perception
- \(F_i\) = fairness sensitivity
- \(L_i\) = loyalty or relational obligation
- \(A_i\) = authority or norm-order sensitivity

A norm-learning model can be written as:

\[
N_i(t+1) = N_i(t) + \lambda S_c + \mu E_i - \rho D_i
\]

where norm internalization changes over time as cultural socialization, reinforcement, sanction, exposure, and individual divergence shape moral learning.

A pluralism-aware model can represent multiple values as simultaneously active:

\[
M_c = \{w_{Hc}, w_{Fc}, w_{Lc}, w_{Ac}, w_{Pc}, w_{Rc}\}
\]

where a cultural moral profile is represented as a vector of value weights, including harm, fairness, loyalty, authority, purity, and relational obligation.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/cross-cultural-moral-psychology
python3 python/simulate_cross_cultural_moral_judgment.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/cross-cultural-moral-psychology
Rscript r/model_cross_cultural_moral_profiles.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/cross-cultural-moral-psychology
sqlite3 outputs/tables/cross_cultural_moral_psychology.sqlite < sql/schema.sql
sqlite3 outputs/tables/cross_cultural_moral_psychology.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not cultural ranking tools, national-character tools, religious-profiling systems, ethnic-classification systems, psychological assessment tools, surveillance systems, persuasion systems, or automated moral judgment systems.

The goal is to clarify how shared moral dimensions can receive different weights across cultural contexts, producing structured variation in moral judgment and norm enforcement. The scaffold should not be used to classify real people, rank cultures, target communities, or replace ethical, anthropological, civic, legal, or institutional judgment.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/cross-cultural-moral-psychology
