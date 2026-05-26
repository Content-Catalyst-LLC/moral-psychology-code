! Synthetic situationism moral action probability example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/moral_action_probability.f90 -o outputs/tables/moral_action_probability_fortran
! Run:
!   ./outputs/tables/moral_action_probability_fortran

program moral_action_probability
  implicit none

  real :: character_strength
  real :: habit_strength
  real :: situational_pressure
  real :: voice_safety
  real :: accountability_visibility
  real :: depletion
  real :: latent
  real :: probability

  character_strength = 0.8
  habit_strength = 0.6
  situational_pressure = 0.7
  voice_safety = 0.4
  accountability_visibility = 0.5
  depletion = 0.3

  latent = 0.42 * character_strength + &
           0.25 * habit_strength - &
           0.55 * situational_pressure + &
           0.25 * voice_safety + &
           0.25 * accountability_visibility - &
           0.20 * depletion - &
           0.22 * character_strength * situational_pressure

  probability = 1.0 / (1.0 + exp(-latent))

  print *, "Synthetic moral action probability:", probability
end program moral_action_probability
