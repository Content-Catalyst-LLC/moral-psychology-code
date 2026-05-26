! Synthetic autonomy-orientation score for developmental moral reasoning.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/autonomy_orientation.f90 -o outputs/tables/autonomy_orientation_fortran
! Run:
!   ./outputs/tables/autonomy_orientation_fortran

program autonomy_orientation
  implicit none

  real :: latent_reasoning
  real :: domain_differentiation
  real :: peer_cooperation
  real :: authority_orientation
  real :: autonomy

  latent_reasoning = 1.2
  domain_differentiation = 0.8
  peer_cooperation = 0.6
  authority_orientation = 0.3

  autonomy = 0.40 * latent_reasoning + &
             0.35 * domain_differentiation + &
             0.25 * peer_cooperation - &
             0.20 * authority_orientation

  print *, "Synthetic autonomy orientation:", autonomy
end program autonomy_orientation
