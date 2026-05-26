# Synthetic punishment, forgiveness, and moral repair pathway model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

wrongdoing_severity = randn(n)
offender_responsibility = randn(n)
norm_reaffirmation_need = randn(n)
acknowledgment = randn(n)
amends = randn(n)
ongoing_threat = randn(n)
restitution = randn(n)
victim_recognition = randn(n)
institutional_trust = randn(n)
structural_reform = randn(n)

punishment =
    0.40 .* wrongdoing_severity .+
    0.35 .* offender_responsibility .+
    0.25 .* norm_reaffirmation_need

forgiveness_probability =
    1.0 ./ (1.0 .+ exp.(-(0.35 .* acknowledgment .+ 0.30 .* amends .- 0.40 .* ongoing_threat .+ 0.15 .* victim_recognition)))

moral_repair =
    0.20 .* punishment .+
    0.25 .* forgiveness_probability .+
    0.30 .* restitution .+
    0.30 .* acknowledgment .+
    0.25 .* victim_recognition .+
    0.20 .* institutional_trust .+
    0.25 .* structural_reform .-
    0.25 .* ongoing_threat

println("Mean synthetic punishment: ", mean(punishment))
println("Mean synthetic forgiveness probability: ", mean(forgiveness_probability))
println("Mean synthetic moral repair: ", mean(moral_repair))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_repair_pathway_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_punishment,$(mean(punishment))\n")
    write(io, "mean_forgiveness_probability,$(mean(forgiveness_probability))\n")
    write(io, "mean_moral_repair,$(mean(moral_repair))\n")
    write(io, "min_moral_repair,$(minimum(moral_repair))\n")
    write(io, "max_moral_repair,$(maximum(moral_repair))\n")
end
