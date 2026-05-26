# Prosocial Behavior, Altruism, and Care for Others

This article-level repository folder supports the article **“Prosocial Behavior, Altruism, and Care for Others.”** It provides reproducible scaffolding for synthetic data, helping models, altruistic-motive simulations, caregiving-persistence analysis, institutional-support scenarios, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that prosocial behavior, altruism, and care for others should be understood as distinct but overlapping forms of moral action. Prosocial behavior describes beneficial action broadly. Altruism asks whether other-oriented concern is genuinely part of the motive. Care asks whether attention to another’s vulnerability becomes sustained, responsive, and relationally accountable.

## Purpose

This folder supports transparent, reproducible exploration of prosocial behavior, altruism, and care, especially:

- empathic concern
- norm strength
- relational closeness
- visible vulnerability
- perceived cost
- prosocial action probability
- other-oriented desire
- self-oriented payoff
- altruistic motive strength
- attentional responsiveness
- ongoing need
- burnout
- institutional support
- voice safety
- caregiving persistence
- high-empathy low-action cases
- high-burden care cases
- helping, cooperation, sacrifice, and care
- multilevel prosocial explanation

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real persons, families, caregivers, patients, workers, students, groups, organizations, institutions, communities, cultures, care systems, or moral worth.

## Folder structure

```text
prosocial-behavior-altruism-and-care-for-others/
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

Prosocial behavior can be modeled as a function of concern for another, situational cues, norms, relationship, vulnerability, and cost:

\[
P_i = \sigma(\alpha E_i + \beta N_i + \gamma R_i + \delta V_i - \lambda C_i)
\]

where:

- \(P_i\) = probability of prosocial action
- \(E_i\) = empathic concern
- \(N_i\) = norm strength
- \(R_i\) = relational closeness or felt responsibility
- \(V_i\) = perceived vulnerability of the recipient
- \(C_i\) = perceived cost
- \(\sigma\) = logistic transformation

To distinguish altruism from general prosociality:

\[
A_i = \theta_1 O_i - \theta_2 S_i
\]

where:

- \(A_i\) = altruistic motive strength
- \(O_i\) = other-oriented desire
- \(S_i\) = self-oriented payoff salience

Care can be represented as temporally extended prosociality:

\[
K_i(t+1) = K_i(t) + \mu A_i + \nu D_i + \eta I_i - \rho B_i
\]

where:

- \(K_i(t)\) = caregiving persistence across time
- \(A_i\) = attentional responsiveness
- \(D_i\) = perceived dependence or ongoing need
- \(I_i\) = institutional support
- \(B_i\) = burnout or depletion

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/prosocial-behavior-altruism-and-care-for-others
python3 python/simulate_prosocial_behavior_altruism_care.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/prosocial-behavior-altruism-and-care-for-others
Rscript r/model_prosocial_behavior_altruism_care.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/prosocial-behavior-altruism-and-care-for-others
sqlite3 outputs/tables/prosocial_behavior_altruism_care.sqlite < sql/schema.sql
sqlite3 outputs/tables/prosocial_behavior_altruism_care.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not empathy-assessment tools, altruism-scoring tools, caregiver-assessment systems, employee-screening systems, student-assessment systems, healthcare triage systems, psychological assessments, labor-allocation tools, legal tools, or automated moral judgment systems.

The goal is to clarify how empathy, norms, relationship, vulnerability, cost, altruistic motive, institutional support, burnout, cooperation, and care shape prosocial action across different contexts. The scaffold should not be used to evaluate real persons, caregivers, patients, families, workers, students, organizations, institutions, communities, cultures, care systems, or moral worth.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/prosocial-behavior-altruism-and-care-for-others
