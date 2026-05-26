# Synthetic Moral Psychology systems relevance model in Julia.
# Educational scaffold only.

using Random
using Statistics
using DelimitedFiles

Random.seed!(42)

n = 1000

political_polarization = randn(n)
organizational_risk = randn(n)
developmental_moral_learning = randn(n)
cross_cultural_variation = randn(n)
technology_amplification = randn(n)
moral_injury_burden = randn(n)
noise = 0.8 .* randn(n)

significance =
    0.25 .* political_polarization .+
    0.20 .* organizational_risk .+
    0.15 .* developmental_moral_learning .+
    0.15 .* cross_cultural_variation .+
    0.15 .* technology_amplification .+
    0.20 .* moral_injury_burden .+
    noise

println("Mean synthetic significance: ", mean(significance))
println("Standard deviation: ", std(significance))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_significance_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean,$(mean(significance))\n")
    write(io, "sd,$(std(significance))\n")
    write(io, "min,$(minimum(significance))\n")
    write(io, "max,$(maximum(significance))\n")
end
