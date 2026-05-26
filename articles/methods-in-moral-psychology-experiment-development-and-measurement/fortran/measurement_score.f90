! Synthetic measurement score example for Methods in Moral Psychology.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/measurement_score.f90 -o outputs/tables/measurement_score_fortran
! Run:
!   ./outputs/tables/measurement_score_fortran

program measurement_score
  implicit none

  real :: wrongness
  real :: blame
  real :: norm_learning
  real :: action_tendency
  real :: score

  wrongness = 0.8
  blame = 0.6
  norm_learning = 0.7
  action_tendency = 0.5

  score = 0.35 * wrongness + &
          0.30 * blame + &
          0.20 * norm_learning + &
          0.15 * action_tendency

  print *, "Synthetic latent moral construct score:", score
end program measurement_score
