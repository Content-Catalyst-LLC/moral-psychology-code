# Synthetic social identity and moral polarization feedback model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

periods = 50
polarization = zeros(periods)
polarization[1] = 0.25

outgroup_threat_framing = 0.03 .+ 0.02 .* rand(periods)
conformity_pressure = 0.03 .+ 0.02 .* rand(periods)
cross_group_contact = 0.04 .+ 0.02 .* rand(periods)
institutional_moderation = 0.03 .+ 0.02 .* rand(periods)

for t in 1:(periods - 1)
    polarization[t + 1] =
        polarization[t] +
        0.80 * outgroup_threat_framing[t] +
        0.65 * conformity_pressure[t] -
        0.45 * cross_group_contact[t] -
        0.45 * institutional_moderation[t]

    polarization[t + 1] = max(0.0, polarization[t + 1])
end

println("Initial synthetic polarization: ", polarization[1])
println("Final synthetic polarization: ", polarization[end])
println("Mean synthetic polarization: ", mean(polarization))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_polarization_feedback_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "initial_polarization,$(polarization[1])\n")
    write(io, "final_polarization,$(polarization[end])\n")
    write(io, "mean_polarization,$(mean(polarization))\n")
    write(io, "max_polarization,$(maximum(polarization))\n")
end
