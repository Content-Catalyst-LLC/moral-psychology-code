# Synthetic prosocial behavior, altruism, and care model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

empathic_concern = randn(n)
norm_strength = randn(n)
relational_closeness = randn(n)
visible_vulnerability = randn(n)
perceived_cost = randn(n)
institutional_support = randn(n)
other_oriented_desire = randn(n)
self_oriented_payoff = randn(n)
attentional_responsiveness = randn(n)
ongoing_need = randn(n)
burnout = randn(n)
voice_safety = randn(n)

action_latent =
    0.40 .* empathic_concern .+
    0.30 .* norm_strength .+
    0.25 .* relational_closeness .+
    0.30 .* visible_vulnerability .-
    0.35 .* perceived_cost .+
    0.18 .* institutional_support

prosocial_probability = 1.0 ./ (1.0 .+ exp.(-action_latent))

altruistic_motive =
    0.55 .* other_oriented_desire .-
    0.35 .* self_oriented_payoff .+
    0.20 .* empathic_concern

caregiving_persistence =
    0.35 .* attentional_responsiveness .+
    0.40 .* ongoing_need .-
    0.30 .* burnout .+
    0.25 .* institutional_support .+
    0.15 .* voice_safety

println("Mean synthetic prosocial probability: ", mean(prosocial_probability))
println("Mean synthetic altruistic motive: ", mean(altruistic_motive))
println("Mean synthetic caregiving persistence: ", mean(caregiving_persistence))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_prosocial_behavior_altruism_care_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_prosocial_probability,$(mean(prosocial_probability))\n")
    write(io, "mean_altruistic_motive,$(mean(altruistic_motive))\n")
    write(io, "mean_caregiving_persistence,$(mean(caregiving_persistence))\n")
    write(io, "mean_perceived_cost,$(mean(perceived_cost))\n")
    write(io, "mean_burnout,$(mean(burnout))\n")
end
