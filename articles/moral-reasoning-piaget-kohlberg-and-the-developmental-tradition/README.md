# Moral Reasoning: Piaget, Kohlberg, and the Developmental Tradition

This article-level repository folder supports the article **“Moral Reasoning: Piaget, Kohlberg, and the Developmental Tradition.”** It provides reproducible scaffolding for synthetic data, developmental moral reasoning models, Piagetian heteronomous/autonomous morality examples, Kohlbergian stage-like reasoning simulations, social-domain theory examples, justice-care profile modeling, moral-conventional distinction analysis, stage-domain mismatch cases, educational and civic-formation scenarios, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that the developmental tradition remains indispensable, but only when treated critically. Piaget and Kohlberg helped make moral development intellectually serious by showing that moral understanding has structure and changes over time. A contemporary account must preserve what the tradition illuminated while expanding beyond it: children develop not only justice reasoning, but also care, empathy, convention sensitivity, domain differentiation, cultural understanding, group awareness, moral identity, and practical capacities for responsible action.

## Purpose

This folder supports transparent, reproducible exploration of developmental moral reasoning, especially:

- Piagetian heteronomous morality
- Piagetian autonomous morality
- Kohlbergian preconventional reasoning
- Kohlbergian conventional reasoning
- Kohlbergian postconventional reasoning
- perspective-taking
- norm exposure
- domain differentiation
- relational orientation
- authority orientation
- peer cooperation
- cultural context support
- justice reasoning
- care reasoning
- conventional sensitivity
- autonomy orientation
- moral-conventional distinction
- personal domain reasoning
- prudential domain reasoning
- high-complexity reasoning profiles
- stage-domain mismatch cases
- reasoning-action gap
- moral education and civic formation

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real children, adolescents, students, families, schools, communities, cultures, organizations, institutions, or moral worth.

## Folder structure

```text
moral-reasoning-piaget-kohlberg-and-the-developmental-tradition/
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

Developmental moral reasoning can be modeled as a changing latent structure rather than as a simple age effect:

\[
R_i(t) = f(C_i(t), P_i(t), S_i(t), D_i(t))
\]

where:

- \(R_i(t)\) = moral reasoning complexity of person \(i\) at time \(t\)
- \(C_i(t)\) = cognitive developmental capacity
- \(P_i(t)\) = perspective-taking
- \(S_i(t)\) = social interaction and norm exposure
- \(D_i(t)\) = domain differentiation among moral, conventional, personal, and prudential judgments

A simple growth model can be written as:

\[
R_i(t) = \alpha_i + \beta_i t + \gamma_i t^2 + \varepsilon_i(t)
\]

Stage-like movement across ordered developmental levels can be represented as:

\[
P(Y_i \geq k) = \sigma(\theta_k + \lambda_1 C_i + \lambda_2 P_i + \lambda_3 S_i + \lambda_4 D_i)
\]

A multidimensional model can distinguish justice, care, and convention-sensitive reasoning:

\[
\mathbf{M}_i = (J_i, K_i, V_i)
\]

where \(J_i\) represents justice reasoning, \(K_i\) care or relational reasoning, and \(V_i\) conventional-domain sensitivity.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-reasoning-piaget-kohlberg-and-the-developmental-tradition
python3 python/simulate_moral_reasoning_development.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-reasoning-piaget-kohlberg-and-the-developmental-tradition
Rscript r/model_moral_reasoning_development.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-reasoning-piaget-kohlberg-and-the-developmental-tradition
sqlite3 outputs/tables/moral_reasoning_development.sqlite < sql/schema.sql
sqlite3 outputs/tables/moral_reasoning_development.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not moral-development assessments, student assessments, school-evaluation tools, psychological assessments, child-development diagnostics, employee-screening systems, hiring tools, promotion tools, moral-worth measures, or automated moral judgment systems.

The goal is to clarify how moral reasoning develops through age, perspective-taking, rule understanding, peer cooperation, norm exposure, authority orientation, care, justice, convention sensitivity, autonomy, and domain differentiation. The scaffold should not be used to evaluate real children, adolescents, students, families, schools, workers, organizations, institutions, communities, cultures, religious communities, political groups, professions, or moral worth.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/moral-reasoning-piaget-kohlberg-and-the-developmental-tradition
