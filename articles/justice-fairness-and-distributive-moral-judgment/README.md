# Justice, Fairness, and Distributive Moral Judgment

This article-level repository folder supports the article **“Justice, Fairness, and Distributive Moral Judgment.”** It provides reproducible scaffolding for synthetic data, distributive moral judgment modeling, fairness-principle simulations, inequity-aversion examples, institutional distributive legitimacy analysis, documentation, SQL schema, notebooks, and multi-language computational examples.

The article argues that justice, fairness, and distributive moral judgment should be understood as a plural moral field rather than a single simple intuition. Human beings care about equality, merit, need, desert, reciprocity, priority to the worse off, and respect, but they do not always combine those concerns consistently. Moral psychology helps explain these tensions by showing how fairness is both a moral capacity and a socially patterned judgment vulnerable to self-interest, group identity, ideology, institutional framing, and historical memory.

## Purpose

This folder supports transparent, reproducible exploration of distributive moral judgment, especially:

- equality weight
- equity weight
- need weight
- desert weight
- priority to the worse off
- self-interest bias
- procedural trust
- group distance
- historical repair salience
- distributive judgment
- support for fair allocation
- inequity aversion
- institutional distributive legitimacy
- high-need low-support cases
- distributive pluralism
- distributive-policy scenarios

The included workflows use synthetic data. They are intended for methodological demonstration, teaching, reproducible article support, and conceptual modeling. They are not empirical estimates of real persons, institutions, political groups, policies, communities, or justice systems.

## Folder structure

```text
justice-fairness-and-distributive-moral-judgment/
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

Distributive moral judgment can be modeled as the weighted evaluation of competing fairness principles:

\[
J_i = \alpha E_i + \beta Q_i + \gamma N_i + \delta D_i - \lambda S_i
\]

where:

- \(J_i\) = distributive judgment of person \(i\)
- \(E_i\) = equality weight
- \(Q_i\) = equity or contribution weight
- \(N_i\) = need weight
- \(D_i\) = desert weight
- \(S_i\) = self-interest bias

Inequity aversion can be represented as:

\[
I_i = \theta_1 U_i^{-} + \theta_2 U_i^{+}
\]

where:

- \(U_i^{-}\) = disadvantageous inequity
- \(U_i^{+}\) = advantageous inequity

A context-sensitive model can represent shifts across cases:

\[
J_{ij} = \alpha_i E_{ij} + \beta_i Q_{ij} + \gamma_i N_{ij} + \delta_i D_{ij} + \varepsilon_{ij}
\]

where \(j\) indexes the allocation context.

Institutional distributive legitimacy can be modeled as:

\[
L_g = \omega_1 O_g + \omega_2 P_g + \omega_3 R_g - \omega_4 B_g
\]

where legitimacy rises with outcome fairness, procedural fairness, and recognition, and falls with bias or unequal treatment.

## Running the examples

### Python

```bash
cd ~/Downloads/moral-psychology-code/articles/justice-fairness-and-distributive-moral-judgment
python3 python/simulate_justice_fairness_distributive_judgment.py
```

### R

```bash
cd ~/Downloads/moral-psychology-code/articles/justice-fairness-and-distributive-moral-judgment
Rscript r/model_justice_fairness_distributive_judgment.R
```

### SQL

```bash
cd ~/Downloads/moral-psychology-code/articles/justice-fairness-and-distributive-moral-judgment
sqlite3 outputs/tables/justice_fairness_distributive_judgment.sqlite < sql/schema.sql
sqlite3 outputs/tables/justice_fairness_distributive_judgment.sqlite < sql/example_queries.sql
```

## Responsible use

These examples are for synthetic-data research, methods demonstration, article support, and reproducible learning. They are not policy-evaluation tools, eligibility systems, welfare-scoring systems, employment-compensation tools, political persuasion systems, surveillance systems, psychological assessment tools, legal advice systems, or automated distributive-justice decision systems.

The goal is to clarify how distributive moral judgment can emerge from competing fairness principles, self-interest bias, procedural legitimacy, group identity, and historical repair claims. The scaffold should not be used to evaluate real persons, communities, policies, institutions, benefits eligibility, wages, public allocations, or social groups.

## Article repository link

https://github.com/Content-Catalyst-LLC/moral-psychology-code/tree/main/articles/justice-fairness-and-distributive-moral-judgment
