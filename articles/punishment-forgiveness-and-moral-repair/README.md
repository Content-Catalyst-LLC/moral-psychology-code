# Punishment, Forgiveness, and Moral Repair

This article-level repository folder supports the article **“Punishment, Forgiveness, and Moral Repair.”** It provides reproducible scaffolding for synthetic data, post-wrong response modeling, punishment and forgiveness simulations, moral-repair analysis, public-repair scenarios, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that punishment, forgiveness, and moral repair are related but non-identical responses to wrongdoing. Punishment can mark wrongdoing and reaffirm norms. Forgiveness can transform the victim’s or community’s stance toward the wrongdoer without erasing the wrong. Moral repair concerns the broader restoration of damaged moral relations, recognition, standing, trust, shared norms, and public intelligibility after harm.

## Purpose

This folder supports transparent, reproducible exploration of punishment, forgiveness, and moral repair, especially:

- wrongdoing severity
- offender responsibility
- norm reaffirmation need
- acknowledgment
- amends
- ongoing threat
- restitution
- institutional trust
- victim recognition
- structural reform
- punishment score
- forgiveness probability
- moral repair
- public repair
- restorative justice scenarios
- repair failure and low-repair cases

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real victims, offenders, courts, justice systems, institutions, organizations, conflicts, or communities.

## Folder structure

```text
punishment-forgiveness-and-moral-repair/
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

Punishment, forgiveness, and repair can be modeled as distinct but interacting post-wrong responses.

A simplified punishment response can be written as:

\[
P_i = \alpha W_i + \beta R_i + \gamma N_i
\]

where:

- \(P_i\) = punishment response
- \(W_i\) = wrongdoing severity
- \(R_i\) = perceived offender responsibility
- \(N_i\) = perceived need for norm reaffirmation

Forgiveness can be modeled separately:

\[
F_i = \sigma(\delta A_i + \epsilon M_i - \lambda T_i)
\]

where:

- \(F_i\) = forgiveness probability
- \(A_i\) = acknowledgment
- \(M_i\) = amends or repentance
- \(T_i\) = ongoing threat or unresolved harm

Moral repair can then be modeled as a broader relational and institutional outcome:

\[
R^{*}_i = \theta_1 P_i + \theta_2 F_i + \theta_3 C_i + \theta_4 Q_i
\]

where:

- \(R^{*}_i\) = moral repair
- \(C_i\) = compensation or restitution
- \(Q_i\) = restoration of shared moral understanding, value consensus, or norm recognition

Public repair can be modeled institutionally:

\[
PR_g = \omega_1 T_g + \omega_2 A_g + \omega_3 S_g + \omega_4 I_g - \omega_5 D_g
\]

where public repair rises with truth-telling, accountability, structural reform, and institutional credibility, and falls when denial remains strong.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/punishment-forgiveness-and-moral-repair
python3 python/simulate_punishment_forgiveness_repair.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/punishment-forgiveness-and-moral-repair
Rscript r/model_punishment_forgiveness_repair.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/punishment-forgiveness-and-moral-repair
sqlite3 outputs/tables/punishment_forgiveness_repair.sqlite < sql/schema.sql
sqlite3 outputs/tables/punishment_forgiveness_repair.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not sentencing tools, risk assessment tools, victim-assessment tools, forgiveness-pressure tools, restorative-justice decision systems, legal advice systems, psychological assessment tools, disciplinary systems, surveillance systems, or automated moral judgment systems.

The goal is to clarify how punishment, forgiveness, and repair can interact after wrongdoing while remaining analytically distinct moral responses. The scaffold should not be used to evaluate real victims, offenders, cases, courts, institutions, communities, conflicts, or justice systems.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/punishment-forgiveness-and-moral-repair
