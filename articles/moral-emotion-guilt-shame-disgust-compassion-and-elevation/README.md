# Moral Emotion: Guilt, Shame, Disgust, Compassion, and Elevation

This article-level repository folder supports the article **“Moral Emotion: Guilt, Shame, Disgust, Compassion, and Elevation.”** It provides reproducible scaffolding for synthetic data, differentiated moral-emotion models, guilt-versus-shame analysis, disgust and boundary-threat scenarios, compassion and suffering-response models, elevation and moral-exemplar simulations, helping and repair workflows, avoidance analysis, institutional emotional-climate examples, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that moral emotions are best understood as differentiated moral forces rather than a single general category of “feeling.” Guilt, shame, disgust, compassion, and elevation have different objects, directions, risks, and behavioral tendencies. Ethical maturity does not require escaping moral emotion; it requires learning how to interpret moral feeling, discipline it, and direct it toward truth, repair, dignity, and care.

## Purpose

This folder supports transparent, reproducible exploration of moral emotions, especially:

- guilt
- shame
- disgust
- compassion
- elevation
- perceived wrongdoing
- specific responsibility
- global self-condemnation
- exposure before others
- perceived violation
- boundary threat
- perceived suffering
- mind perception
- admired moral action
- perceived moral excellence
- agency capacity
- repair pathway
- social support
- helping tendency
- repair tendency
- avoidance tendency
- constructive moral-emotion profiles
- punitive moral-emotion profiles
- high-shame high-disgust cases
- high-compassion high-elevation cases
- high-guilt high-repair cases
- institutional emotional climates

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real persons, students, employees, leaders, organizations, institutions, communities, cultures, professions, religious communities, political groups, or moral worth.

## Folder structure

```text
moral-emotion-guilt-shame-disgust-compassion-and-elevation/
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

Moral emotions can be modeled as differentiated responses to distinct moral appraisals rather than as one general moral feeling:

\[
\mathbf{E}_i = (G_i, S_i, D_i, C_i, L_i)
\]

where:

- \(G_i\) = guilt
- \(S_i\) = shame
- \(D_i\) = disgust
- \(C_i\) = compassion
- \(L_i\) = elevation

Guilt and shame can be distinguished by appraisal target:

\[
G_i = \alpha_1 W_i + \beta_1 R_i + \varepsilon_i
\]

\[
S_i = \alpha_2 X_i + \beta_2 E_i + \eta_i
\]

where \(W_i\) is perceived wrongdoing, \(R_i\) is specific responsibility, \(X_i\) is global self-condemnation, and \(E_i\) is exposure before others.

Other moral emotions can be modeled as:

\[
D_i = \gamma_1 V_i + \gamma_2 B_i + u_i
\]

\[
C_i = \delta_1 H_i + \delta_2 M_i + v_i
\]

\[
L_i = \phi_1 A_i + \phi_2 P_i + w_i
\]

where \(V_i\) is perceived violation, \(B_i\) is boundary threat, \(H_i\) is perceived suffering, \(M_i\) is mind perception, \(A_i\) is admired moral action, and \(P_i\) is perceived moral excellence.

Prosocial response can be modeled as:

\[
P_i^{help} = \sigma(\lambda_1 G_i + \lambda_2 C_i + \lambda_3 L_i - \lambda_4 S_i - \lambda_5 D_i)
\]

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-emotion-guilt-shame-disgust-compassion-and-elevation
python3 python/simulate_moral_emotions.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-emotion-guilt-shame-disgust-compassion-and-elevation
Rscript r/model_moral_emotions.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-emotion-guilt-shame-disgust-compassion-and-elevation
sqlite3 outputs/tables/moral_emotions.sqlite < sql/schema.sql
sqlite3 outputs/tables/moral_emotions.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not guilt assessments, shame assessments, disgust assessments, compassion assessments, empathy assessments, moral-emotion diagnostics, employee-screening systems, student-assessment systems, workplace-surveillance systems, psychological assessments, clinical tools, legal tools, hiring tools, promotion tools, moral-worth measures, or automated moral judgment systems.

The goal is to clarify how guilt, shame, disgust, compassion, elevation, moral appraisal, self-evaluation, boundary-making, care, admiration, repair, helping, avoidance, and institutional emotional climates shape moral judgment and ethical action. The scaffold should not be used to evaluate real persons, employees, students, leaders, workers, organizations, institutions, communities, cultures, religious communities, political groups, professions, or moral worth.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/moral-emotion-guilt-shame-disgust-compassion-and-elevation
