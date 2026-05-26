! Synthetic character, virtue, and moral selfhood probability example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/virtuous_action_probability.f90 -o outputs/tables/virtuous_action_probability_fortran
! Run:
!   ./outputs/tables/virtuous_action_probability_fortran

program virtuous_action_probability
  implicit none

  real :: character_strength
  real :: moral_selfhood_profile
  real :: situational_pressure
  real :: institutional_support
  real :: self_regulation
  real :: latent
  real :: probability

  character_strength = 0.8
  moral_selfhood_profile = 0.7
  situational_pressure = 0.6
  institutional_support = 0.5
  self_regulation = 0.6

  latent = 0.45 * character_strength + &
           0.30 * moral_selfhood_profile - &
           0.40 * situational_pressure + &
           0.25 * institutional_support + &
           0.20 * self_regulation

  probability = 1.0 / (1.0 + exp(-latent))

  print *, "Synthetic virtuous action probability:", probability
end program virtuous_action_probability
