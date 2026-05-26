# Moral Identity and the Formation of Moral Agency

This article-level repository folder supports the article **“Moral Identity and the Formation of Moral Agency.”** It provides reproducible scaffolding for synthetic data, identity-action models, internalization and symbolization simulations, repair-capacity analysis, institutional-role scenarios, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that moral identity should be understood neither as a decorative self-image nor as a guarantee of virtue. Moral identity can strengthen agency by helping moral commitments become self-regulating, motivationally durable, and narratively integrated. But it can also become rigid, performative, exclusionary, and defensive when the moral self is organized around superiority, display, purity, or group righteousness.

## Purpose

This folder supports transparent, reproducible exploration of moral identity and moral agency, especially:

- internalization
- symbolization
- narrative integration
- norm integration
- moral judgment
- self-regulatory capacity
- situational pressure
- moral identity strength
- moral action probability
- accountability
- humility
- guilt recognition
- defensiveness
- repair capacity
- high-identity low-action cases
- high-identity low-repair cases
- institutional role identity
- moralized selfhood
- identity-based moral motivation

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real persons, students, employees, leaders, organizations, institutions, communities, cultures, professions, political groups, or moral worth.

## Folder structure

```text
moral-identity-and-the-formation-of-moral-agency/
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

Moral identity can be modeled as the degree to which moral commitments are integrated into self-concept and thereby influence behavior:

\[
M_i = f(I_i, S_i, N_i, R_i)
\]

where:

- \(M_i\) = moral identity strength for person or agent \(i\)
- \(I_i\) = internalization of moral traits
- \(S_i\) = public symbolization
- \(N_i\) = norm integration into self-concept
- \(R_i\) = narrative self-reinforcement across time

Moral action can be modeled as partly dependent on moral identity:

\[
A_i = \sigma(\alpha J_i + \beta M_i + \gamma C_i - \lambda P_i + \varepsilon_i)
\]

where:

- \(A_i\) = moral action probability
- \(J_i\) = moral judgment strength
- \(M_i\) = moral identity
- \(C_i\) = self-regulatory capacity
- \(P_i\) = situational pressure
- \(\sigma\) = logistic transformation

Moral identity can be decomposed into internalization and symbolization:

\[
M_i = \theta_1 Int_i + \theta_2 Sym_i + u_i
\]

A repair-oriented model adds accountability and correction after failure:

\[
R_i = \omega_1 G_i + \omega_2 H_i + \omega_3 A_i - \omega_4 D_i
\]

where repair capacity increases with guilt recognition, humility, and accountability, but declines under defensiveness.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-identity-and-the-formation-of-moral-agency
python3 python/simulate_moral_identity_agency.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-identity-and-the-formation-of-moral-agency
Rscript r/model_moral_identity_agency.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-identity-and-the-formation-of-moral-agency
sqlite3 outputs/tables/moral_identity_agency.sqlite < sql/schema.sql
sqlite3 outputs/tables/moral_identity_agency.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not moral-identity assessment tools, virtue-scoring systems, employee-screening systems, student-assessment systems, workplace-surveillance systems, psychological assessments, legal tools, hiring tools, promotion tools, or automated moral judgment systems.

The goal is to clarify how moral identity, selfhood, judgment, self-regulation, narrative memory, public symbolization, institutional role, accountability, defensiveness, and repair shape moral agency across different contexts. The scaffold should not be used to evaluate real persons, employees, students, leaders, workers, organizations, institutions, communities, cultures, political groups, professions, or moral worth.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/moral-identity-and-the-formation-of-moral-agency
