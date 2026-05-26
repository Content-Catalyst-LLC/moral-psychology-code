! Synthetic moral judgment score example for Experimental Moral Psychology.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/intuition_judgment_score.f90 -o outputs/tables/intuition_judgment_score_fortran
! Run:
!   ./outputs/tables/intuition_judgment_score_fortran

program intuition_judgment_score
  implicit none

  real :: intuition
  real :: reflection
  real :: norm_sensitivity
  real :: consequence_sensitivity
  real :: score

  intuition = 0.8
  reflection = 0.4
  norm_sensitivity = 0.7
  consequence_sensitivity = 0.6

  score = 0.30 * intuition + &
          0.20 * reflection + &
          0.25 * norm_sensitivity + &
          0.25 * consequence_sensitivity

  print *, "Synthetic moral judgment score:", score
end program intuition_judgment_score
