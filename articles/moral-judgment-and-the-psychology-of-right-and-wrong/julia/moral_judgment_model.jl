# Synthetic moral judgment model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

perceived_harm = randn(n)
norm_violation = randn(n)
inferred_intention = randn(n)
emotional_activation = randn(n)
group_framing = randn(n)
social_pressure = randn(n)
situational_ambiguity = randn(n)
perceived_agency = randn(n)
repair_opportunity = randn(n)
dignity_preservation = randn(n)
punitive_pressure = randn(n)
institutional_support = randn(n)

latent_wrongness =
    0.70 .* perceived_harm .+
    0.55 .* norm_violation .+
    0.50 .* inferred_intention .+
    0.25 .* emotional_activation .+
    0.20 .* group_framing .+
    0.20 .* social_pressure .-
    0.30 .* situational_ambiguity

wrongness_rating = clamp.(1 .+ 1.2 .* latent_wrongness, 1, 7)

latent_blame =
    0.60 .* wrongness_rating .+
    0.45 .* perceived_agency .-
    0.35 .* repair_opportunity .+
    0.15 .* emotional_activation .-
    0.15 .* situational_ambiguity

blame_rating = clamp.(1 .+ latent_blame, 1, 7)

constructive_response_score =
    0.35 .* blame_rating .+
    0.45 .* repair_opportunity .+
    0.35 .* dignity_preservation .+
    0.25 .* institutional_support .-
    0.30 .* punitive_pressure

println("Mean synthetic wrongness rating: ", mean(wrongness_rating))
println("Mean synthetic blame rating: ", mean(blame_rating))
println("Mean synthetic constructive response score: ", mean(constructive_response_score))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_moral_judgment_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_wrongness_rating,$(mean(wrongness_rating))\n")
    write(io, "mean_blame_rating,$(mean(blame_rating))\n")
    write(io, "mean_constructive_response_score,$(mean(constructive_response_score))\n")
end
