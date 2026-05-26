! Synthetic reflective revision example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/reflective_revision.f90 -o outputs/tables/reflective_revision_fortran
! Run:
!   ./outputs/tables/reflective_revision_fortran

program reflective_revision
  implicit none

  real :: intuitive_appraisal
  real :: reflective_evaluation
  real :: revision

  intuitive_appraisal = 0.90
  reflective_evaluation = 0.35

  revision = reflective_evaluation - intuitive_appraisal

  print *, "Synthetic reflective revision:", revision
end program reflective_revision
