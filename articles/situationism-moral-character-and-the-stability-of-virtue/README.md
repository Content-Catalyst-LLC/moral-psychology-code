# Situationism, Moral Character, and the Stability of Virtue

This article-level repository folder supports the article **“Situationism, Moral Character, and the Stability of Virtue.”** It provides reproducible scaffolding for synthetic data, person-situation interaction modeling, if-then character signatures, virtue-fragility simulations, institutional support scenarios, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that the strongest contemporary view is neither naive confidence in perfectly global virtues nor total skepticism about character. Situationism exposed real weaknesses in overly simple trait pictures, but it did not make moral character unintelligible. Instead, it pushed moral psychology toward more modest, empirically informed models of virtue: models in which stable moral patterns may exist, but are expressed through context-sensitive tendencies, learned habits, self-regulation, moral identity, practical wisdom, and structured if-then responses rather than flawless uniformity across all situations.

## Purpose

This folder supports transparent, reproducible exploration of situationism, moral character, and virtue stability, especially:

- character strength
- self-regulation
- habit strength
- moral identity
- depletion
- situational pressure
- voice safety
- accountability visibility
- person-situation interaction
- if-then response patterns
- moral action probability
- high-character low-action cases
- virtue fragility
- institutional support
- situation classes
- character expression under contextual pressure

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real persons, students, employees, organizations, institutions, cultures, communities, professions, or moral worth.

## Folder structure

```text
situationism-moral-character-and-the-stability-of-virtue/
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

The debate can be modeled by treating morally relevant behavior as a joint function of person-level character, situational influence, and their interaction:

\[
B_{ij} = \alpha C_i + \beta S_j + \gamma(C_i \times S_j) + \varepsilon_{ij}
\]

where:

- \(B_{ij}\) = morally relevant behavior by person or agent \(i\) in situation \(j\)
- \(C_i\) = character strength
- \(S_j\) = situational pressure or affordance
- \(C_i \times S_j\) = person-situation interaction

If one assumes robust global virtue, the variance explained by \(C_i\) should dominate across a wide range of situations. If one assumes radical situationism, \(S_j\) should dominate and \(C_i\) should contribute little. A moderate view expects both to matter, with interaction effects revealing that character is structured but context-sensitive.

CAPS-style stability can be represented through if-then signatures:

\[
R_i(k) = f_k(U_i)
\]

where \(R_i(k)\) is person \(i\)'s response in situation class \(k\), and \(U_i\) is the organized set of cognitive-affective units shaping that response.

Virtue fragility can be modeled by adding depletion, accountability, and institutional support:

\[
A_{ij} = \sigma(\theta_1 C_i + \theta_2 H_i + \theta_3 V_j - \theta_4 P_j - \theta_5 D_i + \theta_6 A_j)
\]

where moral action probability rises with character, habit strength, voice safety, and accountability, but falls under situational pressure and depletion.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/situationism-moral-character-and-the-stability-of-virtue
python3 python/simulate_situationism_character_virtue_stability.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/situationism-moral-character-and-the-stability-of-virtue
Rscript r/model_situationism_character_virtue_stability.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/situationism-moral-character-and-the-stability-of-virtue
sqlite3 outputs/tables/situationism_character_virtue_stability.sqlite < sql/schema.sql
sqlite3 outputs/tables/situationism_character_virtue_stability.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not personality-assessment tools, virtue-scoring tools, employee-screening systems, student-assessment systems, workplace-surveillance systems, psychological assessments, discipline systems, legal tools, hiring tools, promotion tools, or automated moral judgment systems.

The goal is to clarify how moral character, virtue, self-regulation, habit, identity, institutional pressure, accountability, and situational context interact to shape ethical action across different circumstances. The scaffold should not be used to evaluate real persons, employees, students, workers, organizations, communities, cultures, political groups, professions, or moral worth.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/situationism-moral-character-and-the-stability-of-virtue
