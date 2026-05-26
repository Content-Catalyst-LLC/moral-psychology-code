! Synthetic moral injury risk example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/moral_injury_score.f90 -o outputs/tables/moral_injury_score_fortran
! Run:
!   ./outputs/tables/moral_injury_score_fortran

program moral_injury_score
  implicit none

  real :: conscience_conflict
  real :: institutional_betrayal
  real :: distributed_responsibility
  real :: exposure
  real :: scarcity
  real :: accountability
  real :: protected_voice
  real :: repair_capacity
  real :: latent
  real :: risk

  conscience_conflict = 0.9
  institutional_betrayal = 0.8
  distributed_responsibility = 0.7
  exposure = 0.8
  scarcity = 0.6
  accountability = 0.4
  protected_voice = 0.3
  repair_capacity = 0.3

  latent = 0.30 * conscience_conflict + &
           0.30 * institutional_betrayal + &
           0.25 * distributed_responsibility + &
           0.30 * exposure + &
           0.20 * scarcity - &
           0.25 * accountability - &
           0.20 * protected_voice - &
           0.20 * repair_capacity

  risk = 1.0 / (1.0 + exp(-latent))

  print *, "Synthetic moral injury risk:", risk
end program moral_injury_score
