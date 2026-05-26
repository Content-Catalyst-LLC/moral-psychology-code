# Synthetic institutional integrity model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

accountability_strength = randn(n)
speak_up_protection = randn(n)
value_alignment = randn(n)
cultural_climate = randn(n)
corruption_pressure = randn(n)
diffusion_responsibility = randn(n)

institutional_integrity =
    0.30 .* accountability_strength .+
    0.30 .* speak_up_protection .+
    0.30 .* value_alignment .+
    0.20 .* cultural_climate .-
    0.30 .* corruption_pressure .-
    0.20 .* diffusion_responsibility .+
    0.8 .* randn(n)

println("Mean synthetic institutional integrity: ", mean(institutional_integrity))
println("SD synthetic institutional integrity: ", std(institutional_integrity))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_institutional_integrity_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_integrity,$(mean(institutional_integrity))\n")
    write(io, "sd_integrity,$(std(institutional_integrity))\n")
    write(io, "min_integrity,$(minimum(institutional_integrity))\n")
    write(io, "max_integrity,$(maximum(institutional_integrity))\n")
end
