! Synthetic distributive judgment score example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/distributive_judgment_score.f90 -o outputs/tables/distributive_judgment_score_fortran
! Run:
!   ./outputs/tables/distributive_judgment_score_fortran

program distributive_judgment_score
  implicit none

  real :: equality
  real :: equity
  real :: need
  real :: desert
  real :: priority
  real :: self_interest_bias
  real :: procedural_trust
  real :: group_distance
  real :: historical_repair
  real :: score

  equality = 0.7
  equity = 0.4
  need = 0.8
  desert = 0.3
  priority = 0.6
  self_interest_bias = 0.2
  procedural_trust = 0.5
  group_distance = 0.1
  historical_repair = 0.7

  score = 0.30 * equality + &
          0.25 * equity + &
          0.25 * need + &
          0.20 * desert + &
          0.25 * priority - &
          0.35 * self_interest_bias + &
          0.20 * procedural_trust - &
          0.20 * group_distance + &
          0.20 * historical_repair

  print *, "Synthetic distributive judgment score:", score
end program distributive_judgment_score
