! Synthetic repair capacity after self-regulatory failure example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/repair_capacity.f90 -o outputs/tables/repair_capacity_fortran
! Run:
!   ./outputs/tables/repair_capacity_fortran

program repair_capacity
  implicit none

  real :: guilt_recognition
  real :: humility
  real :: accountability
  real :: defensiveness
  real :: rationalization_tendency
  real :: repair

  guilt_recognition = 0.8
  humility = 0.7
  accountability = 0.6
  defensiveness = 0.4
  rationalization_tendency = 0.3

  repair = 0.35 * guilt_recognition + &
           0.35 * humility + &
           0.30 * accountability - &
           0.40 * defensiveness - &
           0.20 * rationalization_tendency

  print *, "Synthetic repair capacity:", repair
end program repair_capacity
