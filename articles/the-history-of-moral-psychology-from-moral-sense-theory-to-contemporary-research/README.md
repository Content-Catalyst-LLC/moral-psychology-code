# The History of Moral Psychology: From Moral Sense Theory to Contemporary Research

This article-level repository folder supports the article **“The History of Moral Psychology: From Moral Sense Theory to Contemporary Research.”** It provides reproducible scaffolding for synthetic data, historical-explanatory emphasis models, paradigm-shift summaries, diversification metrics, moral-sense theory mappings, sentimentalist and rationalist comparisons, developmental-tradition history, social-learning and moral-disengagement examples, intuitionist and dual-process era models, contemporary pluralist and institutional moral psychology scaffolds, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that the history of moral psychology is not a simple linear progression from error to truth. It is better understood as a series of shifts in what counts as the primary engine of moral life: sentiment, reason, development, intuition, social learning, virtue, norms, cooperation, culture, politics, experiment, neuroscience, and institutions. Each emphasis clarified something real, but each also risked reduction.

## Purpose

This folder supports transparent, reproducible exploration of the history of moral psychology, especially:

- moral sense theory
- sentimentalism
- sympathy
- conscience
- rationalism
- duty-centered moral theory
- nineteenth-century evolutionary and social shifts
- Piagetian moral development
- Kohlbergian stage theory
- care ethics and Gilligan’s critique
- social domain theory
- social learning
- moral disengagement
- intuitionist moral psychology
- dual-process moral judgment
- experimental moral psychology
- neuroscience and measurement
- cross-cultural moral psychology
- political moral psychology
- institutional moral psychology
- moral agency as a multi-level system
- historical diversification of explanatory emphasis

The included workflows use synthetic historical-explanatory weights. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not bibliometric estimates, archival counts, empirical publication weights, or claims that complex intellectual traditions can be reduced to numerical scores.

## Folder structure

```text
the-history-of-moral-psychology-from-moral-sense-theory-to-contemporary-research/
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

A historical explanatory profile for a period \(t\) can be represented as:

\[
H_t = (S_t, R_t, D_t, I_t, C_t, N_t, X_t)
\]

where:

- \(S_t\) = sentiment, sympathy, moral sense, and moral feeling
- \(R_t\) = reason, duty, principle, and reflective agency
- \(D_t\) = development, childhood, stages, and moral education
- \(I_t\) = intuition, rapid judgment, and affective appraisal
- \(C_t\) = culture, politics, pluralism, and identity
- \(N_t\) = neuroscience, experiment, measurement, and lab method
- \(X_t\) = institutions, organizations, platforms, and systems

The historical center of the field can be modeled as:

\[
M_t = \alpha S_t + \beta R_t + \gamma D_t + \delta I_t + \eta C_t + \mu N_t + \lambda X_t
\]

The historical diversification of the field can be modeled as:

\[
V_t = - \sum_{k=1}^{7} p_{k,t} \log(p_{k,t})
\]

where \(p_{k,t}\) is the proportion of explanatory attention allocated to each dimension at time \(t\).

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/the-history-of-moral-psychology-from-moral-sense-theory-to-contemporary-research
python3 python/map_moral_psychology_history.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/the-history-of-moral-psychology-from-moral-sense-theory-to-contemporary-research
Rscript r/model_moral_psychology_history.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/the-history-of-moral-psychology-from-moral-sense-theory-to-contemporary-research
sqlite3 outputs/tables/moral_psychology_history.sqlite < sql/schema.sql
sqlite3 outputs/tables/moral_psychology_history.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not bibliometric claims, historical proof, disciplinary rankings, real publication counts, author rankings, citation measures, or quantitative substitutes for historical interpretation.

The goal is to clarify how explanatory emphasis in moral psychology shifts across sentiment, reason, development, intuition, culture, politics, experimental method, neuroscience, institutions, and structured moral environments. Any empirical extension should clearly document data sources, coding rules, uncertainty, and interpretive limits.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/the-history-of-moral-psychology-from-moral-sense-theory-to-contemporary-research
