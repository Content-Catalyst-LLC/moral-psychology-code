! Synthetic unethical action probability example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/unethical_action_probability.f90 -o outputs/tables/unethical_action_probability_fortran
! Run:
!   ./outputs/tables/unethical_action_probability_fortran

program unethical_action_probability
  implicit none

  real :: moral_disengagement
  real :: anticipated_guilt
  real :: institutional_pressure
  real :: accountability_strength
  real :: latent
  real :: probability

  moral_disengagement = 0.8
  anticipated_guilt = 0.3
  institutional_pressure = 0.6
  accountability_strength = 0.4

  latent = 0.55 * moral_disengagement - &
           0.35 * anticipated_guilt + &
           0.30 * institutional_pressure - &
           0.25 * accountability_strength

  probability = 1.0 / (1.0 + exp(-latent))

  print *, "Synthetic unethical action probability:", probability
end program unethical_action_probability
