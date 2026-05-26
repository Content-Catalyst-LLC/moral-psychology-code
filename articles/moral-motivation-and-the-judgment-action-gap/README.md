# Moral Motivation and the Judgment–Action Gap

This article-level repository folder supports the article **“Moral Motivation and the Judgment–Action Gap.”** It provides reproducible scaffolding for synthetic data, judgment-action models, moral-motivation simulations, pressure-sensitivity scenarios, rationalization analysis, repair-capacity modeling, institutional motivation examples, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that moral motivation is the practical force that carries moral judgment into conduct. The judgment–action gap is not a single defect. It is a layered breakdown across perception, judgment, emotion, identity, desire, habit, self-regulation, institutional setting, and opportunity for repair.

## Purpose

This folder supports transparent, reproducible exploration of moral motivation and the judgment–action gap, especially:

- moral judgment
- emotional activation
- moral identity
- self-regulation
- situational pressure
- rationalization tendency
- moral action probability
- judgment-action gap
- high-judgment low-action cases
- large-gap low-repair cases
- guilt recognition
- humility
- accountability
- defensiveness
- repair capacity
- institutional motivational design
- moral licensing
- fatigue and motivational failure
- motivation under conformity and pressure

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real persons, students, employees, leaders, organizations, institutions, communities, cultures, professions, political groups, or moral worth.

## Folder structure

```text
moral-motivation-and-the-judgment-action-gap/
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

The judgment-action gap can be represented as:

\[
G_i = J_i - A_i
\]

where:

- \(G_i\) = judgment-action gap
- \(J_i\) = moral judgment strength
- \(A_i\) = moral action

Moral action can be modeled as:

\[
A_i = \sigma(\alpha J_i + \beta E_i + \gamma I_i + \delta R_i - \lambda P_i + \varepsilon_i)
\]

where:

- \(J_i\) = moral judgment strength
- \(E_i\) = emotional activation
- \(I_i\) = moral identity strength
- \(R_i\) = self-regulatory capacity
- \(P_i\) = situational pressure
- \(\sigma\) = logistic transformation

The judgment-action gap can also be modeled directly as:

\[
G_i = \theta_0 + \theta_1 P_i - \theta_2 I_i - \theta_3 R_i - \theta_4 E_i + u_i
\]

A repair-oriented model can be represented as:

\[
Q_i = \omega_1 Guilt_i + \omega_2 Humility_i + \omega_3 Accountability_i - \omega_4 Defensiveness_i
\]

where repair capacity rises with guilt recognition, humility, and accountability, but falls under defensiveness.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-motivation-and-the-judgment-action-gap
python3 python/simulate_moral_motivation_gap.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-motivation-and-the-judgment-action-gap
Rscript r/model_moral_motivation_gap.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-motivation-and-the-judgment-action-gap
sqlite3 outputs/tables/moral_motivation_gap.sqlite < sql/schema.sql
sqlite3 outputs/tables/moral_motivation_gap.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not moral-risk scoring systems, employee-screening systems, student-assessment systems, workplace-surveillance systems, psychological assessments, legal tools, hiring tools, promotion tools, moral-worth measures, or automated moral judgment systems.

The goal is to clarify how judgment, emotion, identity, self-regulation, situational pressure, rationalization, institutional design, and repair capacity shape the difficult passage from knowing what is right to actually doing it. The scaffold should not be used to evaluate real persons, employees, students, leaders, workers, organizations, institutions, communities, cultures, political groups, professions, or moral worth.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/moral-motivation-and-the-judgment-action-gap
