# Moral Development in Childhood and Adolescence

This article-level repository folder supports the article **“Moral Development in Childhood and Adolescence.”** It provides reproducible scaffolding for synthetic data, childhood and adolescent moral-development modeling, social-domain simulations, peer-status and school-climate scenarios, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that moral development in childhood and adolescence should be understood as a multidimensional process. Children are not simply passive recipients of adult rules, nor are adolescents merely unfinished adults. Children actively interpret harm, fairness, authority, intention, convention, and personal autonomy. Adolescents then enter a more complex moral ecology shaped by autonomy, identity, peer status, group belonging, digital life, institutional expectations, and widening social imagination.

## Purpose

This folder supports transparent, reproducible exploration of moral development in childhood and adolescence, especially:

- age
- developmental band
- perspective-taking
- empathic concern
- norm understanding
- peer context
- family support
- school climate
- peer-status pressure
- harm understanding
- fairness reasoning
- conventional sensitivity
- personal-autonomy understanding
- latent moral-development profile
- moral action probability
- high-development low-action cases
- social-domain differentiation
- peer influence and moral courage
- institutional and school-based moral learning

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real children, adolescents, families, schools, cultures, communities, institutions, or moral worth.

## Folder structure

```text
moral-development-in-childhood-and-adolescence/
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

Moral development can be modeled as a changing latent structure shaped by cognition, emotion, norm understanding, and social context:

\[
M_i(t) = f(C_i(t), E_i(t), N_i(t), S_i(t))
\]

where:

- \(M_i(t)\) = moral-development profile of person or agent \(i\) at time \(t\)
- \(C_i(t)\) = cognitive perspective-taking capacity
- \(E_i(t)\) = empathic-emotional development
- \(N_i(t)\) = norm understanding
- \(S_i(t)\) = social-context input from family, peers, schools, culture, media, and institutions

A nonlinear growth model can be written as:

\[
M_i(t) = \alpha_i + \beta_i t + \gamma_i t^2 + \varepsilon_i(t)
\]

where the curvature term allows for growth, plateau, acceleration, or reorganization rather than assuming a simple straight-line increase with age.

To represent social-domain differentiation:

\[
\mathbf{D}_i = (H_i, F_i, V_i, P_i)
\]

where:

- \(H_i\) = harm-based moral understanding
- \(F_i\) = fairness reasoning
- \(V_i\) = conventional-rule sensitivity
- \(P_i\) = personal-domain or autonomy understanding

An adolescent peer-context model can represent moral action under social pressure:

\[
A_{ij}(t) = \sigma(\theta_1 M_i(t) + \theta_2 I_i(t) + \theta_3 R_j - \theta_4 Q_j)
\]

where:

- \(A_{ij}(t)\) = moral action by young person \(i\) in situation \(j\)
- \(I_i(t)\) = moral identity
- \(R_j\) = relational or institutional support
- \(Q_j\) = peer-status pressure or threat of exclusion

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-development-in-childhood-and-adolescence
python3 python/simulate_moral_development_childhood_adolescence.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-development-in-childhood-and-adolescence
Rscript r/model_moral_development_childhood_adolescence.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-development-in-childhood-and-adolescence
sqlite3 outputs/tables/moral_development_childhood_adolescence.sqlite < sql/schema.sql
sqlite3 outputs/tables/moral_development_childhood_adolescence.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not child-assessment tools, school-assessment systems, developmental screening tools, psychological assessments, moral-development scoring systems, discipline systems, legal tools, educational placement tools, or automated moral judgment systems.

The goal is to clarify how moral development unfolds across childhood and adolescence through cognition, empathy, norm learning, social-domain differentiation, family life, peer pressure, school climate, identity formation, and moral action. The scaffold should not be used to evaluate real children, adolescents, families, schools, communities, cultures, or moral worth.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/moral-development-in-childhood-and-adolescence
