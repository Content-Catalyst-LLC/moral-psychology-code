# Synthetic distributive value-space simulation in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

equality_weight = randn(n)
equity_weight = randn(n)
need_weight = randn(n)
desert_weight = randn(n)
priority_worse_off = randn(n)
self_interest_bias = randn(n)
procedural_trust = randn(n)
group_distance = randn(n)
historical_repair_salience = randn(n)

distributive_judgment =
    0.30 .* equality_weight .+
    0.25 .* equity_weight .+
    0.25 .* need_weight .+
    0.20 .* desert_weight .+
    0.25 .* priority_worse_off .-
    0.35 .* self_interest_bias .+
    0.20 .* procedural_trust .-
    0.20 .* group_distance .+
    0.20 .* historical_repair_salience

inequity_aversion =
    0.45 .* abs.(equality_weight) .+
    0.30 .* need_weight .-
    0.25 .* self_interest_bias

println("Mean synthetic distributive judgment: ", mean(distributive_judgment))
println("Mean synthetic inequity aversion: ", mean(inequity_aversion))
println("Judgment range: ", minimum(distributive_judgment), " to ", maximum(distributive_judgment))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_distributive_value_space_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_distributive_judgment,$(mean(distributive_judgment))\n")
    write(io, "mean_inequity_aversion,$(mean(inequity_aversion))\n")
    write(io, "min_distributive_judgment,$(minimum(distributive_judgment))\n")
    write(io, "max_distributive_judgment,$(maximum(distributive_judgment))\n")
end
