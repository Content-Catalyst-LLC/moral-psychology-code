# Synthetic pluralist value-space simulation in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

dimensions = ["harm", "fairness", "loyalty", "purity", "authority", "care"]

person_a = [0.8, 0.7, 0.2, 0.1, 0.2, 0.8]
person_b = [0.3, 0.4, 0.8, 0.7, 0.6, 0.4]

value_gap = sum(abs.(person_a .- person_b))
judgment_a = sum(person_a .* [0.40, 0.30, 0.20, 0.15, 0.15, 0.25])
judgment_b = sum(person_b .* [0.40, 0.30, 0.20, 0.15, 0.15, 0.25])
disagreement = abs(judgment_a - judgment_b)

println("Synthetic value gap: ", value_gap)
println("Synthetic judgment A: ", judgment_a)
println("Synthetic judgment B: ", judgment_b)
println("Synthetic disagreement distance: ", disagreement)

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_pluralist_value_space_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "value_gap,$value_gap\n")
    write(io, "judgment_a,$judgment_a\n")
    write(io, "judgment_b,$judgment_b\n")
    write(io, "disagreement_distance,$disagreement\n")
end
