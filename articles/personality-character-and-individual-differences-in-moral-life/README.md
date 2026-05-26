# Personality, Character, and Individual Differences in Moral Life

This article-level repository folder supports the article **“Personality, Character, and Individual Differences in Moral Life.”** It provides reproducible scaffolding for synthetic data, moral-individual-difference modeling, person-situation interaction simulations, organizational-context scenarios, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that moral individuality should be understood as a layered and context-sensitive structure. Persons differ in temperament, emotional reactivity, conscientiousness, empathy, honesty, moral identity, self-interest bias, ideological style, and responsiveness to social norms. But those differences do not operate in isolation. Character is expressed through situations. Personality is shaped by social worlds. Moral identity is activated or suppressed by institutions. Virtue can be supported, tested, weakened, or distorted by context.

## Purpose

This folder supports transparent, reproducible exploration of personality, character, and individual differences in moral life, especially:

- broad personality
- character strength
- moral identity
- empathy
- conscientious self-regulation
- humility
- self-interest bias
- situational pressure
- voice safety
- accountability strength
- moral response profile
- moral action probability
- person-situation interaction
- conditional stability
- high-profile low-action cases
- organizational moral expression
- character and institutional climate

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real persons, employees, students, organizations, institutions, communities, cultures, political groups, or moral worth.

## Folder structure

```text
personality-character-and-individual-differences-in-moral-life/
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

Individual differences in moral life can be modeled as the joint effect of general disposition, morally specific self-structure, and context:

\[
M_i = f(P_i, C_i, I_i, B_i)
\]

where:

- \(M_i\) = moral-response profile of person or agent \(i\)
- \(P_i\) = broader personality structure
- \(C_i\) = character strength
- \(I_i\) = moral-identity integration
- \(B_i\) = self-interest bias

Moral action in a given situation \(j\) can be written as:

\[
A_{ij} = \sigma(\alpha P_i + \beta C_i + \gamma I_i - \delta B_i + \eta S_j + \kappa X_{ij})
\]

where:

- \(A_{ij}\) = moral action probability
- \(\sigma\) = logistic transformation
- \(S_j\) = situational support or pressure
- \(X_{ij}\) = person-situation interaction

A CAPS-style formulation can represent conditional stability:

\[
R_i(k) = f_k(U_i)
\]

where \(R_i(k)\) is person \(i\)'s response in situation class \(k\), and \(U_i\) is the person’s organized cognitive-affective system.

Organizational expression of character can be modeled as:

\[
E_{ij} = \sigma(\theta_1 C_i + \theta_2 I_i + \theta_3 V_j - \theta_4 P_j - \theta_5 R_j)
\]

where ethical expression rises with character strength, moral identity, and institutional voice safety, but falls under pressure, retaliation risk, and fear.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/personality-character-and-individual-differences-in-moral-life
python3 python/simulate_personality_character_moral_variation.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/personality-character-and-individual-differences-in-moral-life
Rscript r/model_personality_character_moral_variation.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/personality-character-and-individual-differences-in-moral-life
sqlite3 outputs/tables/personality_character_moral_variation.sqlite < sql/schema.sql
sqlite3 outputs/tables/personality_character_moral_variation.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not employee-screening tools, hiring tools, student-evaluation systems, workplace-surveillance systems, psychological assessments, moral-character scoring systems, disciplinary tools, legal tools, political targeting systems, or automated moral judgment systems.

The goal is to clarify how personality, character, moral identity, empathy, self-interest bias, institutional pressure, voice safety, and accountability can shape moral action across different situations. The scaffold should not be used to evaluate real people, workers, students, organizations, cultures, communities, political groups, or moral worth.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/personality-character-and-individual-differences-in-moral-life
