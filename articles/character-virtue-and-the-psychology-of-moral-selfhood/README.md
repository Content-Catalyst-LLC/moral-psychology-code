# Character, Virtue, and the Psychology of Moral Selfhood

This article-level repository folder supports the article **“Character, Virtue, and the Psychology of Moral Selfhood.”** It provides reproducible scaffolding for synthetic data, character and virtue modeling, moral selfhood simulations, repair-capacity analysis, person-situation interaction examples, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that character should be understood neither as an invulnerable inner essence nor as an illusion dissolved by context. Character is a structured but situated pattern of moral perception, emotion, motivation, habit, judgment, and conduct. Virtue is the disciplined cultivation of that pattern toward honesty, courage, care, justice, humility, temperance, practical wisdom, and responsibility. Moral selfhood is the reflective and embodied integration of these patterns into a person’s ongoing life.

## Purpose

This folder supports transparent, reproducible exploration of character, virtue, and moral selfhood, especially:

- trait disposition
- habituated practice
- identity integration
- self-regulation
- accountability
- repair capacity
- situational pressure
- institutional support
- character strength
- moral selfhood profile
- virtuous action probability
- high-character low-action cases
- virtue development
- moral repair
- person-situation interaction
- institutional support for character formation

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real persons, students, employees, leaders, organizations, workplaces, schools, institutions, cultures, communities, professions, or moral worth.

## Folder structure

```text
character-virtue-and-the-psychology-of-moral-selfhood/
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

Character can be modeled as a structured pattern of moral response across situations rather than as perfectly invariant behavior:

\[
C_i = f(T_i, H_i, I_i, R_i)
\]

where:

- \(C_i\) = moral character profile of person or agent \(i\)
- \(T_i\) = trait-like disposition
- \(H_i\) = habituated practice
- \(I_i\) = identity integration
- \(R_i\) = self-regulatory capacity

A situation-sensitive expression model can be written as:

\[
B_{ij} = \alpha C_i + \beta S_j + \gamma(C_i \times S_j) + \varepsilon_{ij}
\]

where \(B_{ij}\) is behavior of person \(i\) in situation \(j\), and \(S_j\) represents situational affordances or pressures.

Virtue can be represented as cultivated excellence in repeated response:

\[
V_i(t+1) = V_i(t) + \lambda P_i - \mu D_i
\]

where virtue strengthens through disciplined practice and weakens under degrading pressure or corrupting incentives.

Moral selfhood can be modeled as the integration of virtue, identity, repair, and accountability:

\[
M_i = \omega_1 V_i + \omega_2 I_i + \omega_3 A_i + \omega_4 Q_i
\]

where moral selfhood depends not only on admirable traits, but also on answerability and the ability to respond truthfully after failure.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/character-virtue-and-the-psychology-of-moral-selfhood
python3 python/simulate_character_virtue_moral_selfhood.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/character-virtue-and-the-psychology-of-moral-selfhood
Rscript r/model_character_virtue_moral_selfhood.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/character-virtue-and-the-psychology-of-moral-selfhood
sqlite3 outputs/tables/character_virtue_moral_selfhood.sqlite < sql/schema.sql
sqlite3 outputs/tables/character_virtue_moral_selfhood.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not personality-assessment tools, virtue-scoring tools, employee-screening systems, student-assessment systems, workplace-surveillance systems, psychological assessments, discipline systems, legal tools, hiring tools, promotion tools, or automated moral judgment systems.

The goal is to clarify how character, virtue, moral identity, habituation, self-regulation, accountability, repair, institutions, and situational pressure shape moral selfhood and ethical action across different contexts. The scaffold should not be used to evaluate real persons, employees, students, workers, organizations, communities, cultures, political groups, professions, or moral worth.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/character-virtue-and-the-psychology-of-moral-selfhood
