# Synthetic person-situation virtue stability model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

character_strength = randn(n)
self_regulation = randn(n)
habit_strength = randn(n)
moral_identity = randn(n)
depletion = randn(n)
situational_pressure = randn(n)
voice_safety = randn(n)
accountability_visibility = randn(n)

action_latent =
    0.42 .* character_strength .+
    0.28 .* self_regulation .+
    0.25 .* habit_strength .+
    0.22 .* moral_identity .-
    0.55 .* situational_pressure .+
    0.25 .* voice_safety .+
    0.25 .* accountability_visibility .-
    0.20 .* depletion .-
    0.22 .* character_strength .* situational_pressure

moral_action_probability = 1.0 ./ (1.0 .+ exp.(-action_latent))

println("Mean synthetic character strength: ", mean(character_strength))
println("Mean synthetic situational pressure: ", mean(situational_pressure))
println("Mean synthetic moral action probability: ", mean(moral_action_probability))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_person_situation_virtue_stability_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_character_strength,$(mean(character_strength))\n")
    write(io, "mean_situational_pressure,$(mean(situational_pressure))\n")
    write(io, "mean_moral_action_probability,$(mean(moral_action_probability))\n")
    write(io, "min_moral_action_probability,$(minimum(moral_action_probability))\n")
    write(io, "max_moral_action_probability,$(maximum(moral_action_probability))\n")
end
