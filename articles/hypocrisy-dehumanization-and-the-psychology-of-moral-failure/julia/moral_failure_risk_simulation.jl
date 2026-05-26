# Synthetic hypocrisy, dehumanization, and moral failure risk model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

judgment_other = randn(n)
judgment_self = randn(n)
perceived_humanness = randn(n)
ingroup_bias = randn(n)
empathic_recognition = randn(n)
public_value_claim = randn(n)
actual_practice_integrity = randn(n)
accountability_strength = randn(n)
victim_visibility = randn(n)

hypocrisy = judgment_other .- judgment_self
dehumanization = 1 .- perceived_humanness
institutional_hypocrisy = public_value_claim .- actual_practice_integrity

failure_latent =
    0.45 .* hypocrisy .+
    0.40 .* dehumanization .+
    0.30 .* ingroup_bias .+
    0.25 .* institutional_hypocrisy .-
    0.35 .* empathic_recognition .-
    0.25 .* accountability_strength .-
    0.20 .* victim_visibility

moral_failure_probability = 1.0 ./ (1.0 .+ exp.(-failure_latent))

println("Mean synthetic hypocrisy: ", mean(hypocrisy))
println("Mean synthetic dehumanization: ", mean(dehumanization))
println("Mean synthetic institutional hypocrisy: ", mean(institutional_hypocrisy))
println("Mean synthetic moral failure probability: ", mean(moral_failure_probability))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_moral_failure_risk_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_hypocrisy,$(mean(hypocrisy))\n")
    write(io, "mean_dehumanization,$(mean(dehumanization))\n")
    write(io, "mean_institutional_hypocrisy,$(mean(institutional_hypocrisy))\n")
    write(io, "mean_moral_failure_probability,$(mean(moral_failure_probability))\n")
    write(io, "max_moral_failure_probability,$(maximum(moral_failure_probability))\n")
end
