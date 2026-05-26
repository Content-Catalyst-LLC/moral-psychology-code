# Moral Injury, Bureaucracy, and Distributed Responsibility

This article-level repository folder supports the article **“Moral Injury, Bureaucracy, and Distributed Responsibility.”** It provides reproducible scaffolding for synthetic data, institutional moral-risk modeling, distributed-responsibility analysis, accountability-clarity scenarios, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that moral injury in institutional settings often emerges not only from committing or witnessing obvious wrongdoing, but from inhabiting systems where moral standards are repeatedly violated, overridden, or rendered unusable by policy, hierarchy, scarcity, proceduralism, organizational opacity, or institutional indifference.

## Purpose

This folder supports transparent, reproducible exploration of moral injury under bureaucratic and distributed-responsibility conditions, especially:

- conscience conflict
- institutional betrayal
- distributed responsibility
- morally injurious exposure
- scarcity constraint
- accountability clarity
- organizational opacity
- role constraint
- many-hands conditions
- institutional courage
- repair capacity
- moral injury risk

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real workplaces, clinicians, public servants, institutions, or affected communities.

## Folder structure

```text
moral-injury-bureaucracy-and-distributed-responsibility/
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

Moral injury in organizations can be modeled as a function of moral conflict, constrained agency, and institutional betrayal:

\[
MI_i = f(C_i, B_i, D_i, V_i)
\]

where:

- \(MI_i\) = moral injury risk for person \(i\)
- \(C_i\) = conscience conflict
- \(B_i\) = betrayal by authority or institution
- \(D_i\) = distributed responsibility or agency fragmentation
- \(V_i\) = exposure to morally injurious events or conditions

A bureaucracy-specific risk model can be written as:

\[
MI_i = \alpha R_i + \beta S_i + \gamma O_i - \lambda A_i
\]

where:

- \(R_i\) = rule-conscience conflict
- \(S_i\) = scarcity or resource constraint
- \(O_i\) = organizational opacity
- \(A_i\) = accountability clarity

Distributed responsibility can be represented as a diffusion term:

\[
DR_g = 1 - \max(\omega_1,\omega_2,\dots,\omega_n)
\]

where \(\omega_k\) represents the proportion of practically usable responsibility borne by actor \(k\) in organization \(g\). As no single actor bears a large share of actionable responsibility, distributed-responsibility pressure rises.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-injury-bureaucracy-and-distributed-responsibility
python3 python/simulate_institutional_moral_risk.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-injury-bureaucracy-and-distributed-responsibility
Rscript r/model_moral_injury_bureaucracy.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-injury-bureaucracy-and-distributed-responsibility
sqlite3 outputs/tables/moral_injury_bureaucracy.sqlite < sql/schema.sql
sqlite3 outputs/tables/moral_injury_bureaucracy.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not clinical assessment tools, mental-health diagnostic tools, employee-screening systems, organizational surveillance systems, risk-scoring tools, disciplinary tools, or automated decision systems.

The goal is to clarify how bureaucracy, distributed responsibility, institutional betrayal, scarcity, opacity, and accountability clarity can structure moral injury risk. The scaffold should not be used to classify real workers, target employees, replace clinical care, or make personnel decisions.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/moral-injury-bureaucracy-and-distributed-responsibility
