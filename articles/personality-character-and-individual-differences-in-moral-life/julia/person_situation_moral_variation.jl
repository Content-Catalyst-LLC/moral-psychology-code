# Synthetic person-situation moral variation model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

broad_personality = randn(n)
character_strength = randn(n)
moral_identity = randn(n)
empathy = randn(n)
conscientious_self_regulation = randn(n)
humility = randn(n)
self_interest_bias = randn(n)
situational_pressure = randn(n)
voice_safety = randn(n)
accountability_strength = randn(n)

moral_response_profile =
    0.20 .* broad_personality .+
    0.30 .* character_strength .+
    0.35 .* moral_identity .+
    0.25 .* empathy .+
    0.20 .* conscientious_self_regulation .+
    0.15 .* humility .-
    0.35 .* self_interest_bias

action_latent =
    0.45 .* moral_response_profile .-
    0.35 .* situational_pressure .+
    0.25 .* voice_safety .+
    0.25 .* accountability_strength

moral_action_probability = 1.0 ./ (1.0 .+ exp.(-action_latent))

println("Mean synthetic moral response profile: ", mean(moral_response_profile))
println("Mean synthetic moral action probability: ", mean(moral_action_probability))
println("Max synthetic moral action probability: ", maximum(moral_action_probability))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_person_situation_moral_variation_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_moral_response_profile,$(mean(moral_response_profile))\n")
    write(io, "mean_moral_action_probability,$(mean(moral_action_probability))\n")
    write(io, "min_moral_action_probability,$(minimum(moral_action_probability))\n")
    write(io, "max_moral_action_probability,$(maximum(moral_action_probability))\n")
end
