! Synthetic adult moral action probability example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/moral_action_probability.f90 -o outputs/tables/moral_action_probability_fortran
! Run:
!   ./outputs/tables/moral_action_probability_fortran

program moral_action_probability
  implicit none

  real :: latent_moral_development
  real :: voice_safety
  real :: accountability_strength
  real :: caregiving_burden
  real :: latent
  real :: probability

  latent_moral_development = 0.8
  voice_safety = 0.5
  accountability_strength = 0.7
  caregiving_burden = 0.4

  latent = 0.45 * latent_moral_development + &
           0.25 * voice_safety + &
           0.25 * accountability_strength - &
           0.25 * caregiving_burden

  probability = 1.0 / (1.0 + exp(-latent))

  print *, "Synthetic adult moral action probability:", probability
end program moral_action_probability
