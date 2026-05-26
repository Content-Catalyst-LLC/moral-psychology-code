# Methods in Moral Psychology: Experiment, Development, and Measurement

This article-level repository folder supports the article **“Methods in Moral Psychology: Experiment, Development, and Measurement.”** It provides reproducible scaffolding for synthetic data, experimental design examples, developmental-methods simulation, construct-measurement documentation, SQL schema, and multi-language computational examples.

The article argues that methods in moral psychology matter because the field studies phenomena that are conceptually complex, socially embedded, developmentally dynamic, and often difficult to observe directly. Moral judgment, blame, norm learning, guilt, fairness, obligation, prosociality, moral identity, ethical intuition, and responsibility are layered constructs that must be operationalized through careful research design.

## Purpose

This folder is designed to support transparent, reproducible exploration of moral psychology methods, especially the integration of:

- experiment and causal inference
- developmental research
- longitudinal and lifespan design
- vignette and dilemma methods
- behavioral measures and observed choice
- construct validity and operationalization
- multi-method assessment
- cross-cultural generalizability
- conceptual testing and experimental philosophy

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real populations.

## Folder structure

```text
methods-in-moral-psychology-experiment-development-and-measurement/
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

Moral-psychological measurement can be modeled as the relation between latent constructs and observed indicators:

\[
M_i = f(J_i, B_i, N_i, A_i)
\]

where:

- \(J_i\) = wrongness judgment
- \(B_i\) = blame attribution
- \(N_i\) = norm sensitivity
- \(A_i\) = action tendency

A simple measurement model for observed task responses can be written as:

\[
Y_{ij} = \lambda_j M_i + \epsilon_{ij}
\]

where \(Y_{ij}\) is participant \(i\)'s score on indicator \(j\), \(\lambda_j\) is the loading of that indicator on the latent construct, and \(\epsilon_{ij}\) is measurement error.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/methods-in-moral-psychology-experiment-development-and-measurement
python3 python/simulate_methods_data.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/methods-in-moral-psychology-experiment-development-and-measurement
Rscript r/model_methods_moral_psychology.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/methods-in-moral-psychology-experiment-development-and-measurement
sqlite3 outputs/tables/methods_moral_psychology.sqlite < sql/schema.sql
sqlite3 outputs/tables/methods_moral_psychology.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not psychological assessment tools, moral scoring systems, clinical instruments, hiring or employment tools, disciplinary systems, surveillance tools, or automated moral judgment systems.

Moral-psychology methods should clarify constructs and evidence. They should not be used to reduce persons to scores, replace ethical judgment, or apply experimental findings outside their evidentiary limits.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/methods-in-moral-psychology-experiment-development-and-measurement
