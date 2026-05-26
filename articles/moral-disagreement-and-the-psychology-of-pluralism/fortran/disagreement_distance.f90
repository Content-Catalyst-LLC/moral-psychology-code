! Synthetic moral disagreement distance example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/disagreement_distance.f90 -o outputs/tables/disagreement_distance_fortran
! Run:
!   ./outputs/tables/disagreement_distance_fortran

program disagreement_distance
  implicit none

  real :: judgment_a
  real :: judgment_b
  real :: distance

  judgment_a = 0.40 * 0.8 + 0.30 * 0.7 + 0.20 * 0.2 + 0.15 * 0.1 + 0.15 * 0.2 + 0.25 * 0.8
  judgment_b = 0.40 * 0.3 + 0.30 * 0.4 + 0.20 * 0.8 + 0.15 * 0.7 + 0.15 * 0.6 + 0.25 * 0.4

  distance = abs(judgment_a - judgment_b)

  print *, "Synthetic judgment A:", judgment_a
  print *, "Synthetic judgment B:", judgment_b
  print *, "Synthetic disagreement distance:", distance
end program disagreement_distance
