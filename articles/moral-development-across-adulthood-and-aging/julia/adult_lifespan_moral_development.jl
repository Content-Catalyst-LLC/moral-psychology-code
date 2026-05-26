# Synthetic adult lifespan moral-development model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

age = 18 .+ rand(n) .* (85 - 18)
moral_identity = randn(n)
prosocial_orientation = randn(n)
role_complexity = randn(n)
moral_emotion_profile = randn(n)
decision_capacity = randn(n)
generativity = randn(n)
caregiving_burden = randn(n)
loss_reflection = randn(n)
voice_safety = randn(n)
accountability_strength = randn(n)

latent_moral_development =
    0.03 .* age .-
    0.00025 .* (age .^ 2) .+
    0.35 .* moral_identity .+
    0.40 .* prosocial_orientation .+
    0.30 .* role_complexity .+
    0.25 .* moral_emotion_profile .+
    0.20 .* decision_capacity .+
    0.25 .* generativity .-
    0.20 .* caregiving_burden .+
    0.15 .* loss_reflection

moral_action_latent =
    0.45 .* latent_moral_development .+
    0.25 .* voice_safety .+
    0.25 .* accountability_strength .-
    0.25 .* caregiving_burden

moral_action_probability = 1.0 ./ (1.0 .+ exp.(-moral_action_latent))

println("Mean synthetic age: ", mean(age))
println("Mean synthetic adult moral-development profile: ", mean(latent_moral_development))
println("Mean synthetic moral action probability: ", mean(moral_action_probability))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_adult_lifespan_moral_development_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_age,$(mean(age))\n")
    write(io, "mean_latent_moral_development,$(mean(latent_moral_development))\n")
    write(io, "mean_moral_action_probability,$(mean(moral_action_probability))\n")
    write(io, "min_moral_action_probability,$(minimum(moral_action_probability))\n")
    write(io, "max_moral_action_probability,$(maximum(moral_action_probability))\n")
end
