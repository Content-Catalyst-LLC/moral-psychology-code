# Experimental Moral Psychology and the Study of Ethical Intuition

This article-level repository folder supports the article **“Experimental Moral Psychology and the Study of Ethical Intuition.”** It provides reproducible scaffolding for synthetic data, experimental moral-judgment modeling, intuition/reflection simulations, process-oriented documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that experimental moral psychology matters because it makes moral judgment empirically inspectable without reducing morality to laboratory response. Ethical intuition is real and influential, but neither simple nor self-sufficient. Moral judgment is shaped by intuitive appraisal, reflective control, norm sensitivity, consequence sensitivity, intention attribution, excuse, social identity, cultural background, and task structure.

## Purpose

This folder is designed to support transparent, reproducible exploration of experimental moral psychology, especially:

- ethical intuition
- reflection and deliberation
- norm sensitivity
- consequence sensitivity
- intention attribution
- excuse and reduced blame
- power condition and social context
- blame probability
- process-oriented interpretation
- intuition/reflection gaps
- synthetic experimental designs

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real populations.

## Folder structure

```text
experimental-moral-psychology-and-the-study-of-ethical-intuition/
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

Ethical intuition can be modeled as a multi-component response rather than a single gut feeling:

\[
J_i = \alpha I_i + \beta R_i + \gamma N_i + \delta C_i + \varepsilon_i
\]

where:

- \(J_i\) = moral judgment
- \(I_i\) = intuitive appraisal strength
- \(R_i\) = reflective control
- \(N_i\) = norm sensitivity
- \(C_i\) = consequence sensitivity

A blame model can be written as:

\[
B_i = \sigma(\theta_1 W_i + \theta_2 T_i + \theta_3 K_i - \theta_4 E_i)
\]

where blame depends on perceived wrongness, intentionality, knowledge, and excuse.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/experimental-moral-psychology-and-the-study-of-ethical-intuition
python3 python/simulate_experimental_moral_judgment.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/experimental-moral-psychology-and-the-study-of-ethical-intuition
Rscript r/model_experimental_moral_judgment.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/experimental-moral-psychology-and-the-study-of-ethical-intuition
sqlite3 outputs/tables/experimental_moral_psychology.sqlite < sql/schema.sql
sqlite3 outputs/tables/experimental_moral_psychology.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not psychological assessment tools, moral scoring systems, clinical instruments, hiring or employment tools, disciplinary systems, surveillance tools, or automated moral judgment systems.

Experimental moral psychology should clarify the structure of moral judgment. It should not be used to reduce persons to scores, classify moral worth, replace ethical reasoning, or apply laboratory findings beyond their evidentiary limits.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/experimental-moral-psychology-and-the-study-of-ethical-intuition
