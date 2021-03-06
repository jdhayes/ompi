! -*- f90 -*-
!
! Copyright (c) 2010-2012 Cisco Systems, Inc.  All rights reserved.
! Copyright (c) 2009-2012 Los Alamos National Security, LLC.
!               All Rights reserved.
! Copyright (c) 2004-2014 High Performance Computing Center Stuttgart,
!                         University of Stuttgart.  All rights reserved.
! Copyright (c) 2018      Research Organization for Information Science
!                         and Technology (RIST).  All rights reserved.
! $COPYRIGHT$

subroutine PMPI_Win_allocate_f08(size, disp_unit, info, comm, &
      baseptr, win, ierror)
   USE, INTRINSIC ::  ISO_C_BINDING, ONLY : C_PTR
   use :: mpi_f08_types, only : MPI_Info, MPI_Comm, MPI_Win, MPI_ADDRESS_KIND
   use :: ompi_mpifh_bindings, only : ompi_win_allocate_f
   implicit none
   INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) ::  size
   INTEGER, INTENT(IN) ::  disp_unit
   TYPE(MPI_Info), INTENT(IN) ::  info
   TYPE(MPI_Comm), INTENT(IN) ::  comm
   TYPE(C_PTR), INTENT(OUT) ::  baseptr
   TYPE(MPI_Win), INTENT(OUT) ::  win
   INTEGER, OPTIONAL, INTENT(OUT) ::  ierror
   integer :: c_ierror

  call ompi_win_allocate_f(size, disp_unit, info%MPI_VAL, comm%MPI_VAL, baseptr, win%MPI_VAL, c_ierror)
   if (present(ierror)) ierror = c_ierror

end subroutine PMPI_Win_allocate_f08
