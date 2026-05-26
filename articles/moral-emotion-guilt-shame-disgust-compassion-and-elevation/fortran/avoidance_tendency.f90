! Synthetic avoidance tendency from shame, disgust, compassion, and agency.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/avoidance_tendency.f90 -o outputs/tables/avoidance_tendency_fortran
! Run:
!   ./outputs/tables/avoidance_tendency_fortran

program avoidance_tendency
  implicit none

  real :: shame
  real :: disgust
  real :: compassion
  real :: agency_capacity
  real :: avoidance

  shame = 0.9
  disgust = 0.8
  compassion = 0.3
  agency_capacity = 0.4

  avoidance = 0.40 * shame + &
              0.30 * disgust - &
              0.20 * compassion - &
              0.15 * agency_capacity

  print *, "Synthetic avoidance tendency:", avoidance
end program avoidance_tendency
