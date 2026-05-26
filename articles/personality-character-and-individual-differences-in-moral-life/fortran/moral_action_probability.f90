! Synthetic moral action probability example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/moral_action_probability.f90 -o outputs/tables/moral_action_probability_fortran
! Run:
!   ./outputs/tables/moral_action_probability_fortran

program moral_action_probability
  implicit none

  real :: moral_response_profile
  real :: situational_pressure
  real :: voice_safety
  real :: accountability_strength
  real :: latent
  real :: probability

  moral_response_profile = 0.8
  situational_pressure = 0.6
  voice_safety = 0.5
  accountability_strength = 0.7

  latent = 0.45 * moral_response_profile - &
           0.35 * situational_pressure + &
           0.25 * voice_safety + &
           0.25 * accountability_strength

  probability = 1.0 / (1.0 + exp(-latent))

  print *, "Synthetic moral action probability:", probability
end program moral_action_probability
