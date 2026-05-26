! Synthetic childhood/adolescence moral action probability example.
! Educational scaffold only.
!
! Compile:
!   gfortran fortran/moral_action_probability.f90 -o outputs/tables/moral_action_probability_fortran
! Run:
!   ./outputs/tables/moral_action_probability_fortran

program moral_action_probability
  implicit none

  real :: latent_moral_development
  real :: empathic_concern
  real :: school_climate
  real :: peer_status_pressure
  real :: latent
  real :: probability

  latent_moral_development = 0.8
  empathic_concern = 0.6
  school_climate = 0.5
  peer_status_pressure = 0.7

  latent = 0.45 * latent_moral_development + &
           0.30 * empathic_concern + &
           0.25 * school_climate - &
           0.30 * peer_status_pressure

  probability = 1.0 / (1.0 + exp(-latent))

  print *, "Synthetic moral action probability:", probability
end program moral_action_probability
