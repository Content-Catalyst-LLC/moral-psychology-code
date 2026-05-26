! Synthetic polarization distance example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/polarization_distance.f90 -o outputs/tables/polarization_distance_fortran
! Run:
!   ./outputs/tables/polarization_distance_fortran

program polarization_distance
  implicit none

  real :: group_a_mean
  real :: group_b_mean
  real :: distance

  group_a_mean = 0.72
  group_b_mean = -0.38

  distance = abs(group_a_mean - group_b_mean)

  print *, "Synthetic polarization distance:", distance
end program polarization_distance
