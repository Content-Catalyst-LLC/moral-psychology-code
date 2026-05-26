# Social Media, Outrage, and Networked Moral Life

This article-level repository folder supports the article **“Social Media, Outrage, and Networked Moral Life.”** It provides reproducible scaffolding for synthetic data, networked moral-outrage modeling, norm-distortion analysis, moralized sharing workflows, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that social media does not merely transmit moral judgment. It reorganizes how moral judgment is seen, rewarded, spread, archived, contested, and experienced. In digital environments, moral expression is shaped by attention, identity, virality, platform design, audience feedback, visibility bias, and network structure.

## Purpose

This folder supports transparent, reproducible exploration of networked moral life, especially:

- outrage intensity
- expected social reward
- algorithmic amplification
- group-identity salience
- visibility bias
- contextual correction
- misinformation susceptibility
- cross-group exposure
- public outrage expression
- perceived norm extremity
- moralized sharing
- networked moral amplification

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real platforms, users, groups, or communities.

## Folder structure

```text
social-media-outrage-and-networked-moral-life/
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

Networked moral expression can be modeled as a function of outrage intensity, social reward, algorithmic amplification, and group identity:

\[
E_i = \sigma(\alpha O_i + \beta R_i + \gamma A_i + \delta G_i)
\]

where:

- \(E_i\) = probability that user \(i\) publicly expresses outrage
- \(O_i\) = felt outrage
- \(R_i\) = expected social reward
- \(A_i\) = algorithmic amplification likelihood
- \(G_i\) = group-identity salience

Norm distortion can be modeled as:

\[
N_t^{perceived} = N_t^{actual} + \lambda V_t
\]

where \(V_t\) represents visibility bias toward extreme or highly engaging content.

A feedback model can be written as:

\[
O_{t+1} = O_t + \phi S_t + \kappa R_t - \rho C_t
\]

where outrage grows through shareability and reward, and is dampened by contextual correction, deliberation, or repair.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/social-media-outrage-and-networked-moral-life
python3 python/simulate_networked_moral_amplification.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/social-media-outrage-and-networked-moral-life
Rscript r/model_social_media_moral_outrage.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/social-media-outrage-and-networked-moral-life
sqlite3 outputs/tables/social_media_outrage.sqlite < sql/schema.sql
sqlite3 outputs/tables/social_media_outrage.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not psychological assessment tools, moral scoring systems, political profiling tools, surveillance systems, persuasion engines, platform-optimization tools, disciplinary systems, or automated judgment systems.

The goal is to clarify how platforms can reshape moral attention, amplify outrage, distort perceived norms, and transform moral expression into a networked public act. The scaffold should not be used to classify real users, target audiences, manipulate engagement, or replace ethical, legal, civic, or institutional judgment.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/social-media-outrage-and-networked-moral-life
