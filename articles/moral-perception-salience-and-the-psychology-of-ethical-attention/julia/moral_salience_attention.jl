# Synthetic moral salience and ethical attention model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

perceived_harm = randn(n)
visible_vulnerability = randn(n)
emotional_activation = randn(n)
mind_perception = randn(n)
contextual_framing = randn(n)
attentional_competition = randn(n)
organized_inattention = randn(n)
intention_attribution = randn(n)
reflective_interpretation = randn(n)
repair_pathway = randn(n)

latent_salience =
    0.60 .* perceived_harm .+
    0.50 .* visible_vulnerability .+
    0.35 .* emotional_activation .+
    0.40 .* mind_perception .+
    0.25 .* contextual_framing .-
    0.45 .* attentional_competition .-
    0.35 .* organized_inattention

focal_attention_probability = 1.0 ./ (1.0 .+ exp.(-latent_salience))
focal_attention = focal_attention_probability .>= 0.5

moral_judgment =
    0.70 .* Float64.(focal_attention) .+
    0.35 .* intention_attribution .+
    0.30 .* reflective_interpretation .-
    0.15 .* organized_inattention

ethical_response_tendency =
    0.45 .* Float64.(focal_attention) .+
    0.30 .* moral_judgment .+
    0.25 .* repair_pathway .-
    0.20 .* attentional_competition .-
    0.20 .* organized_inattention

println("Mean synthetic focal attention probability: ", mean(focal_attention_probability))
println("Mean synthetic focal attention rate: ", mean(Float64.(focal_attention)))
println("Mean synthetic moral judgment: ", mean(moral_judgment))
println("Mean synthetic ethical response tendency: ", mean(ethical_response_tendency))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_moral_salience_attention_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_focal_attention_probability,$(mean(focal_attention_probability))\n")
    write(io, "mean_focal_attention_rate,$(mean(Float64.(focal_attention)))\n")
    write(io, "mean_moral_judgment,$(mean(moral_judgment))\n")
    write(io, "mean_ethical_response_tendency,$(mean(ethical_response_tendency))\n")
    write(io, "mean_organized_inattention,$(mean(organized_inattention))\n")
end
