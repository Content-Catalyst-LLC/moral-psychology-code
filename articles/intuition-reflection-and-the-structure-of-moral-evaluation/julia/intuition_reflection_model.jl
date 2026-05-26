# Synthetic intuition-reflection model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

perceived_harm = randn(n)
affective_activation = randn(n)
social_salience = randn(n)
principled_reasoning = randn(n)
evidential_reconsideration = randn(n)
contextual_knowledge = randn(n)
cultural_framing = randn(n)
group_identity_pressure = randn(n)
time_for_reflection = randn(n)
institutional_review = randn(n)

intuitive_appraisal =
    0.55 .* perceived_harm .+
    0.45 .* affective_activation .+
    0.30 .* social_salience .+
    0.25 .* group_identity_pressure

reflective_evaluation =
    0.40 .* principled_reasoning .+
    0.35 .* evidential_reconsideration .+
    0.30 .* contextual_knowledge .+
    0.20 .* cultural_framing .+
    0.20 .* institutional_review

intuition_weight_latent =
    0.30 .+
    0.35 .* affective_activation .+
    0.25 .* social_salience .+
    0.20 .* group_identity_pressure .-
    0.30 .* evidential_reconsideration .-
    0.25 .* time_for_reflection

intuition_weight = 1.0 ./ (1.0 .+ exp.(-intuition_weight_latent))

final_moral_evaluation =
    intuition_weight .* intuitive_appraisal .+
    (1.0 .- intuition_weight) .* reflective_evaluation

reflective_revision = reflective_evaluation .- intuitive_appraisal
revision_magnitude = abs.(reflective_revision)

println("Mean synthetic intuitive appraisal: ", mean(intuitive_appraisal))
println("Mean synthetic reflective evaluation: ", mean(reflective_evaluation))
println("Mean synthetic intuition weight: ", mean(intuition_weight))
println("Mean synthetic final moral evaluation: ", mean(final_moral_evaluation))
println("Mean synthetic revision magnitude: ", mean(revision_magnitude))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_intuition_reflection_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_intuitive_appraisal,$(mean(intuitive_appraisal))\n")
    write(io, "mean_reflective_evaluation,$(mean(reflective_evaluation))\n")
    write(io, "mean_intuition_weight,$(mean(intuition_weight))\n")
    write(io, "mean_final_moral_evaluation,$(mean(final_moral_evaluation))\n")
    write(io, "mean_revision_magnitude,$(mean(revision_magnitude))\n")
end
