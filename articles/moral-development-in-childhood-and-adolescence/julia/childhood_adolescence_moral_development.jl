# Synthetic childhood and adolescent moral-development model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

age = 5 .+ rand(n) .* (18 - 5)
perspective_taking = randn(n)
empathic_concern = randn(n)
norm_understanding = randn(n)
peer_context = randn(n)
family_support = randn(n)
school_climate = randn(n)
peer_status_pressure = randn(n)

latent_moral_development =
    0.12 .* age .-
    0.002 .* (age .^ 2) .+
    0.40 .* perspective_taking .+
    0.35 .* empathic_concern .+
    0.38 .* norm_understanding .+
    0.20 .* peer_context .+
    0.25 .* family_support .+
    0.20 .* school_climate .-
    0.20 .* peer_status_pressure

harm_understanding =
    0.50 .* latent_moral_development .+
    0.25 .* empathic_concern

fairness_reasoning =
    0.45 .* latent_moral_development .+
    0.20 .* perspective_taking

conventional_sensitivity =
    0.30 .* latent_moral_development .+
    0.25 .* norm_understanding

moral_action_latent =
    0.45 .* latent_moral_development .+
    0.30 .* empathic_concern .+
    0.25 .* school_climate .-
    0.30 .* peer_status_pressure

moral_action_probability = 1.0 ./ (1.0 .+ exp.(-moral_action_latent))

println("Mean synthetic age: ", mean(age))
println("Mean synthetic moral-development profile: ", mean(latent_moral_development))
println("Mean synthetic harm understanding: ", mean(harm_understanding))
println("Mean synthetic fairness reasoning: ", mean(fairness_reasoning))
println("Mean synthetic conventional sensitivity: ", mean(conventional_sensitivity))
println("Mean synthetic moral action probability: ", mean(moral_action_probability))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_childhood_adolescence_moral_development_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_age,$(mean(age))\n")
    write(io, "mean_latent_moral_development,$(mean(latent_moral_development))\n")
    write(io, "mean_harm_understanding,$(mean(harm_understanding))\n")
    write(io, "mean_fairness_reasoning,$(mean(fairness_reasoning))\n")
    write(io, "mean_conventional_sensitivity,$(mean(conventional_sensitivity))\n")
    write(io, "mean_moral_action_probability,$(mean(moral_action_probability))\n")
end
