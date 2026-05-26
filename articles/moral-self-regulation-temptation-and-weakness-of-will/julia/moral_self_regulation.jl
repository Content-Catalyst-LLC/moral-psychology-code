# Synthetic moral self-regulation and weakness-of-will model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

moral_judgment = randn(n)
temptation_intensity = randn(n)
fatigue = randn(n)
situational_pressure = randn(n)
self_regulatory_capacity = randn(n)
moral_identity = randn(n)
rationalization_tendency = randn(n)
guilt_recognition = randn(n)
humility = randn(n)
accountability = randn(n)
defensiveness = randn(n)

action_latent =
    0.40 .* moral_judgment .+
    0.35 .* self_regulatory_capacity .+
    0.25 .* moral_identity .-
    0.45 .* temptation_intensity .-
    0.30 .* fatigue .-
    0.35 .* situational_pressure .-
    0.25 .* rationalization_tendency

moral_action_probability = 1.0 ./ (1.0 .+ exp.(-action_latent))
moral_action = moral_action_probability .>= 0.5
weakness_of_will = moral_judgment .- Float64.(moral_action)

repair_capacity =
    0.35 .* guilt_recognition .+
    0.35 .* humility .+
    0.30 .* accountability .-
    0.40 .* defensiveness .-
    0.20 .* rationalization_tendency

println("Mean synthetic moral action probability: ", mean(moral_action_probability))
println("Mean synthetic weakness of will: ", mean(weakness_of_will))
println("Mean synthetic repair capacity: ", mean(repair_capacity))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_moral_self_regulation_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_moral_action_probability,$(mean(moral_action_probability))\n")
    write(io, "mean_weakness_of_will,$(mean(weakness_of_will))\n")
    write(io, "mean_repair_capacity,$(mean(repair_capacity))\n")
    write(io, "mean_temptation_intensity,$(mean(temptation_intensity))\n")
    write(io, "mean_fatigue,$(mean(fatigue))\n")
end
