# Synthetic care, empathy, and relational moral life model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

perspective_taking = randn(n)
affective_resonance = randn(n)
situational_salience = randn(n)
felt_responsibility = randn(n)
perceived_dependence = randn(n)
temporal_persistence = randn(n)
burnout = randn(n)
institutional_support = randn(n)
voice_safety = randn(n)

empathy =
    0.40 .* perspective_taking .+
    0.35 .* affective_resonance .+
    0.30 .* situational_salience

care_latent =
    0.35 .* empathy .+
    0.40 .* felt_responsibility .+
    0.35 .* perceived_dependence .+
    0.30 .* temporal_persistence .-
    0.40 .* burnout .+
    0.25 .* institutional_support .+
    0.18 .* voice_safety

caring_response_probability = 1.0 ./ (1.0 .+ exp.(-care_latent))

println("Mean synthetic empathy: ", mean(empathy))
println("Mean synthetic burnout: ", mean(burnout))
println("Mean synthetic caring response probability: ", mean(caring_response_probability))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_care_empathy_relational_moral_life_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_empathy,$(mean(empathy))\n")
    write(io, "mean_burnout,$(mean(burnout))\n")
    write(io, "mean_institutional_support,$(mean(institutional_support))\n")
    write(io, "mean_caring_response_probability,$(mean(caring_response_probability))\n")
    write(io, "min_caring_response_probability,$(minimum(caring_response_probability))\n")
    write(io, "max_caring_response_probability,$(maximum(caring_response_probability))\n")
end
