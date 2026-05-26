! Synthetic public outrage expression score example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/outrage_expression_score.f90 -o outputs/tables/outrage_expression_score_fortran
! Run:
!   ./outputs/tables/outrage_expression_score_fortran

program outrage_expression_score
  implicit none

  real :: outrage
  real :: reward
  real :: amplification
  real :: identity
  real :: correction
  real :: latent
  real :: probability

  outrage = 0.8
  reward = 0.7
  amplification = 0.6
  identity = 0.5
  correction = 0.3

  latent = 0.35 * outrage + &
           0.30 * reward + &
           0.25 * amplification + &
           0.25 * identity - &
           0.15 * correction

  probability = 1.0 / (1.0 + exp(-latent))

  print *, "Synthetic public outrage expression probability:", probability
end program outrage_expression_score
