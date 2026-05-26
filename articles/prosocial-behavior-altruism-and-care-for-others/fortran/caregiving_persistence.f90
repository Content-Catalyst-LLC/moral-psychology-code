! Synthetic caregiving persistence example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/caregiving_persistence.f90 -o outputs/tables/caregiving_persistence_fortran
! Run:
!   ./outputs/tables/caregiving_persistence_fortran

program caregiving_persistence
  implicit none

  real :: attentional_responsiveness
  real :: ongoing_need
  real :: burnout
  real :: institutional_support
  real :: voice_safety
  real :: persistence

  attentional_responsiveness = 0.8
  ongoing_need = 0.7
  burnout = 0.4
  institutional_support = 0.6
  voice_safety = 0.5

  persistence = 0.35 * attentional_responsiveness + &
                0.40 * ongoing_need - &
                0.30 * burnout + &
                0.25 * institutional_support + &
                0.15 * voice_safety

  print *, "Synthetic caregiving persistence:", persistence
end program caregiving_persistence
