! Synthetic unethical action probability example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/unethical_probability_score.f90 -o outputs/tables/unethical_probability_score_fortran
! Run:
!   ./outputs/tables/unethical_probability_score_fortran

program unethical_probability_score
  implicit none

  real :: performance_pressure
  real :: hierarchy_intensity
  real :: diffusion_responsibility
  real :: accountability_strength
  real :: cultural_climate
  real :: speak_up_protection
  real :: value_alignment
  real :: corruption_pressure
  real :: latent
  real :: probability

  performance_pressure = 0.9
  hierarchy_intensity = 0.7
  diffusion_responsibility = 0.8
  accountability_strength = 0.5
  cultural_climate = 0.4
  speak_up_protection = 0.3
  value_alignment = 0.4
  corruption_pressure = 0.6

  latent = 0.35 * performance_pressure + &
           0.25 * hierarchy_intensity + &
           0.30 * diffusion_responsibility - &
           0.40 * accountability_strength - &
           0.25 * cultural_climate - &
           0.20 * speak_up_protection - &
           0.25 * value_alignment + &
           0.30 * corruption_pressure

  probability = 1.0 / (1.0 + exp(-latent))

  print *, "Synthetic unethical action probability:", probability
end program unethical_probability_score
