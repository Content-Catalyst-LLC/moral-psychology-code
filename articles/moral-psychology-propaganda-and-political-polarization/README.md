# Moral Psychology, Propaganda, and Political Polarization

This article-level repository folder supports the article **“Moral Psychology, Propaganda, and Political Polarization.”** It provides reproducible scaffolding for synthetic data, propaganda-and-polarization modeling, moral-exclusion risk analysis, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that propaganda does not work only by transmitting falsehood. It works by shaping attention, emotion, trust, salience, identity, and the moral categories through which people interpret public life. Political polarization hardens these effects by sorting citizens into antagonistic moral worlds.

## Purpose

This folder is designed to support transparent, reproducible exploration of moral psychology, propaganda, and polarization, especially:

- propaganda exposure
- political identity salience
- trust allocation
- threat perception
- outrage amplification
- democratic trust
- cross-group contact
- moral-political judgment
- moral exclusion risk
- group divergence and polarization distance
- synthetic scenario analysis

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real populations.

## Folder structure

```text
moral-psychology-propaganda-and-political-polarization/
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

Political propaganda can be modeled as a force that shifts trust, threat perception, and moral salience rather than merely changing isolated factual beliefs:

\[
J_i = \alpha V_i + \beta T_i + \gamma G_i + \delta P_i
\]

where:

- \(J_i\) = moral-political judgment
- \(V_i\) = value profile
- \(T_i\) = trust allocation
- \(G_i\) = group-identity salience
- \(P_i\) = propaganda exposure

Polarization between groups can be represented as:

\[
\Pi = |\bar{J}_A - \bar{J}_B|
\]

A feedback model can represent escalation:

\[
\Pi_{t+1} = \Pi_t + \lambda E_t + \mu O_t - \rho D_t
\]

where enemy-framing and outrage amplification increase polarization, while democratic trust, cross-group contact, and deliberative institutions can dampen it.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-psychology-propaganda-and-political-polarization
python3 python/simulate_propaganda_polarization.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-psychology-propaganda-and-political-polarization
Rscript r/model_propaganda_polarization.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-psychology-propaganda-and-political-polarization
sqlite3 outputs/tables/propaganda_polarization.sqlite < sql/schema.sql
sqlite3 outputs/tables/propaganda_polarization.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not psychological assessment tools, moral scoring systems, political profiling tools, surveillance systems, persuasion engines, election-targeting tools, disciplinary systems, or automated judgment systems.

The goal is to clarify how propaganda, identity, trust, threat, and outrage can reshape moral-political perception. The scaffold should not be used to classify real people, manipulate audiences, target political groups, or replace ethical, legal, civic, or institutional judgment.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/moral-psychology-propaganda-and-political-polarization
