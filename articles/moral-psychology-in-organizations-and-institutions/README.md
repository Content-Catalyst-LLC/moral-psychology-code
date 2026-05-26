# Moral Psychology in Organizations and Institutions

This article-level repository folder supports the article **“Moral Psychology in Organizations and Institutions.”** It provides reproducible scaffolding for synthetic data, organizational ethical-risk modeling, institutional integrity analysis, accountability and diffusion scenarios, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that moral psychology in organizations examines how ethical attention, judgment, motivation, responsibility, silence, courage, conformity, and wrongdoing are shaped not only by individual character, but by roles, incentives, hierarchy, culture, procedures, and system design.

## Purpose

This folder supports transparent, reproducible exploration of organizational moral psychology, especially:

- ethical sensitivity
- role constraint
- cultural climate
- performance pressure
- hierarchy intensity
- diffusion of responsibility
- accountability strength
- speak-up protection
- value alignment
- corruption pressure
- unethical action probability
- institutional integrity
- purpose drift
- ethical fading
- bounded ethicality

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real employees, organizations, institutions, industries, or communities.

## Folder structure

```text
moral-psychology-in-organizations-and-institutions/
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

Moral decision-making in organizations can be modeled as the joint effect of individual and institutional variables:

\[
M_i = f(E_i, R_i, C_i, P_i)
\]

where:

- \(M_i\) = morally relevant decision tendency
- \(E_i\) = ethical sensitivity
- \(R_i\) = role constraint
- \(C_i\) = cultural climate
- \(P_i\) = performance pressure

A more explicit organizational-risk model can be written as:

\[
U_i = \sigma(\alpha P_i + \beta H_i + \gamma D_i - \lambda A_i)
\]

where:

- \(U_i\) = probability of unethical action
- \(P_i\) = performance pressure
- \(H_i\) = hierarchy intensity
- \(D_i\) = diffusion of responsibility
- \(A_i\) = accountability strength

At the institutional level, moral integrity can be modeled as:

\[
I_g = \theta_1 T_g + \theta_2 S_g + \theta_3 W_g - \theta_4 K_g
\]

where institutional integrity rises with transparency, speak-up protection, and value alignment, and falls with corruption or capture pressure.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-psychology-in-organizations-and-institutions
python3 python/simulate_organizational_moral_risk.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-psychology-in-organizations-and-institutions
Rscript r/model_organizational_moral_psychology.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-psychology-in-organizations-and-institutions
sqlite3 outputs/tables/organizational_moral_psychology.sqlite < sql/schema.sql
sqlite3 outputs/tables/organizational_moral_psychology.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not employee-screening systems, psychological assessment tools, workplace surveillance tools, risk-scoring tools, disciplinary systems, leadership-evaluation tools, or automated moral judgment systems.

The goal is to clarify how organizations shape moral attention, ethical decision-making, accountability, silence, corruption risk, and institutional integrity. The scaffold should not be used to classify real workers, target employees, replace human judgment, or make personnel decisions.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/moral-psychology-in-organizations-and-institutions
