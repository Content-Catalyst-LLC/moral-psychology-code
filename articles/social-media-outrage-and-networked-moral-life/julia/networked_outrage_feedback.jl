# Synthetic networked moral outrage feedback model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

periods = 50
outrage = zeros(periods)
outrage[1] = 0.25

shareability = 0.03 .+ 0.02 .* rand(periods)
social_reward = 0.03 .+ 0.02 .* rand(periods)
contextual_correction = 0.04 .+ 0.02 .* rand(periods)

for t in 1:(periods - 1)
    outrage[t + 1] = outrage[t] +
        0.75 * shareability[t] +
        0.65 * social_reward[t] -
        0.80 * contextual_correction[t]

    outrage[t + 1] = max(0.0, outrage[t + 1])
end

println("Initial synthetic outrage: ", outrage[1])
println("Final synthetic outrage: ", outrage[end])
println("Mean synthetic outrage: ", mean(outrage))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_networked_outrage_feedback_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "initial_outrage,$(outrage[1])\n")
    write(io, "final_outrage,$(outrage[end])\n")
    write(io, "mean_outrage,$(mean(outrage))\n")
    write(io, "max_outrage,$(maximum(outrage))\n")
end
