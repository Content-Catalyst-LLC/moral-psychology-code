# Synthetic responsibility, blame, and accountability distribution model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

control = randn(n)
knowledge = randn(n)
role_duty = randn(n)
wrongness_severity = randn(n)
motive_malice = randn(n)
mitigating_excuse = randn(n)
institutional_structure = randn(n)
repair_capacity = randn(n)
prevention_capacity = randn(n)

responsibility =
    0.40 .* control .+
    0.35 .* knowledge .+
    0.25 .* role_duty

blame_probability =
    1.0 ./ (1.0 .+ exp.(-(0.40 .* responsibility .+ 0.35 .* wrongness_severity .+ 0.25 .* motive_malice .- 0.30 .* mitigating_excuse)))

accountability =
    0.45 .* responsibility .+
    0.25 .* institutional_structure .+
    0.20 .* wrongness_severity .+
    0.20 .* repair_capacity .+
    0.15 .* prevention_capacity

println("Mean synthetic responsibility: ", mean(responsibility))
println("Mean synthetic blame probability: ", mean(blame_probability))
println("Mean synthetic accountability: ", mean(accountability))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_accountability_distribution_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_responsibility,$(mean(responsibility))\n")
    write(io, "mean_blame_probability,$(mean(blame_probability))\n")
    write(io, "mean_accountability,$(mean(accountability))\n")
    write(io, "min_accountability,$(minimum(accountability))\n")
    write(io, "max_accountability,$(maximum(accountability))\n")
end
