# Synthetic moral agency model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

moral_identity = randn(n)
empathic_concern = randn(n)
self_regulation = randn(n)
moral_salience = randn(n)
institutional_pressure = randn(n)
accountability_climate = randn(n)
repair_infrastructure = randn(n)
retaliation_risk = randn(n)

moral_judgment =
    0.70 .+
    0.18 .* moral_identity .+
    0.12 .* empathic_concern .+
    0.10 .* moral_salience

moral_action =
    0.45 .+
    0.25 .* moral_judgment .+
    0.20 .* moral_identity .+
    0.18 .* self_regulation .+
    0.12 .* repair_infrastructure .+
    0.10 .* accountability_climate .-
    0.22 .* institutional_pressure .-
    0.16 .* retaliation_risk

judgment_action_gap = moral_judgment .- moral_action

println("Mean synthetic moral judgment: ", mean(moral_judgment))
println("Mean synthetic moral action: ", mean(moral_action))
println("Mean synthetic judgment-action gap: ", mean(judgment_action_gap))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_moral_agency_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_moral_judgment,$(mean(moral_judgment))\n")
    write(io, "mean_moral_action,$(mean(moral_action))\n")
    write(io, "mean_judgment_action_gap,$(mean(judgment_action_gap))\n")
end
