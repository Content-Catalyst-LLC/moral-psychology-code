# Synthetic conscience, guilt, shame, repair, and avoidance model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

perceived_wrongdoing = randn(n)
perceived_responsibility = randn(n)
exposure_before_others = randn(n)
norm_internalization = randn(n)
global_self_condemnation = randn(n)
empathic_acknowledgment = randn(n)
repair_pathway = randn(n)
agency_capacity = randn(n)
defensiveness = randn(n)

guilt =
    0.55 .* perceived_wrongdoing .+
    0.50 .* perceived_responsibility .+
    0.25 .* norm_internalization .+
    0.15 .* agency_capacity

shame =
    0.55 .* global_self_condemnation .+
    0.45 .* exposure_before_others .+
    0.20 .* norm_internalization .-
    0.10 .* agency_capacity

conscience_activation =
    0.40 .* guilt .+
    0.35 .* shame .+
    0.25 .* norm_internalization .+
    0.20 .* perceived_responsibility

repair_latent =
    0.50 .* guilt .-
    0.30 .* shame .+
    0.35 .* empathic_acknowledgment .+
    0.30 .* repair_pathway .+
    0.20 .* agency_capacity .-
    0.25 .* defensiveness

avoidance_latent =
    0.45 .* shame .-
    0.20 .* guilt .-
    0.20 .* repair_pathway .-
    0.20 .* agency_capacity .+
    0.30 .* defensiveness

repair_probability = 1.0 ./ (1.0 .+ exp.(-repair_latent))
avoidance_probability = 1.0 ./ (1.0 .+ exp.(-avoidance_latent))

println("Mean synthetic guilt: ", mean(guilt))
println("Mean synthetic shame: ", mean(shame))
println("Mean synthetic conscience activation: ", mean(conscience_activation))
println("Mean synthetic repair probability: ", mean(repair_probability))
println("Mean synthetic avoidance probability: ", mean(avoidance_probability))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_conscience_guilt_shame_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_guilt,$(mean(guilt))\n")
    write(io, "mean_shame,$(mean(shame))\n")
    write(io, "mean_conscience_activation,$(mean(conscience_activation))\n")
    write(io, "mean_repair_probability,$(mean(repair_probability))\n")
    write(io, "mean_avoidance_probability,$(mean(avoidance_probability))\n")
end
