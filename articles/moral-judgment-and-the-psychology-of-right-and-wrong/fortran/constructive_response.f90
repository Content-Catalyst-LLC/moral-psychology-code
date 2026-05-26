! Synthetic constructive moral response score.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/constructive_response.f90 -o outputs/tables/constructive_response_fortran
! Run:
!   ./outputs/tables/constructive_response_fortran

program constructive_response
  implicit none

  real :: blame_rating
  real :: repair_opportunity
  real :: dignity_preservation
  real :: institutional_support
  real :: punitive_pressure
  real :: response_score

  blame_rating = 5.2
  repair_opportunity = 0.8
  dignity_preservation = 0.7
  institutional_support = 0.6
  punitive_pressure = 0.4

  response_score = 0.35 * blame_rating + &
                   0.45 * repair_opportunity + &
                   0.35 * dignity_preservation + &
                   0.25 * institutional_support - &
                   0.30 * punitive_pressure

  print *, "Synthetic constructive response score:", response_score
end program constructive_response
