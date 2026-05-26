! Synthetic polarization distance example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/polarization_distance.f90 -o outputs/tables/polarization_distance_fortran
! Run:
!   ./outputs/tables/polarization_distance_fortran

program polarization_distance
  implicit none

  real :: mean_group_a
  real :: mean_group_b
  real :: distance

  mean_group_a = 0.75
  mean_group_b = -0.45

  distance = abs(mean_group_a - mean_group_b)

  print *, "Synthetic polarization distance:", distance
end program polarization_distance
