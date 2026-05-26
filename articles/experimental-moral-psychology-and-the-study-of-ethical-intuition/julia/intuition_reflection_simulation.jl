# Synthetic experimental moral psychology model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

intuition = randn(n)
reflection = randn(n)
norm_sensitivity = randn(n)
consequence_sensitivity = randn(n)
intentionality = randn(n)
excuse = randn(n)
noise_judgment = 0.8 .* randn(n)
noise_blame = 0.8 .* randn(n)

moral_judgment =
    0.30 .* intuition .+
    0.20 .* reflection .+
    0.25 .* norm_sensitivity .+
    0.25 .* consequence_sensitivity .+
    noise_judgment

blame_latent =
    0.35 .* moral_judgment .+
    0.30 .* intentionality .-
    0.25 .* excuse .+
    noise_blame

blame_probability = 1.0 ./ (1.0 .+ exp.(-blame_latent))

println("Mean moral judgment: ", mean(moral_judgment))
println("Mean blame probability: ", mean(blame_probability))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_experimental_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_moral_judgment,$(mean(moral_judgment))\n")
    write(io, "sd_moral_judgment,$(std(moral_judgment))\n")
    write(io, "mean_blame_probability,$(mean(blame_probability))\n")
    write(io, "sd_blame_probability,$(std(blame_probability))\n")
end
