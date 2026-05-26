! Synthetic avoidance probability from shame, guilt, repair pathway, agency, and defensiveness.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/avoidance_probability.f90 -o outputs/tables/avoidance_probability_fortran
! Run:
!   ./outputs/tables/avoidance_probability_fortran

program avoidance_probability
  implicit none

  real :: guilt
  real :: shame
  real :: repair_pathway
  real :: agency_capacity
  real :: defensiveness
  real :: latent
  real :: probability

  guilt = 0.5
  shame = 0.9
  repair_pathway = 0.2
  agency_capacity = 0.3
  defensiveness = 0.8

  latent = 0.45 * shame - &
           0.20 * guilt - &
           0.20 * repair_pathway - &
           0.20 * agency_capacity + &
           0.30 * defensiveness

  probability = 1.0 / (1.0 + exp(-latent))

  print *, "Synthetic avoidance probability:", probability
end program avoidance_probability
