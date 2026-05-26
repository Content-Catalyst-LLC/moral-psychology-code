# Moral Perception, Salience, and the Psychology of Ethical Attention

This article-level repository folder supports the article **“Moral Perception, Salience, and the Psychology of Ethical Attention.”** It provides reproducible scaffolding for synthetic data, ethical-attention models, moral-salience simulations, organized-inattention scenarios, institutional visibility analysis, low-attention high-harm case detection, high-salience high-response case analysis, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that moral perception is one of the foundations of ethical agency. People do not encounter a neutral world and then simply add moral judgment afterward. They notice some things and miss others. They see some people as fully vulnerable moral subjects and reduce others to categories, cases, costs, risks, outputs, data points, strangers, or problems. Ethical life depends not only on what people think, but on what they are able—or willing—to see.

## Purpose

This folder supports transparent, reproducible exploration of moral perception, moral salience, and ethical attention, especially:

- moral perception
- moral salience
- ethical attention
- perceived harm
- visible vulnerability
- emotional activation
- mind perception
- contextual framing
- attentional competition
- organized inattention
- focal attention
- moral judgment
- repair pathways
- ethical response tendency
- low-attention high-harm cases
- high-salience high-response cases
- digital attention economies
- institutional visibility
- power, privilege, and the distribution of notice
- organized inattention and administrative moral blindness

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real persons, students, employees, leaders, organizations, institutions, communities, cultures, professions, religious communities, political groups, or moral worth.

## Folder structure

```text
moral-perception-salience-and-the-psychology-of-ethical-attention/
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

Moral salience can be modeled as the probability that a morally relevant feature of a situation becomes focal enough to influence later evaluation and action:

\[
S_i = f(H_i, V_i, E_i, M_i, C_i, A_i)
\]

where:

- \(S_i\) = moral salience
- \(H_i\) = perceived harm
- \(V_i\) = visible vulnerability
- \(E_i\) = emotional activation
- \(M_i\) = mind perception
- \(C_i\) = contextual framing
- \(A_i\) = attentional competition

A more explicit latent-score model is:

\[
S_i^* = \alpha H_i + \beta V_i + \gamma E_i + \delta M_i + \eta C_i - \lambda A_i + \varepsilon_i
\]

The probability that a morally relevant feature becomes focal can then be written as:

\[
P(F_i = 1) = \sigma(S_i^*)
\]

Downstream judgment can be modeled as conditional on attention:

\[
J_i = \theta_0 + \theta_1 F_i + \theta_2 I_i + \theta_3 R_i + u_i
\]

Institutions can be added by treating organized inattention as a structural penalty:

\[
S_{ij}^* = \alpha H_i + \beta V_i + \gamma M_i + \eta C_{ij} - \lambda A_{ij} - \kappa O_j + \varepsilon_{ij}
\]

where \(O_j\) represents institutional organized inattention, such as fragmented responsibility, narrow metrics, retaliation risk, opaque categories, or reporting systems that make harm difficult to name.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-perception-salience-and-the-psychology-of-ethical-attention
python3 python/simulate_ethical_attention.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-perception-salience-and-the-psychology-of-ethical-attention
Rscript r/model_moral_salience_attention.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-perception-salience-and-the-psychology-of-ethical-attention
sqlite3 outputs/tables/moral_salience.sqlite < sql/schema.sql
sqlite3 outputs/tables/moral_salience.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not attention assessments, moral-salience scores, moral perception diagnostics, employee-screening systems, student-assessment systems, workplace-surveillance systems, psychological assessments, legal tools, hiring tools, promotion tools, moral-worth measures, or automated moral judgment systems.

The goal is to clarify how harm, vulnerability, emotion, mind perception, framing, institutional design, attention economies, organized inattention, and repair pathways shape what people and systems notice before moral judgment becomes possible. The scaffold should not be used to evaluate real persons, employees, students, leaders, workers, organizations, institutions, communities, cultures, religious communities, political groups, professions, or moral worth.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/moral-perception-salience-and-the-psychology-of-ethical-attention
