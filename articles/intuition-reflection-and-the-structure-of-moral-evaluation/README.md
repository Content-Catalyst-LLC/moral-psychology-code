# Intuition, Reflection, and the Structure of Moral Evaluation

This article-level repository folder supports the article **“Intuition, Reflection, and the Structure of Moral Evaluation.”** It provides reproducible scaffolding for synthetic data, intuitive-appraisal models, reflective-evaluation models, intuition-weight analysis, reflective-revision simulations, high-intuition high-revision case detection, reflection-correction case analysis, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that moral evaluation is best understood as a structured interaction among intuition, emotion, perception, reflection, social reasoning, and cultural meaning. Intuition often gives moral judgment its first force. Reflection can clarify, revise, discipline, or rationalize that force. Neither is morally innocent. Intuition can reveal harm before slow reasoning catches up, but it can also reproduce bias, disgust, tribalism, and inherited ideology. Reflection can correct impulse and widen moral concern, but it can also become post hoc rationalization, abstraction, excuse-making, or strategic defense of prior commitments.

## Purpose

This folder supports transparent, reproducible exploration of intuition, reflection, and moral evaluation, especially:

- intuitive appraisal
- reflective evaluation
- final moral evaluation
- reflective revision
- revision magnitude
- perceived harm
- affective activation
- social salience
- principled reasoning
- evidential reconsideration
- contextual knowledge
- cultural framing
- group identity pressure
- time for reflection
- institutional review
- high-intuition high-revision cases
- reflection-correction cases
- moral dumbfounding
- post hoc justification
- social reasoning
- institutional reflective discipline

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real persons, students, employees, leaders, organizations, institutions, communities, cultures, professions, religious communities, political groups, or moral worth.

## Folder structure

```text
intuition-reflection-and-the-structure-of-moral-evaluation/
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

Moral evaluation can be modeled as the combined output of intuitive appraisal and reflective revision:

\[
M_i = \omega I_i + (1 - \omega)R_i
\]

where:

- \(M_i\) = final moral evaluation
- \(I_i\) = intuitive appraisal
- \(R_i\) = reflective evaluation
- \(\omega\) = relative weight assigned to intuition

Intuitive appraisal can be modeled as:

\[
I_i = \alpha H_i + \beta A_i + \gamma S_i + \varepsilon_i
\]

where \(H_i\) is perceived harm, \(A_i\) is affective activation, and \(S_i\) is social salience.

Reflective evaluation can be modeled as:

\[
R_i = \theta P_i + \lambda E_i + \mu C_i + \nu X_i
\]

where \(P_i\) is principled reasoning, \(E_i\) is evidential reconsideration, \(C_i\) is cultural framing, and \(X_i\) is contextual knowledge.

Reflective correction can be represented as:

\[
\Delta_i = R_i - I_i
\]

where \(\Delta_i\) measures the size and direction of revision.

The weight assigned to intuition can be modeled as:

\[
\omega_i = \sigma(\rho_0 + \rho_1 A_i + \rho_2 S_i - \rho_3 E_i - \rho_4 T_i)
\]

where \(T_i\) represents time for reflection.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/intuition-reflection-and-the-structure-of-moral-evaluation
python3 python/simulate_intuition_reflection.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/intuition-reflection-and-the-structure-of-moral-evaluation
Rscript r/model_intuition_reflection.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/intuition-reflection-and-the-structure-of-moral-evaluation
sqlite3 outputs/tables/intuition_reflection.sqlite < sql/schema.sql
sqlite3 outputs/tables/intuition_reflection.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not moral-judgment assessments, intuition scores, reasoning assessments, employee-screening systems, student-assessment systems, workplace-surveillance systems, psychological assessments, clinical tools, legal tools, hiring tools, promotion tools, moral-worth measures, or automated moral judgment systems.

The goal is to clarify how intuitive appraisal, reflective evaluation, affect, harm perception, social salience, evidence, cultural framing, institutional review, group identity pressure, and revision dynamics shape moral judgment. The scaffold should not be used to evaluate real persons, employees, students, leaders, workers, organizations, institutions, communities, cultures, religious communities, political groups, professions, or moral worth.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/intuition-reflection-and-the-structure-of-moral-evaluation
