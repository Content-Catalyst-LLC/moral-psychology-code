! Synthetic moral failure probability example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/moral_failure_probability.f90 -o outputs/tables/moral_failure_probability_fortran
! Run:
!   ./outputs/tables/moral_failure_probability_fortran

program moral_failure_probability
  implicit none

  real :: hypocrisy
  real :: dehumanization
  real :: ingroup_bias
  real :: institutional_hypocrisy
  real :: empathic_recognition
  real :: accountability_strength
  real :: victim_visibility
  real :: latent
  real :: probability

  hypocrisy = 0.8
  dehumanization = 0.7
  ingroup_bias = 0.5
  institutional_hypocrisy = 0.6
  empathic_recognition = 0.3
  accountability_strength = 0.4
  victim_visibility = 0.2

  latent = 0.45 * hypocrisy + &
           0.40 * dehumanization + &
           0.30 * ingroup_bias + &
           0.25 * institutional_hypocrisy - &
           0.35 * empathic_recognition - &
           0.25 * accountability_strength - &
           0.20 * victim_visibility

  probability = 1.0 / (1.0 + exp(-latent))

  print *, "Synthetic moral failure probability:", probability
end program moral_failure_probability
