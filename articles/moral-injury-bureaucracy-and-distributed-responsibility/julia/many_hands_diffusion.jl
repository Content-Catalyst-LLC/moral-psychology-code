# Synthetic distributed responsibility / many-hands model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

actors = 8
weights = rand(actors)
weights = weights ./ sum(weights)

distributed_responsibility = 1.0 - maximum(weights)
accountability_clarity = maximum(weights)

println("Synthetic responsibility weights: ", weights)
println("Distributed responsibility pressure: ", distributed_responsibility)
println("Accountability clarity proxy: ", accountability_clarity)

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_many_hands_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "actors,$actors\n")
    write(io, "max_responsibility,$(maximum(weights))\n")
    write(io, "distributed_responsibility,$distributed_responsibility\n")
    write(io, "mean_responsibility,$(mean(weights))\n")
end
