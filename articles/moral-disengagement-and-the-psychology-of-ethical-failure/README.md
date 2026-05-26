# Moral Disengagement and the Psychology of Ethical Failure

This article-level repository folder supports the article **“Moral Disengagement and the Psychology of Ethical Failure.”** It provides reproducible scaffolding for synthetic data, moral-disengagement modeling, ethical-failure simulations, organizational and institutional pressure scenarios, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that moral disengagement is one of the central mechanisms through which ethical self-regulation fails. It does not abolish morality; it reroutes it. People may continue to believe in fairness, care, responsibility, dignity, and decency, but the relevant act, victim, consequence, or responsibility is cognitively reframed so that those standards no longer exert their full force.

## Purpose

This folder supports transparent, reproducible exploration of moral disengagement and ethical failure, especially:

- moral justification
- euphemistic language
- advantageous comparison
- responsibility shifting
- responsibility diffusion
- consequence distortion
- dehumanization
- victim blaming
- anticipated guilt
- institutional pressure
- consequence visibility
- victim recognition
- accountability strength
- moral disengagement
- unethical action probability
- ethical failure risk
- high-risk synthetic cases
- organizational disengagement scenarios
- bureaucratic and technological distance

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real persons, workplaces, organizations, institutions, communities, political groups, or ethical conduct.

## Folder structure

```text
moral-disengagement-and-the-psychology-of-ethical-failure/
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

Moral disengagement can be modeled as a latent process that weakens the link between moral standards and action:

\[
D_i = f(J_i, E_i, R_i, H_i)
\]

where:

- \(D_i\) = moral disengagement level for person or agent \(i\)
- \(J_i\) = justificatory restructuring
- \(E_i\) = euphemistic framing
- \(R_i\) = responsibility shifting
- \(H_i\) = perceived humanness of the target

Unethical action can be modeled as:

\[
A_i = \sigma(\alpha D_i - \beta G_i + \gamma P_i + \varepsilon_i)
\]

where:

- \(A_i\) = unethical action probability
- \(\sigma\) = logistic transformation
- \(G_i\) = anticipated guilt
- \(P_i\) = institutional pressure or situational support for misconduct

A responsibility-diffusion model can be written as:

\[
D_i = \theta_0 + \theta_1 L_i + \theta_2 B_i + \theta_3 U_i + u_i
\]

where:

- \(L_i\) = leadership authorization
- \(B_i\) = bureaucratic distance
- \(U_i\) = uncertainty about personal agency

A repair-oriented ethical-risk model can include countervailing forces:

\[
E_i^{*} = \sigma(\alpha D_i + \beta P_i + \gamma B_i - \delta C_i - \lambda V_i - \mu A_i)
\]

where ethical failure risk rises with disengagement, pressure, and bureaucratic distance, but falls when consequences are visible, victims are humanized, and accountability is strong.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-disengagement-and-the-psychology-of-ethical-failure
python3 python/simulate_moral_disengagement_ethical_failure.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-disengagement-and-the-psychology-of-ethical-failure
Rscript r/model_moral_disengagement_ethical_failure.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/moral-disengagement-and-the-psychology-of-ethical-failure
sqlite3 outputs/tables/moral_disengagement_ethical_failure.sqlite < sql/schema.sql
sqlite3 outputs/tables/moral_disengagement_ethical_failure.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not employee-screening tools, workplace-surveillance systems, misconduct prediction systems, disciplinary tools, psychological assessments, legal tools, content-moderation systems, political targeting systems, or automated moral judgment systems.

The goal is to clarify how moral disengagement can weaken self-sanction, distance actors from harm, shift responsibility, hide consequences, and increase ethical failure risk under institutional pressure. The scaffold should not be used to evaluate real people, workers, organizations, institutions, communities, conflicts, or moral worth.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/moral-disengagement-and-the-psychology-of-ethical-failure
