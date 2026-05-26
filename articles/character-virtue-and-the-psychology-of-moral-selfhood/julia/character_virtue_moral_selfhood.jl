# Synthetic character, virtue, and moral selfhood model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

trait_disposition = randn(n)
habituated_practice = randn(n)
identity_integration = randn(n)
self_regulation = randn(n)
accountability = randn(n)
repair_capacity = randn(n)
situational_pressure = randn(n)
institutional_support = randn(n)

character_strength =
    0.35 .* trait_disposition .+
    0.40 .* habituated_practice .+
    0.35 .* identity_integration .+
    0.30 .* self_regulation .+
    0.20 .* accountability

moral_selfhood_profile =
    0.40 .* character_strength .+
    0.30 .* identity_integration .+
    0.25 .* accountability .+
    0.30 .* repair_capacity .+
    0.20 .* self_regulation

action_latent =
    0.45 .* character_strength .+
    0.30 .* moral_selfhood_profile .-
    0.40 .* situational_pressure .+
    0.25 .* institutional_support .+
    0.20 .* self_regulation

virtuous_action_probability = 1.0 ./ (1.0 .+ exp.(-action_latent))

println("Mean synthetic character strength: ", mean(character_strength))
println("Mean synthetic moral selfhood profile: ", mean(moral_selfhood_profile))
println("Mean synthetic virtuous action probability: ", mean(virtuous_action_probability))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_character_virtue_moral_selfhood_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_character_strength,$(mean(character_strength))\n")
    write(io, "mean_moral_selfhood_profile,$(mean(moral_selfhood_profile))\n")
    write(io, "mean_virtuous_action_probability,$(mean(virtuous_action_probability))\n")
    write(io, "min_virtuous_action_probability,$(minimum(virtuous_action_probability))\n")
    write(io, "max_virtuous_action_probability,$(maximum(virtuous_action_probability))\n")
end
