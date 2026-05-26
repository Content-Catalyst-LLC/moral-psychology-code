# Moral Development Across Adulthood and Aging

This article-level repository folder supports the article **“Moral Development Across Adulthood and Aging.”** It provides reproducible scaffolding for synthetic data, adult lifespan moral-development modeling, caregiving and generativity scenarios, later-life moral action simulations, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that moral development continues across adulthood and aging rather than ending with adolescence. Adult moral life involves stability and change: stable commitments, changing roles, deepening responsibilities, altered capacities, revised identities, and new confrontations with dependence, regret, loss, care, work, institutions, and legacy.

## Purpose

This folder supports transparent, reproducible exploration of moral development across adulthood and aging, especially:

- age
- adulthood band
- moral identity
- prosocial orientation
- role complexity
- moral-emotional profile
- decision capacity
- generativity
- caregiving burden
- loss reflection
- voice safety
- accountability strength
- latent adult moral-development profile
- moral action probability
- high-development low-action cases
- lifespan moral change
- caregiving and relational moral life
- adult role responsibility
- later-life moral repair

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real adults, older adults, families, caregivers, workplaces, health systems, organizations, institutions, communities, cultures, or moral worth.

## Folder structure

```text
moral-development-across-adulthood-and-aging/
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

Moral development across adulthood can be modeled as a changing latent structure influenced by identity, prosocial orientation, role complexity, emotional development, and cognitive-social decision capacity:

\[
M_i(t) = f(I_i(t), P_i(t), R_i(t), E_i(t), C_i(t))
\]

where:

- \(M_i(t)\) = moral-development profile of person or agent \(i\) at age or time \(t\)
- \(I_i(t)\) = moral identity integration
- \(P_i(t)\) = prosocial orientation
- \(R_i(t)\) = role complexity and responsibility
- \(E_i(t)\) = moral-emotional profile
- \(C_i(t)\) = cognitive-social decision capacity

A nonlinear growth model can be written as:

\[
M_i(t) = \alpha_i + \beta_i t + \gamma_i t^2 + \varepsilon_i(t)
\]

where the curvature term allows for growth, plateau, midlife reorganization, or later-life shifts rather than assuming a simple upward line.

To model prosocial change specifically:

\[
P_i(t+1) = P_i(t) + \lambda G_i - \mu B_i + \nu L_i
\]

where:

- \(G_i\) = generativity or long-horizon concern
- \(B_i\) = burden or depletion
- \(L_i\) = loss-driven reflection or relational reorientation

An institutional role model can represent adult moral expression under social pressure:

\[
A_{ij}(t) = \sigma(\theta_1 M_i(t) + \theta_2 V_j - \theta_3 P_j + \theta_4 K_{ij})
\]

where moral action depends not only on the adult’s moral-development profile, but also on voice safety, institutional pressure, and person-role fit.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-development-across-adulthood-and-aging
python3 python/simulate_moral_development_adulthood_aging.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-development-across-adulthood-and-aging
Rscript r/model_moral_development_adulthood_aging.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-development-across-adulthood-and-aging
sqlite3 outputs/tables/moral_development_adulthood_aging.sqlite < sql/schema.sql
sqlite3 outputs/tables/moral_development_adulthood_aging.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not elder-assessment tools, caregiver-assessment tools, workplace-assessment systems, healthcare triage tools, psychological assessments, moral-development scoring systems, legal tools, policy-allocation tools, or automated moral judgment systems.

The goal is to clarify how moral development continues across adulthood and aging through identity, care, responsibility, emotion, cognition, generativity, loss, institutional pressure, and changing time horizons. The scaffold should not be used to evaluate real adults, older adults, caregivers, families, patients, workers, organizations, institutions, communities, cultures, or moral worth.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/moral-development-across-adulthood-and-aging
