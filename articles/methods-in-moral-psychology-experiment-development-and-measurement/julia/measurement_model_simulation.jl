# Synthetic moral-psychology measurement model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

norm_learning = randn(n)
reflection = randn(n)
age = 8 .+ 62 .* rand(n)
noise_wrongness = 0.8 .* randn(n)
noise_blame = 0.8 .* randn(n)
noise_latent = 0.8 .* randn(n)

wrongness = 0.25 .* norm_learning .+ 0.15 .* reflection .+ noise_wrongness
blame = 0.30 .* wrongness .+ 0.10 .* (age ./ 10) .+ noise_blame
latent = 0.40 .* wrongness .+ 0.35 .* blame .+ 0.25 .* norm_learning .+ noise_latent

println("Mean wrongness: ", mean(wrongness))
println("Mean blame: ", mean(blame))
println("Mean latent construct: ", mean(latent))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_measurement_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_wrongness,$(mean(wrongness))\n")
    write(io, "mean_blame,$(mean(blame))\n")
    write(io, "mean_latent,$(mean(latent))\n")
    write(io, "sd_latent,$(std(latent))\n")
end
