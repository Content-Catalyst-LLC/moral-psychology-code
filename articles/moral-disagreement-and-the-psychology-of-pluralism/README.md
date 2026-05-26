# Moral Disagreement and the Psychology of Pluralism

This article-level repository folder supports the article **“Moral Disagreement and the Psychology of Pluralism.”** It provides reproducible scaffolding for synthetic data, moral-disagreement modeling, pluralist value-conflict analysis, institutional-trust scenarios, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that moral disagreement should be understood as a normal and difficult feature of moral life rather than as an embarrassing exception to it. Some disagreements arise from ignorance, bias, manipulation, bad faith, domination, or cruelty. Others persist because moral values can conflict, because people notice different morally relevant features of the same case, because communities inherit different moral vocabularies, and because institutions must make collective decisions under unresolved value conflict.

## Purpose

This folder supports transparent, reproducible exploration of moral disagreement and pluralism, especially:

- harm weighting
- fairness weighting
- loyalty weighting
- purity weighting
- authority weighting
- care weighting
- identity strength
- framing sensitivity
- institutional trust
- pluralist tolerance
- moral judgment
- disagreement distance
- value gap
- identity gap
- trust gap
- pluralist institutional capacity

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real persons, political groups, cultures, institutions, religions, or populations.

## Folder structure

```text
moral-disagreement-and-the-psychology-of-pluralism/
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

Moral disagreement can be modeled as divergence in the weighting of multiple moral values:

\[
J_i = \alpha_i H + \beta_i F + \gamma_i L + \delta_i P + \varepsilon_i
\]

where:

- \(J_i\) = moral judgment of person \(i\)
- \(H\) = perceived harm
- \(F\) = fairness
- \(L\) = loyalty or group obligation
- \(P\) = purity or sanctity salience

Disagreement between two persons can be represented as:

\[
D_{ij} = |J_i - J_j|
\]

A more identity-sensitive model is:

\[
J_i = \alpha_i V_i + \beta_i G_i + \gamma_i S_i
\]

where:

- \(V_i\) = value weighting
- \(G_i\) = group identity strength
- \(S_i\) = situational framing

A pluralism-aware institutional model can include procedure and trust:

\[
C_g = \theta_1 R_g + \theta_2 T_g + \theta_3 A_g - \theta_4 X_g
\]

where a group or institution’s capacity to manage pluralism rises with rights protection, institutional trust, and accountability, and falls with exclusion pressure, domination, or dehumanizing conflict.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-disagreement-and-the-psychology-of-pluralism
python3 python/simulate_moral_disagreement_pluralism.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-disagreement-and-the-psychology-of-pluralism
Rscript r/model_moral_disagreement_pluralism.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-disagreement-and-the-psychology-of-pluralism
sqlite3 outputs/tables/moral_disagreement_pluralism.sqlite < sql/schema.sql
sqlite3 outputs/tables/moral_disagreement_pluralism.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not ideological scoring systems, political profiling tools, psychological assessment tools, persuasion systems, surveillance systems, moderation tools, disciplinary systems, or automated moral judgment systems.

The goal is to clarify how moral disagreement can emerge from value weighting, identity, framing, trust, and pluralist value conflict. The scaffold should not be used to classify real people, target groups, diagnose moral character, rank communities, or replace ethical, civic, legal, institutional, or scholarly judgment.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/moral-disagreement-and-the-psychology-of-pluralism
