! Synthetic blame probability example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/blame_probability.f90 -o outputs/tables/blame_probability_fortran
! Run:
!   ./outputs/tables/blame_probability_fortran

program blame_probability
  implicit none

  real :: responsibility
  real :: wrongness_severity
  real :: motive_malice
  real :: mitigating_excuse
  real :: latent
  real :: probability

  responsibility = 0.8
  wrongness_severity = 0.7
  motive_malice = 0.5
  mitigating_excuse = 0.4

  latent = 0.40 * responsibility + &
           0.35 * wrongness_severity + &
           0.25 * motive_malice - &
           0.30 * mitigating_excuse

  probability = 1.0 / (1.0 + exp(-latent))

  print *, "Synthetic blame probability:", probability
end program blame_probability
