# Responsibility, Blame, and Moral Accountability

This article-level repository folder supports the article **“Responsibility, Blame, and Moral Accountability.”** It provides reproducible scaffolding for synthetic data, responsibility and blame modeling, institutional-accountability analysis, accountability-quality scenarios, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that responsibility, blame, and moral accountability should be understood as a layered moral architecture. Responsibility asks whether conduct can be attributed to an agent under conditions of control, knowledge, role, and agency. Blame asks whether a negative moral response is fitting, proportionate, relationally legitimate, and responsive to the nature of the wrong. Accountability asks what social practice should follow: explanation, apology, sanction, restitution, institutional reform, public acknowledgment, repair, prevention, or changed conduct.

## Purpose

This folder supports transparent, reproducible exploration of responsibility, blame, and moral accountability, especially:

- control
- knowledge
- role duty
- wrongness severity
- motive malice
- mitigating excuse
- institutional structure
- victim recognition
- repair capacity
- prevention capacity
- responsibility
- blame probability
- accountability score
- accountability quality
- high-accountability low-blame cases
- responsibility diffusion
- institutional answerability

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real persons, legal cases, institutions, organizations, professional failures, or public accountability systems.

## Folder structure

```text
responsibility-blame-and-moral-accountability/
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

Responsibility can be modeled as a function of control and epistemic position:

\[
R_i = f(C_i, K_i)
\]

where:

- \(R_i\) = moral responsibility of agent \(i\)
- \(C_i\) = relevant control
- \(K_i\) = relevant knowledge or epistemic position

A more explicit linear model can include role duty:

\[
R_i = \alpha C_i + \beta K_i + \gamma D_i
\]

where \(D_i\) is role duty.

Blame can then be modeled as a moral response to responsibility plus additional relational and contextual factors:

\[
B_i = \sigma(\alpha R_i + \beta W_i + \gamma M_i - \lambda E_i)
\]

where:

- \(B_i\) = blame probability
- \(W_i\) = wrongness severity
- \(M_i\) = malicious or negligent motive
- \(E_i\) = mitigating excuse

Institutional accountability can be represented as:

\[
A_g = \sum_{i=1}^{n} \omega_i R_i + \phi S_g
\]

where \(A_g\) is group or institutional accountability, \(\omega_i\) weights role-specific responsibility across members, and \(S_g\) represents structural factors such as policy, oversight, reporting design, incentives, and institutional culture.

A repair-oriented accountability-quality model can be written as:

\[
Q_g = \theta_1 A_g + \theta_2 T_g + \theta_3 P_g + \theta_4 R_g
\]

where accountability quality rises when answerability is paired with truth-telling, prevention, and repair.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/responsibility-blame-and-moral-accountability
python3 python/simulate_responsibility_blame_accountability.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/responsibility-blame-and-moral-accountability
Rscript r/model_responsibility_blame_accountability.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/responsibility-blame-and-moral-accountability
sqlite3 outputs/tables/responsibility_blame_accountability.sqlite < sql/schema.sql
sqlite3 outputs/tables/responsibility_blame_accountability.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not legal advice tools, blame-assignment tools, employee-discipline systems, offender-assessment systems, institutional-audit substitutes, psychological assessment tools, surveillance systems, or automated moral judgment systems.

The goal is to clarify how responsibility, blame, and accountability can be distinguished, modeled, and connected to repair-oriented institutional practice. The scaffold should not be used to evaluate real people, cases, organizations, institutions, legal matters, employment decisions, or public accountability processes.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/responsibility-blame-and-moral-accountability
