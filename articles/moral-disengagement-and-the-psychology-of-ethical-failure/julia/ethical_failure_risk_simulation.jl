# Synthetic moral disengagement and ethical failure risk model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

moral_justification = randn(n)
euphemistic_language = randn(n)
advantageous_comparison = randn(n)
responsibility_shifting = randn(n)
consequence_distortion = randn(n)
dehumanization = randn(n)
victim_blaming = randn(n)
anticipated_guilt = randn(n)
institutional_pressure = randn(n)
consequence_visibility = randn(n)
victim_recognition = randn(n)
accountability_strength = randn(n)

moral_disengagement =
    0.30 .* moral_justification .+
    0.25 .* euphemistic_language .+
    0.20 .* advantageous_comparison .+
    0.30 .* responsibility_shifting .+
    0.25 .* consequence_distortion .+
    0.25 .* dehumanization .+
    0.20 .* victim_blaming .-
    0.20 .* consequence_visibility .-
    0.20 .* victim_recognition

action_latent =
    0.55 .* moral_disengagement .-
    0.35 .* anticipated_guilt .+
    0.30 .* institutional_pressure .-
    0.25 .* accountability_strength

unethical_action_probability = 1.0 ./ (1.0 .+ exp.(-action_latent))

println("Mean synthetic moral disengagement: ", mean(moral_disengagement))
println("Mean synthetic unethical action probability: ", mean(unethical_action_probability))
println("Max synthetic unethical action probability: ", maximum(unethical_action_probability))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_ethical_failure_risk_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_moral_disengagement,$(mean(moral_disengagement))\n")
    write(io, "mean_unethical_action_probability,$(mean(unethical_action_probability))\n")
    write(io, "min_unethical_action_probability,$(minimum(unethical_action_probability))\n")
    write(io, "max_unethical_action_probability,$(maximum(unethical_action_probability))\n")
end
