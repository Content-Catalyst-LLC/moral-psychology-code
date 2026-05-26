# What Is Moral Psychology?

This article-level repository folder supports the article **“What Is Moral Psychology?”** It provides reproducible scaffolding for synthetic data, moral agency models, judgment-action gap analysis, moral salience simulations, institutional pressure scenarios, accountability climate modeling, repair infrastructure examples, moral identity and self-regulation workflows, documentation, SQL schema, notebooks, and multi-language computational examples.

The article defines moral psychology as the study of moral life as it is actually lived: how people notice, feel, judge, justify, restrain themselves, fail, repair, and form identities within relationships and institutions. It treats moral agency as a multi-level system rather than as a single faculty of reason, emotion, character, or institutional context.

## Purpose

This folder supports transparent, reproducible exploration of moral psychology, especially:

- moral perception
- moral salience
- moral judgment
- moral emotion
- moral identity
- empathic concern
- moral self-regulation
- judgment-action gaps
- institutional pressure
- accountability climate
- repair infrastructure
- retaliation risk
- moral environments
- moral action under pressure
- moral failure
- moral disengagement
- institutional blindness
- responsibility diffusion
- high-risk moral environments
- person-environment moral agency models

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real persons, employees, students, organizations, institutions, communities, cultures, political groups, religious communities, professions, or moral worth.

## Folder structure

```text
what-is-moral-psychology/
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

Moral action can be represented as a joint function of perception, judgment, emotion, identity, self-regulation, and situational pressure:

\[
M_t = f(P_t, J_t, E_t, I_t, R_t, S_t)
\]

where:

- \(M_t\) = morally relevant action at time \(t\)
- \(P_t\) = moral perception or salience
- \(J_t\) = explicit moral judgment
- \(E_t\) = moral-emotional activation
- \(I_t\) = moral identity strength
- \(R_t\) = self-regulatory capacity
- \(S_t\) = situational or institutional pressure

A simple logistic specification is:

\[
M_t = \sigma(\alpha P_t + \beta J_t + \gamma E_t + \delta I_t + \eta R_t - \lambda S_t)
\]

The judgment-action gap can be represented as:

\[
G_t = J_t - M_t
\]

In institutional settings, the gap can widen under diffusion of responsibility, bureaucratic distance, accountability asymmetry, and retaliation risk:

\[
G_t = \theta_0 + \theta_1 D_t + \theta_2 B_t + \theta_3 A_t + \theta_4 T_t - \theta_5 C_t + \varepsilon_t
\]

where \(D_t\) is diffusion of responsibility, \(B_t\) bureaucratic distance, \(A_t\) accountability asymmetry, \(T_t\) retaliation risk, and \(C_t\) accountability climate.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/what-is-moral-psychology
python3 python/simulate_moral_agency.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/what-is-moral-psychology
Rscript r/model_judgment_action_gap.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/what-is-moral-psychology
sqlite3 outputs/tables/what_is_moral_psychology.sqlite < sql/schema.sql
sqlite3 outputs/tables/what_is_moral_psychology.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not psychological assessments, moral-worth scores, employee-screening systems, student-assessment systems, workplace-surveillance systems, hiring tools, promotion tools, legal tools, disciplinary systems, or automated moral judgment systems.

The goal is to clarify how moral perception, judgment, emotion, identity, self-regulation, institutional pressure, accountability, repair infrastructure, and social environments shape moral agency and the gap between endorsed values and enacted conduct.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/what-is-moral-psychology
