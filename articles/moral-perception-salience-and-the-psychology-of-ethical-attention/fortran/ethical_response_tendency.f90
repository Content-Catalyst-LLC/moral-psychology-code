! Synthetic ethical response tendency from attention, judgment, repair pathway, and inattention.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/ethical_response_tendency.f90 -o outputs/tables/ethical_response_tendency_fortran
! Run:
!   ./outputs/tables/ethical_response_tendency_fortran

program ethical_response_tendency
  implicit none

  real :: focal_attention
  real :: moral_judgment
  real :: repair_pathway
  real :: attentional_competition
  real :: organized_inattention
  real :: response

  focal_attention = 1.0
  moral_judgment = 0.8
  repair_pathway = 0.7
  attentional_competition = 0.3
  organized_inattention = 0.2

  response = 0.45 * focal_attention + &
             0.30 * moral_judgment + &
             0.25 * repair_pathway - &
             0.20 * attentional_competition - &
             0.20 * organized_inattention

  print *, "Synthetic ethical response tendency:", response
end program ethical_response_tendency
