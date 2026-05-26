# Synthetic cross-cultural moral profile model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

dimensions = ["harm", "fairness", "loyalty", "authority", "purity", "relational_obligation"]

context_a = [0.45, 0.30, 0.10, 0.10, 0.05, 0.10]
context_b = [0.25, 0.20, 0.30, 0.25, 0.20, 0.25]
context_c = [0.30, 0.25, 0.25, 0.20, 0.15, 0.20]

profiles = Dict(
    "Context_A" => context_a,
    "Context_B" => context_b,
    "Context_C" => context_c
)

println("Synthetic cultural moral profile weights:")
for (context, weights) in profiles
    println(context, ": ", Dict(zip(dimensions, weights)))
end

distance_ab = sqrt(sum((context_a .- context_b).^2))
distance_ac = sqrt(sum((context_a .- context_c).^2))
distance_bc = sqrt(sum((context_b .- context_c).^2))

println("Profile distance A-B: ", distance_ab)
println("Profile distance A-C: ", distance_ac)
println("Profile distance B-C: ", distance_bc)

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_cultural_moral_profile_distances.csv"), "w") do io
    write(io, "comparison,distance\n")
    write(io, "Context_A_vs_Context_B,$distance_ab\n")
    write(io, "Context_A_vs_Context_C,$distance_ac\n")
    write(io, "Context_B_vs_Context_C,$distance_bc\n")
end
