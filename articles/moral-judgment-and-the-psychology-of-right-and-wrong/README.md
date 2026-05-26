# Moral Judgment and the Psychology of Right and Wrong

This article-level repository folder supports the article **“Moral Judgment and the Psychology of Right and Wrong.”** It provides reproducible scaffolding for synthetic data, moral judgment models, wrongness and blame analysis, responsibility and agency modeling, repair-oriented response scenarios, social-pressure simulations, digital judgment examples, institutional accountability scenarios, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that moral judgment is not a simple or unitary faculty. It involves perception, salience, emotion, intention attribution, causal interpretation, norm representation, cultural background, group identity, institutional context, social meaning, and the difficult relation between what people judge and what they actually do.

## Purpose

This folder supports transparent, reproducible exploration of moral judgment, especially:

- moral judgment
- wrongness judgment
- blame judgment
- norm violation
- perceived harm
- inferred intention
- emotional activation
- ideological framing
- group framing
- social pressure
- situational ambiguity
- perceived agency
- repair opportunity
- dignity preservation
- punitive pressure
- institutional support
- constructive response
- high-pressure judgment cases
- low-repair high-blame cases
- wrongness-blame divergence cases
- digital public condemnation
- institutional accountability
- repair-oriented judgment

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real persons, students, employees, leaders, organizations, institutions, communities, cultures, professions, religious communities, political groups, or moral worth.

## Folder structure

```text
moral-judgment-and-the-psychology-of-right-and-wrong/
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

Moral judgment can be modeled as a multi-component evaluative process:

\[
J_i = f(H_i, N_i, I_i, E_i, C_i, S_i)
\]

where:

- \(J_i\) = moral judgment
- \(H_i\) = perceived harm
- \(N_i\) = perceived norm violation
- \(I_i\) = inferred intention
- \(E_i\) = emotional activation
- \(C_i\) = cultural or ideological framing
- \(S_i\) = situational interpretation

A latent-score model can be written as:

\[
J_i^* = \alpha H_i + \beta N_i + \gamma I_i + \delta E_i + \eta C_i + \lambda S_i + \varepsilon_i
\]

The probability that an act is judged morally wrong can be represented as:

\[
P(Y_i = 1) = \sigma(J_i^*)
\]

Wrongness and blame can be distinguished:

\[
W_i = \theta_0 + \theta_1 H_i + \theta_2 N_i + \theta_3 I_i + u_i
\]

\[
B_i = \phi_0 + \phi_1 W_i + \phi_2 A_i + \phi_3 R_i + v_i
\]

where \(W_i\) is wrongness, \(B_i\) is blame, \(A_i\) is perceived agency, and \(R_i\) is a repair or excuse condition.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-judgment-and-the-psychology-of-right-and-wrong
python3 python/simulate_moral_judgment.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-judgment-and-the-psychology-of-right-and-wrong
Rscript r/model_moral_judgment.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-judgment-and-the-psychology-of-right-and-wrong
sqlite3 outputs/tables/moral_judgment.sqlite < sql/schema.sql
sqlite3 outputs/tables/moral_judgment.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not moral-judgment assessments, blame scores, psychological assessments, employee-screening systems, student-assessment systems, workplace-surveillance systems, legal tools, hiring tools, promotion tools, moral-worth measures, or automated moral judgment systems.

The goal is to clarify how harm perception, norm violation, intention attribution, emotion, framing, social pressure, agency, repair pathways, institutional support, and punitive pressure shape judgments of right, wrong, blame, accountability, and constructive moral response. The scaffold should not be used to evaluate real persons, employees, students, leaders, workers, organizations, institutions, communities, cultures, religious communities, political groups, professions, or moral worth.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/moral-judgment-and-the-psychology-of-right-and-wrong
