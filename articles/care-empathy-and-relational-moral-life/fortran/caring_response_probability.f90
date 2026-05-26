! Synthetic care, empathy, and relational moral life probability example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/caring_response_probability.f90 -o outputs/tables/caring_response_probability_fortran
! Run:
!   ./outputs/tables/caring_response_probability_fortran

program caring_response_probability
  implicit none

  real :: empathy
  real :: felt_responsibility
  real :: perceived_dependence
  real :: temporal_persistence
  real :: burnout
  real :: institutional_support
  real :: voice_safety
  real :: latent
  real :: probability

  empathy = 0.8
  felt_responsibility = 0.7
  perceived_dependence = 0.6
  temporal_persistence = 0.5
  burnout = 0.4
  institutional_support = 0.6
  voice_safety = 0.5

  latent = 0.35 * empathy + &
           0.40 * felt_responsibility + &
           0.35 * perceived_dependence + &
           0.30 * temporal_persistence - &
           0.40 * burnout + &
           0.25 * institutional_support + &
           0.18 * voice_safety

  probability = 1.0 / (1.0 + exp(-latent))

  print *, "Synthetic caring response probability:", probability
end program caring_response_probability
