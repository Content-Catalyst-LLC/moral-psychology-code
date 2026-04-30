program moral_agency_update
  implicit none

  integer :: t
  real :: moral_agency
  real, parameter :: judgment = 0.70
  real, parameter :: identity = 0.68
  real, parameter :: regulation = 0.64
  real, parameter :: repair = 0.58
  real, parameter :: failure = 0.32
  real, parameter :: rate = 0.07

  moral_agency = 0.42

  print *, "Time", "MoralAgency"

  do t = 1, 20
     moral_agency = moral_agency + rate * (judgment + identity + regulation + repair - failure)
     if (moral_agency > 1.0) moral_agency = 1.0
     if (moral_agency < 0.0) moral_agency = 0.0
     print *, t, moral_agency
  end do

end program moral_agency_update
