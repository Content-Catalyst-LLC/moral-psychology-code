! Synthetic cultural moral-profile distance example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/cultural_profile_distance.f90 -o outputs/tables/cultural_profile_distance_fortran
! Run:
!   ./outputs/tables/cultural_profile_distance_fortran

program cultural_profile_distance
  implicit none

  real, dimension(6) :: context_a
  real, dimension(6) :: context_b
  real :: distance

  context_a = (/0.45, 0.30, 0.10, 0.10, 0.05, 0.10/)
  context_b = (/0.25, 0.20, 0.30, 0.25, 0.20, 0.25/)

  distance = sqrt(sum((context_a - context_b)**2))

  print *, "Synthetic cultural moral-profile distance:", distance
end program cultural_profile_distance
