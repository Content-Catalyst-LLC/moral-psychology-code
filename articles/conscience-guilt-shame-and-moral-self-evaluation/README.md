# Conscience, Guilt, Shame, and Moral Self-Evaluation

This article-level repository folder supports the article **“Conscience, Guilt, Shame, and Moral Self-Evaluation.”** It provides reproducible scaffolding for synthetic data, conscience-activation models, guilt-versus-shame simulations, repair-and-avoidance analysis, high-shame low-repair cases, high-guilt high-repair cases, institutional accountability scenarios, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that conscience is best understood as differentiated moral self-evaluation. Guilt, shame, remorse, responsibility, and integrity each play different roles in that process. Guilt often centers on wrongful action and can motivate repair. Shame often centers on exposed or diminished selfhood and can produce withdrawal, defensiveness, rage, or concealment. Remorse integrates responsibility with sorrow for harm done.

## Purpose

This folder supports transparent, reproducible exploration of conscience, guilt, shame, and moral self-evaluation, especially:

- conscience activation
- perceived wrongdoing
- perceived responsibility
- exposure before others
- norm internalization
- global self-condemnation
- guilt
- shame
- remorse
- empathic acknowledgment
- agency capacity
- defensiveness
- repair pathway
- repair probability
- avoidance probability
- high-shame low-repair cases
- high-guilt high-repair cases
- institutional shame cultures
- repair-oriented moral self-evaluation

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real persons, students, employees, leaders, organizations, institutions, communities, cultures, professions, religious communities, political groups, or moral worth.

## Folder structure

```text
conscience-guilt-shame-and-moral-self-evaluation/
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

Moral self-evaluation can be modeled as a structured process in which conduct is appraised against internalized standards and translated into differentiated self-conscious emotions:

\[
C_i = f(W_i, R_i, E_i, N_i, A_i)
\]

where:

- \(C_i\) = conscience activation
- \(W_i\) = perceived wrongdoing
- \(R_i\) = perceived responsibility
- \(E_i\) = exposure before others
- \(N_i\) = norm internalization
- \(A_i\) = agency or perceived capacity to respond

Guilt and shame can be modeled as distinct but overlapping latent processes:

\[
G_i = \alpha_1 W_i + \beta_1 R_i + \gamma_1 N_i + \varepsilon_i
\]

\[
S_i = \alpha_2 X_i + \beta_2 E_i + \gamma_2 N_i + \eta_i
\]

where \(G_i\) is guilt, \(S_i\) is shame, and \(X_i\) is global self-condemnation.

Reparative action can be modeled as:

\[
P_i^{repair} = \sigma(\lambda_1 G_i - \lambda_2 S_i + \lambda_3 M_i + \lambda_4 K_i)
\]

where \(M_i\) is empathic acknowledgment and \(K_i\) is perceived availability of a repair pathway.

Avoidance can be modeled separately:

\[
P_i^{avoid} = \sigma(\phi_1 S_i - \phi_2 G_i - \phi_3 K_i + \xi_i)
\]

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/conscience-guilt-shame-and-moral-self-evaluation
python3 python/simulate_conscience_guilt_shame.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/conscience-guilt-shame-and-moral-self-evaluation
Rscript r/model_conscience_guilt_shame.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/conscience-guilt-shame-and-moral-self-evaluation
sqlite3 outputs/tables/conscience_guilt_shame.sqlite < sql/schema.sql
sqlite3 outputs/tables/conscience_guilt_shame.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not conscience assessments, guilt assessments, shame assessments, remorse measures, virtue scores, employee-screening systems, student-assessment systems, workplace-surveillance systems, psychological assessments, clinical tools, legal tools, hiring tools, promotion tools, moral-worth measures, or automated moral judgment systems.

The goal is to clarify how conscience, guilt, shame, remorse, responsibility, exposure, agency, defensiveness, empathic acknowledgment, and repair pathways shape moral response after wrongdoing or omission. The scaffold should not be used to evaluate real persons, employees, students, leaders, workers, organizations, institutions, communities, cultures, religious communities, political groups, professions, or moral worth.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/conscience-guilt-shame-and-moral-self-evaluation
