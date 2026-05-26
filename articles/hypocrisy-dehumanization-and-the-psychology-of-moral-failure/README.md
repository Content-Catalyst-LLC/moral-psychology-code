# Hypocrisy, Dehumanization, and the Psychology of Moral Failure

This article-level repository folder supports the article **“Hypocrisy, Dehumanization, and the Psychology of Moral Failure.”** It provides reproducible scaffolding for synthetic data, moral double-standard modeling, dehumanization and moral-exclusion simulations, institutional-hypocrisy analysis, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that hypocrisy and dehumanization are mutually reinforcing mechanisms of moral failure. Hypocrisy creates unequal moral standards; dehumanization makes unequal standards emotionally bearable. Together they help explain how people, groups, and institutions can preserve moral language and favorable self-image while practicing selective concern, exclusion, cruelty, indifference, or institutional harm.

## Purpose

This folder supports transparent, reproducible exploration of hypocrisy, dehumanization, and moral failure, especially:

- judgment strictness toward others
- judgment strictness toward self
- hypocrisy
- perceived humanness
- dehumanization
- moral standing
- ingroup bias
- empathic recognition
- public value claims
- actual practice integrity
- institutional hypocrisy
- accountability strength
- victim visibility
- moral failure probability
- high-risk moral failure cases
- moral comparability
- dehumanizing language and ethical distance

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real persons, political groups, organizations, institutions, communities, conflicts, or moral character.

## Folder structure

```text
hypocrisy-dehumanization-and-the-psychology-of-moral-failure/
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

Hypocrisy can be modeled as an asymmetry between moral strictness applied to others and moral strictness applied to the self or ingroup:

\[
H_i = J_i^{other} - J_i^{self}
\]

where:

- \(H_i\) = hypocrisy level of person or agent \(i\)
- \(J_i^{other}\) = judgment strictness applied to others
- \(J_i^{self}\) = judgment strictness applied to self or ingroup

Dehumanization can be modeled as a reduction in perceived moral standing:

\[
D_{ij} = 1 - M_{ij}
\]

where:

- \(D_{ij}\) = dehumanization of target \(j\) by agent \(i\)
- \(M_{ij}\) = perceived full moral standing, humanness, dignity, or personhood

Moral failure risk can then be represented as:

\[
F_{ij} = \sigma(\alpha H_i + \beta D_{ij} + \gamma G_i - \lambda E_{ij})
\]

where:

- \(F_{ij}\) = moral failure risk
- \(\sigma\) = logistic transformation
- \(G_i\) = group favoritism or ingroup bias
- \(E_{ij}\) = empathic recognition of the target

An institutional model can represent the gap between professed values and lived practice:

\[
I_g = V_g - P_g
\]

where:

- \(I_g\) = institutional hypocrisy
- \(V_g\) = strength of professed values
- \(P_g\) = integrity of actual practice

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/hypocrisy-dehumanization-and-the-psychology-of-moral-failure
python3 python/simulate_hypocrisy_dehumanization_moral_failure.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/hypocrisy-dehumanization-and-the-psychology-of-moral-failure
Rscript r/model_hypocrisy_dehumanization_moral_failure.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/hypocrisy-dehumanization-and-the-psychology-of-moral-failure
sqlite3 outputs/tables/hypocrisy_dehumanization_moral_failure.sqlite < sql/schema.sql
sqlite3 outputs/tables/hypocrisy_dehumanization_moral_failure.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not moral character assessments, dehumanization-detection systems, employee discipline tools, moderation systems, political persuasion tools, surveillance systems, psychological assessment tools, legal tools, or automated moral judgment systems.

The goal is to clarify how double standards, moral exclusion, ingroup bias, institutional value-practice gaps, empathy, accountability, and victim visibility can shape moral failure risk. The scaffold should not be used to evaluate real people, organizations, political groups, institutions, communities, conflicts, or moral worth.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/hypocrisy-dehumanization-and-the-psychology-of-moral-failure
