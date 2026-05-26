! Synthetic institutional judgment-action gap.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/institutional_gap.f90 -o outputs/tables/institutional_gap_fortran
! Run:
!   ./outputs/tables/institutional_gap_fortran

program institutional_gap
  implicit none

  real :: diffusion
  real :: bureaucracy
  real :: accountability_asymmetry
  real :: retaliation_risk
  real :: accountability_climate
  real :: gap

  diffusion = 0.6
  bureaucracy = 0.7
  accountability_asymmetry = 0.5
  retaliation_risk = 0.8
  accountability_climate = 0.4

  gap = 0.10 + &
        0.25 * diffusion + &
        0.20 * bureaucracy + &
        0.25 * accountability_asymmetry + &
        0.30 * retaliation_risk - &
        0.25 * accountability_climate

  print *, "Synthetic institutional judgment-action gap:", gap
end program institutional_gap
