# Synthetic history of moral psychology summary in Julia.
# Educational scaffold only.

periods = [
    "Moral Sense Theory",
    "Hume and Smith",
    "Rationalist Countercurrent",
    "Nineteenth-Century Social and Evolutionary Shifts",
    "Developmental Tradition",
    "Care and Domain Critiques",
    "Social Learning and Moral Disengagement",
    "Intuitionist / Dual-Process Era",
    "Experimental Moral Psychology Era",
    "Contemporary Pluralist and Institutional Era"
]

sentiment = [0.80, 0.85, 0.20, 0.35, 0.20, 0.35, 0.35, 0.55, 0.50, 0.45]
reason = [0.30, 0.35, 0.90, 0.45, 0.75, 0.45, 0.45, 0.35, 0.40, 0.40]
development = [0.10, 0.10, 0.10, 0.25, 0.95, 0.70, 0.55, 0.30, 0.35, 0.45]
intuition = [0.35, 0.40, 0.10, 0.30, 0.20, 0.30, 0.35, 0.90, 0.80, 0.75]
culture_politics = [0.10, 0.15, 0.10, 0.35, 0.15, 0.35, 0.40, 0.35, 0.60, 0.85]
neuroscience_experiment = [0.00, 0.00, 0.00, 0.05, 0.20, 0.25, 0.35, 0.85, 0.95, 0.80]
institutions = [0.15, 0.25, 0.20, 0.40, 0.20, 0.30, 0.55, 0.35, 0.50, 0.90]

function normalized_entropy(values)
    total = sum(values)
    p = values ./ total
    raw = -sum([x > 0 ? x * log(x) : 0.0 for x in p])
    raw / log(length(values))
end

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_moral_psychology_history_summary.csv"), "w") do io
    write(io, "period,field_center_score,diversification\n")
    for i in eachindex(periods)
        values = [
            sentiment[i],
            reason[i],
            development[i],
            intuition[i],
            culture_politics[i],
            neuroscience_experiment[i],
            institutions[i]
        ]
        score = sum(values)
        diversification = normalized_entropy(values)
        write(io, "\"$(periods[i])\",$score,$diversification\n")
    end
end

println("Synthetic moral psychology history summary written to outputs/tables.")
