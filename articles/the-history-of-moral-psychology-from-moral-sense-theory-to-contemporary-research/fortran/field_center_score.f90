! Synthetic field-center score for historical moral psychology emphases.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/field_center_score.f90 -o outputs/tables/field_center_score_fortran
! Run:
!   ./outputs/tables/field_center_score_fortran

program field_center_score
  implicit none

  real :: sentiment
  real :: reason
  real :: development
  real :: intuition
  real :: culture_politics
  real :: neuroscience_experiment
  real :: institutions
  real :: score

  sentiment = 0.45
  reason = 0.40
  development = 0.45
  intuition = 0.75
  culture_politics = 0.85
  neuroscience_experiment = 0.80
  institutions = 0.90

  score = sentiment + reason + development + intuition + &
          culture_politics + neuroscience_experiment + institutions

  print *, "Synthetic field-center score:", score
end program field_center_score
