# Why Moral Psychology Matters Today

This article-level repository folder supports the article **“Why Moral Psychology Matters Today.”** It provides reproducible scaffolding for synthetic data, statistical modeling, simulation, documentation, and multi-language computational examples.

The article argues that moral psychology matters today because contemporary life repeatedly forces people to judge harm, fairness, blame, responsibility, loyalty, dignity, punishment, trust, and obligation under conditions of technological acceleration, institutional complexity, political polarization, cross-cultural contact, and institutional strain.

## Purpose

This folder is designed to support transparent, reproducible exploration of moral psychology as a systems-level field. It models how several contemporary pressures can jointly increase the practical significance of moral psychology:

- political polarization
- organizational moral risk
- developmental moral learning
- cross-cultural moral variation
- technology-mediated moral amplification
- moral injury burden

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real populations.

## Folder structure

```text
why-moral-psychology-matters-today/
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

## Research framing

The conceptual model treats the contemporary significance of moral psychology as a joint function of social, institutional, developmental, cultural, technological, and clinical or moral-injury pressures:

\[
S_t = \alpha P_t + \beta O_t + \gamma D_t + \delta C_t + \eta T_t + \mu M_t
\]

where:

- \(P_t\) = political polarization
- \(O_t\) = organizational moral risk
- \(D_t\) = developmental moral learning
- \(C_t\) = cross-cultural moral variation
- \(T_t\) = technology-mediated moral amplification
- \(M_t\) = moral injury burden

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/why-moral-psychology-matters-today
python3 python/simulate_moral_psychology_relevance.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/why-moral-psychology-matters-today
Rscript r/model_moral_psychology_relevance.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/why-moral-psychology-matters-today
sqlite3 outputs/tables/moral_psychology_relevance.sqlite < sql/schema.sql
sqlite3 outputs/tables/moral_psychology_relevance.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not psychological assessment tools, moral scoring systems, clinical instruments, hiring or employment tools, disciplinary systems, surveillance tools, or automated moral judgment systems.

Moral psychology should help clarify ethical agency, responsibility, institutional pressure, moral injury, and repair. It should not be used to reduce persons to scores or replace ethical, legal, clinical, cultural, or institutional judgment.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/why-moral-psychology-matters-today
