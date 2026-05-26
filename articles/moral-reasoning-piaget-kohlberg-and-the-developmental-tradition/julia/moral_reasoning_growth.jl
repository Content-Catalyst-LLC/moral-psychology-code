# Synthetic developmental moral reasoning model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

age = 6 .+ rand(n) .* 19
perspective_taking = randn(n)
norm_exposure = randn(n)
domain_differentiation = randn(n)
relational_orientation = randn(n)
authority_orientation = randn(n)
peer_cooperation = randn(n)
cultural_context_support = randn(n)

latent_reasoning =
    0.10 .* age .+
    0.55 .* perspective_taking .+
    0.35 .* norm_exposure .+
    0.45 .* domain_differentiation .+
    0.25 .* peer_cooperation .+
    0.20 .* cultural_context_support .-
    0.20 .* authority_orientation

justice_reasoning =
    0.60 .* latent_reasoning .+
    0.25 .* perspective_taking .+
    0.20 .* domain_differentiation

care_reasoning =
    0.35 .* latent_reasoning .+
    0.50 .* relational_orientation .+
    0.20 .* perspective_taking

conventional_sensitivity =
    0.25 .* latent_reasoning .+
    0.45 .* norm_exposure .+
    0.35 .* authority_orientation .-
    0.25 .* domain_differentiation

autonomy_orientation =
    0.40 .* latent_reasoning .+
    0.35 .* domain_differentiation .+
    0.25 .* peer_cooperation .-
    0.20 .* authority_orientation

println("Mean synthetic latent reasoning: ", mean(latent_reasoning))
println("Mean synthetic justice reasoning: ", mean(justice_reasoning))
println("Mean synthetic care reasoning: ", mean(care_reasoning))
println("Mean synthetic conventional sensitivity: ", mean(conventional_sensitivity))
println("Mean synthetic autonomy orientation: ", mean(autonomy_orientation))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_moral_reasoning_growth_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_latent_reasoning,$(mean(latent_reasoning))\n")
    write(io, "mean_justice_reasoning,$(mean(justice_reasoning))\n")
    write(io, "mean_care_reasoning,$(mean(care_reasoning))\n")
    write(io, "mean_conventional_sensitivity,$(mean(conventional_sensitivity))\n")
    write(io, "mean_autonomy_orientation,$(mean(autonomy_orientation))\n")
end
