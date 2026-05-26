# Social Identity, Group Life, and Moral Polarization

This article-level repository folder supports the article **“Social Identity, Group Life, and Moral Polarization.”** It provides reproducible scaffolding for synthetic data, group-conditioned moral-judgment modeling, moral-polarization analysis, moral-exclusion risk scenarios, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that people do not reason morally only as isolated individuals. They reason as members of groups, communities, traditions, parties, professions, movements, religious communities, nations, institutions, and publics. Social identity shapes trust, salience, loyalty, threat perception, moral concern, and the interpretation of public life.

## Purpose

This folder supports transparent, reproducible exploration of social identity and moral polarization, especially:

- value profiles
- group identity strength
- group norm pressure
- perceived threat
- institutional trust
- cross-group contact
- dehumanizing rhetoric
- loyalty pressure
- moral judgment
- moral exclusion risk
- polarization distance
- group-conditioned divergence
- identity-threat feedback
- institutional moderation

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real political groups, ideological groups, communities, movements, parties, institutions, or populations.

## Folder structure

```text
social-identity-group-life-and-moral-polarization/
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

Moral polarization can be modeled as group-conditioned divergence in moral judgment:

\[
J_{ig} = \alpha V_i + \beta I_g + \gamma N_g + \delta T_i + \varepsilon_{ig}
\]

where:

- \(J_{ig}\) = moral judgment of person \(i\) in group \(g\)
- \(V_i\) = individual value profile
- \(I_g\) = group identity strength
- \(N_g\) = group norm pressure
- \(T_i\) = perceived threat

Polarization between two groups can be represented as:

\[
P = \left| \bar{J}_{g_1} - \bar{J}_{g_2} \right|
\]

A feedback model can represent escalation over time:

\[
P_{t+1} = P_t + \lambda O_t + \mu Q_t - \rho C_t
\]

where outgroup threat framing and conformity pressure increase polarization, while cross-group contact, institutional credibility, and deliberative moderation can dampen it.

A moral-exclusion risk model can be represented as:

\[
ME_i = \sigma(\theta_1 T_i + \theta_2 D_i + \theta_3 L_i - \theta_4 R_i)
\]

where moral exclusion risk rises with threat, dehumanizing rhetoric, and loyalty pressure, and falls with recognition of shared dignity, rights, institutional trust, and cross-group contact.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/social-identity-group-life-and-moral-polarization
python3 python/simulate_social_identity_polarization.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/social-identity-group-life-and-moral-polarization
Rscript r/model_social_identity_moral_polarization.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/social-identity-group-life-and-moral-polarization
sqlite3 outputs/tables/social_identity_polarization.sqlite < sql/schema.sql
sqlite3 outputs/tables/social_identity_polarization.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not political profiling tools, ideological scoring systems, psychological assessment tools, surveillance systems, persuasion systems, targeting tools, disciplinary systems, or automated judgment systems.

The goal is to clarify how social identity, group norms, perceived threat, institutional trust, cross-group contact, and dehumanizing rhetoric can shape moral judgment and polarization. The scaffold should not be used to classify real people, target groups, manipulate audiences, or replace ethical, civic, legal, or institutional judgment.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/social-identity-group-life-and-moral-polarization
