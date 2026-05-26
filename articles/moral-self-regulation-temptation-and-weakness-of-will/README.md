# Moral Self-Regulation, Temptation, and Weakness of Will

This article-level repository folder supports the article **“Moral Self-Regulation, Temptation, and Weakness of Will.”** It provides reproducible scaffolding for synthetic data, temptation and self-regulation models, weakness-of-will simulations, intention-maintenance scenarios, rationalization analysis, repair-capacity modeling, institutional temptation examples, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that moral self-regulation is the practical architecture that allows moral judgment, moral identity, conscience, and intention to survive contact with pressure. Weakness of will is not simply a mysterious defect in character. It is a patterned breakdown in the relation between judgment, desire, attention, habit, emotion, fatigue, social context, institutional incentives, and self-deception.

## Purpose

This folder supports transparent, reproducible exploration of moral self-regulation and weakness of will, especially:

- moral judgment
- temptation intensity
- fatigue
- situational pressure
- self-regulatory capacity
- moral identity
- rationalization tendency
- intention maintenance
- weakness of will
- judgment-action gaps
- moral action probability
- guilt recognition
- humility
- accountability
- defensiveness
- repair capacity
- high-judgment low-action cases
- high-weakness low-repair cases
- institutional temptation
- self-deception and moral failure

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real persons, students, employees, leaders, organizations, institutions, communities, cultures, professions, political groups, or moral worth.

## Folder structure

```text
moral-self-regulation-temptation-and-weakness-of-will/
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

Moral self-regulation can be modeled as the interaction between endorsed ethical judgment, competing temptation, and regulatory capacity:

\[
A_i = \sigma(\alpha J_i + \beta R_i - \gamma T_i - \delta P_i + \varepsilon_i)
\]

where:

- \(A_i\) = moral action probability or realized action
- \(J_i\) = moral judgment strength
- \(R_i\) = self-regulatory capacity
- \(T_i\) = temptation intensity
- \(P_i\) = situational pressure
- \(\sigma\) = logistic transformation

Weakness of will can be represented as the gap between endorsed judgment and realized conduct:

\[
W_i = J_i - A_i
\]

Intention maintenance across time can be represented as:

\[
I_i(t+1) = I_i(t) + \lambda J_i - \mu T_i - \nu F_i
\]

where intention strength rises with judgment support and erodes under temptation and fatigue.

A repair-oriented model can represent self-regulation after failure:

\[
Q_i = \omega_1 G_i + \omega_2 H_i + \omega_3 A_i - \omega_4 D_i
\]

where repair capacity rises with guilt recognition, humility, and accountability, but falls under defensiveness.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-self-regulation-temptation-and-weakness-of-will
python3 python/simulate_moral_self_regulation.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-self-regulation-temptation-and-weakness-of-will
Rscript r/model_moral_self_regulation.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-self-regulation-temptation-and-weakness-of-will
sqlite3 outputs/tables/moral_self_regulation.sqlite < sql/schema.sql
sqlite3 outputs/tables/moral_self_regulation.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not willpower assessment tools, moral-risk scoring systems, employee-screening systems, student-assessment systems, workplace-surveillance systems, psychological assessments, legal tools, hiring tools, promotion tools, or automated moral judgment systems.

The goal is to clarify how temptation, fatigue, self-regulation, moral identity, rationalization, situational pressure, intention maintenance, weakness of will, and repair capacity shape moral action across different contexts. The scaffold should not be used to evaluate real persons, employees, students, leaders, workers, organizations, institutions, communities, cultures, political groups, professions, or moral worth.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/moral-self-regulation-temptation-and-weakness-of-will
