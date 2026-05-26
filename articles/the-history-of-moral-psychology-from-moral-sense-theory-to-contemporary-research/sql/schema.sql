-- SQLite schema for synthetic history of moral psychology scaffold.
-- Educational and reproducible research scaffold only.

DROP TABLE IF EXISTS historical_periods;
DROP TABLE IF EXISTS component_map;
DROP TABLE IF EXISTS paradigm_notes;
DROP TABLE IF EXISTS risk_factors;

CREATE TABLE historical_periods (
    period TEXT PRIMARY KEY,
    year_mid INTEGER NOT NULL,
    sentiment REAL NOT NULL,
    reason REAL NOT NULL,
    development REAL NOT NULL,
    intuition REAL NOT NULL,
    culture_politics REAL NOT NULL,
    neuroscience_experiment REAL NOT NULL,
    institutions REAL NOT NULL
);

CREATE TABLE component_map (
    component TEXT NOT NULL,
    variable TEXT NOT NULL PRIMARY KEY,
    description TEXT NOT NULL,
    interpretive_warning TEXT NOT NULL
);

CREATE TABLE paradigm_notes (
    period TEXT PRIMARY KEY,
    major_figures_or_traditions TEXT NOT NULL,
    central_question TEXT NOT NULL,
    historical_contribution TEXT NOT NULL,
    limitation_or_risk TEXT NOT NULL
);

CREATE TABLE risk_factors (
    risk_factor TEXT PRIMARY KEY,
    mechanism TEXT NOT NULL,
    possible_dampener TEXT NOT NULL
);

INSERT INTO historical_periods VALUES
('Moral Sense Theory', 1735, 0.80, 0.30, 0.10, 0.35, 0.10, 0.00, 0.15),
('Hume and Smith', 1765, 0.85, 0.35, 0.10, 0.40, 0.15, 0.00, 0.25),
('Rationalist Countercurrent', 1785, 0.20, 0.90, 0.10, 0.10, 0.10, 0.00, 0.20),
('Nineteenth-Century Social and Evolutionary Shifts', 1880, 0.35, 0.45, 0.25, 0.30, 0.35, 0.05, 0.40),
('Developmental Tradition', 1965, 0.20, 0.75, 0.95, 0.20, 0.15, 0.20, 0.20),
('Care and Domain Critiques', 1985, 0.35, 0.45, 0.70, 0.30, 0.35, 0.25, 0.30),
('Social Learning and Moral Disengagement', 1995, 0.35, 0.45, 0.55, 0.35, 0.40, 0.35, 0.55),
('Intuitionist / Dual-Process Era', 2005, 0.55, 0.35, 0.30, 0.90, 0.35, 0.85, 0.35),
('Experimental Moral Psychology Era', 2015, 0.50, 0.40, 0.35, 0.80, 0.60, 0.95, 0.50),
('Contemporary Pluralist and Institutional Era', 2025, 0.45, 0.40, 0.45, 0.75, 0.85, 0.80, 0.90);

INSERT INTO component_map VALUES
('period', 'period', 'Synthetic period label in the history of moral psychology', 'Not a formal periodization'),
('period', 'year_mid', 'Approximate midpoint year for conceptual visualization', 'Not a precise historical boundary'),
('sentiment', 'sentiment', 'Synthetic emphasis on moral sense sympathy moral feeling approval and conscience', 'Not a bibliometric measure'),
('reason', 'reason', 'Synthetic emphasis on reason duty principle obligation and reflective agency', 'Not a citation measure'),
('development', 'development', 'Synthetic emphasis on childhood stages education perspective-taking and moral growth', 'Not a publication-count measure'),
('intuition', 'intuition', 'Synthetic emphasis on intuition rapid evaluation affective appraisal and moral dumbfounding', 'Not a disciplinary ranking'),
('culture_politics', 'culture_politics', 'Synthetic emphasis on culture politics pluralism identity and group life', 'Not a real cultural prevalence measure'),
('neuroscience_experiment', 'neuroscience_experiment', 'Synthetic emphasis on neuroscience experiment measurement and lab method', 'Not a claim about research volume'),
('institutions', 'institutions', 'Synthetic emphasis on organizations platforms law bureaucracy and structured moral environments', 'Not an institutional audit'),
('summary', 'dominant_mode', 'Synthetic highest-weight explanatory mode in a period', 'Not a claim that one mode fully defines the period'),
('summary', 'diversification', 'Normalized entropy-style index of explanatory pluralism', 'Not a validated historical metric'),
('summary', 'field_center_score', 'Simple summed synthetic field-center score', 'Not a quality or importance measure');

INSERT INTO paradigm_notes VALUES
('Moral Sense Theory', 'Shaftesbury, Hutcheson', 'How do human beings perceive virtue and vice?', 'Made inner moral responsiveness and benevolence central', 'Can leave development culture and disagreement underexplained'),
('Hume and Smith', 'David Hume, Adam Smith', 'How do sympathy sentiment and spectatorship shape moral life?', 'Linked morality to feeling social appraisal and self-evaluation', 'Can understate principle and institutional power if read too narrowly'),
('Rationalist Countercurrent', 'Kantian and duty-centered traditions', 'How do duty principle dignity and universality bind moral agents?', 'Preserved critique of sentiment convention and partiality', 'Can become abstract or detached from relational care'),
('Nineteenth-Century Social and Evolutionary Shifts', 'Evolutionary thought, social theory, character traditions', 'How do cooperation character habit and society shape morality?', 'Connected moral agency to biological social and historical formation', 'Can overgeneralize civilizational or evolutionary narratives'),
('Developmental Tradition', 'Jean Piaget, Lawrence Kohlberg', 'How does moral reasoning develop across childhood and adolescence?', 'Made moral development and justification structure central', 'Can privilege justice reasoning and verbal abstraction'),
('Care and Domain Critiques', 'Carol Gilligan, care ethics, social domain theory', 'What does justice-only stage theory miss?', 'Expanded moral psychology to care relationship domain differentiation and context', 'Can be oversimplified as care versus justice'),
('Social Learning and Moral Disengagement', 'Albert Bandura and social-cognitive approaches', 'How do people do harm while preserving moral self-image?', 'Explained self-regulation rationalization dehumanization and disengagement', 'Can focus on mechanisms without enough historical context'),
('Intuitionist / Dual-Process Era', 'Jonathan Haidt, Joshua Greene', 'How do intuition emotion and controlled cognition interact in judgment?', 'Recentered intuition affect neuroscience and experimental dilemmas', 'Can oversimplify fast emotion versus slow reason'),
('Experimental Moral Psychology Era', 'Experimental philosophy, social psychology, cognitive science', 'How can moral judgment be operationalized and tested?', 'Linked philosophy and psychology through controlled empirical work', 'Can overrely on stylized dilemmas'),
('Contemporary Pluralist and Institutional Era', 'Cross-cultural, political, organizational, institutional work', 'How does moral agency operate in structured worlds?', 'Connects morality to culture politics institutions platforms and power', 'Can become too broad without clear methods');

INSERT INTO risk_factors VALUES
('single_cause_history', 'The field is described as if one explanatory mode replaces all others', 'Represent history as layered and cumulative'),
('presentism', 'Contemporary methods are treated as inherently superior to older frameworks', 'Show what earlier traditions still explain'),
('method_reductionism', 'Experimental or neuroscientific methods are treated as the whole field', 'Connect lab evidence to development culture institutions and action'),
('philosophy_reductionism', 'The field is treated as only a history of philosophical ideas', 'Include empirical psychology social research and institutions'),
('stage_reductionism', 'Developmental history is reduced to Kohlbergian stage theory', 'Include Piaget Gilligan social domain theory and contemporary development'),
('intuition_reductionism', 'Moral judgment is reduced to rapid intuition and post hoc reasoning', 'Include reflection development culture and institutional context'),
('culture_blindness', 'Moral psychology is presented as culturally neutral', 'Include pluralism politics religion marginalized voices and historical power'),
('institutional_blindness', 'Moral agency is treated as purely individual', 'Model institutions organizations platforms bureaucracy and accountability systems'),
('bibliometric_overclaim', 'Synthetic weights are mistaken for measured publication counts', 'Label data as conceptual demonstration only'),
('author_canon_overfocus', 'History centers only famous canonical thinkers', 'Use canonical figures while widening to care culture power and institutions');
