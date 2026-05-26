! Synthetic relevance score example for "Why Moral Psychology Matters Today".
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/relevance_score.f90 -o outputs/tables/relevance_score_fortran
! Run:
!   ./outputs/tables/relevance_score_fortran

program relevance_score
  implicit none

  real :: political_polarization
  real :: organizational_risk
  real :: developmental_learning
  real :: cross_cultural_variation
  real :: technology_amplification
  real :: moral_injury_burden
  real :: score

  political_polarization = 1.2
  organizational_risk = 0.8
  developmental_learning = 0.4
  cross_cultural_variation = 0.5
  technology_amplification = 1.0
  moral_injury_burden = 0.9

  score = 0.25 * political_polarization + &
          0.20 * organizational_risk + &
          0.15 * developmental_learning + &
          0.15 * cross_cultural_variation + &
          0.15 * technology_amplification + &
          0.20 * moral_injury_burden

  print *, "Synthetic moral psychology relevance score:", score
end program relevance_score
