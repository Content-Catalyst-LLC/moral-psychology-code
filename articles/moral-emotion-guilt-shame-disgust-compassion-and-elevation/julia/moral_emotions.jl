# Synthetic moral-emotion model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

perceived_wrongdoing = randn(n)
specific_responsibility = randn(n)
global_self_condemnation = randn(n)
exposure_before_others = randn(n)
perceived_violation = randn(n)
boundary_threat = randn(n)
perceived_suffering = randn(n)
mind_perception = randn(n)
admired_moral_action = randn(n)
perceived_moral_excellence = randn(n)
agency_capacity = randn(n)
repair_pathway = randn(n)
social_support = randn(n)

guilt =
    0.55 .* perceived_wrongdoing .+
    0.50 .* specific_responsibility .+
    0.20 .* agency_capacity

shame =
    0.60 .* global_self_condemnation .+
    0.45 .* exposure_before_others .-
    0.15 .* agency_capacity

disgust =
    0.60 .* perceived_violation .+
    0.40 .* boundary_threat

compassion =
    0.65 .* perceived_suffering .+
    0.35 .* mind_perception .+
    0.15 .* social_support

elevation =
    0.60 .* admired_moral_action .+
    0.45 .* perceived_moral_excellence

helping_tendency =
    0.35 .* guilt .+
    0.45 .* compassion .+
    0.30 .* elevation .-
    0.20 .* shame .-
    0.15 .* disgust .+
    0.20 .* repair_pathway

repair_tendency =
    0.45 .* guilt .-
    0.25 .* shame .+
    0.25 .* compassion .+
    0.30 .* repair_pathway .+
    0.20 .* agency_capacity

avoidance_tendency =
    0.40 .* shame .+
    0.30 .* disgust .-
    0.20 .* compassion .-
    0.15 .* agency_capacity

println("Mean synthetic guilt: ", mean(guilt))
println("Mean synthetic shame: ", mean(shame))
println("Mean synthetic disgust: ", mean(disgust))
println("Mean synthetic compassion: ", mean(compassion))
println("Mean synthetic elevation: ", mean(elevation))
println("Mean synthetic helping tendency: ", mean(helping_tendency))
println("Mean synthetic repair tendency: ", mean(repair_tendency))
println("Mean synthetic avoidance tendency: ", mean(avoidance_tendency))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_moral_emotions_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_guilt,$(mean(guilt))\n")
    write(io, "mean_shame,$(mean(shame))\n")
    write(io, "mean_disgust,$(mean(disgust))\n")
    write(io, "mean_compassion,$(mean(compassion))\n")
    write(io, "mean_elevation,$(mean(elevation))\n")
    write(io, "mean_helping_tendency,$(mean(helping_tendency))\n")
    write(io, "mean_repair_tendency,$(mean(repair_tendency))\n")
    write(io, "mean_avoidance_tendency,$(mean(avoidance_tendency))\n")
end
