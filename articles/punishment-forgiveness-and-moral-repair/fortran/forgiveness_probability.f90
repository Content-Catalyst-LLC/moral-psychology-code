! Synthetic forgiveness probability example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/forgiveness_probability.f90 -o outputs/tables/forgiveness_probability_fortran
! Run:
!   ./outputs/tables/forgiveness_probability_fortran

program forgiveness_probability
  implicit none

  real :: acknowledgment
  real :: amends
  real :: ongoing_threat
  real :: victim_recognition
  real :: latent
  real :: probability

  acknowledgment = 0.8
  amends = 0.7
  ongoing_threat = 0.4
  victim_recognition = 0.6

  latent = 0.35 * acknowledgment + &
           0.30 * amends - &
           0.40 * ongoing_threat + &
           0.15 * victim_recognition

  probability = 1.0 / (1.0 + exp(-latent))

  print *, "Synthetic forgiveness probability:", probability
end program forgiveness_probability
