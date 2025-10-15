MODULE basal_hydrology_model_types

  ! The different data types used in the basal hydrology modules

! ===== Preamble =====
! ====================

  USE precisions                                             , ONLY: dp
  USE laddie_model_types                                     , ONLY: type_laddie_model
  use laddie_forcing_types, only: type_laddie_forcing
  use reference_geometry_types, only: type_reference_geometry
  USE mesh_types                                             , ONLY: type_mesh

  IMPLICIT NONE

  private

  public :: type_basal_hydrology_model

! ===== Types =====
! =================

  TYPE type_basal_hydrology_model
    ! The basal hydrology model data structure.

    ! Main data fields
    ! Fill here what we need for the basal hydrology model
    ! Part of this might need to go in ice_model_types?
    real(dp), dimension(:), allocatable :: W                   ! Basal water depth
    real(dp), dimension(:), allocatable :: dW_dx_b              ! Derivative of W on B grid.

    real(dp), dimension(:), allocatable :: W_til               ! Basal water depth in till

    real(dp), dimension(:), allocatable :: P                   ! Pressure of the ice on the basal water
    real(dp), dimension(:), allocatable :: P_o                 ! Overburden pressure of the ice on the basal water
    real(dp), dimension(:), allocatable :: N                   ! Effective pressure (P_o - P)

    real(dp), dimension(:), allocatable :: m                   ! Total input of water to the basal system

    real(dp), dimension(:), allocatable :: D                   ! Diffusivity

    real(dp), dimension(:), allocatable :: K                   ! Effective conductivity

    real(dp), dimension(:), allocatable :: u                   ! Velocity in x direction
    real(dp), dimension(:), allocatable :: v                   ! Velocity in y direction

    ! Is this how it goes in UFEMISM as well? Compass indices do not really make sense here?
    real(dp), dimension(:), allocatable :: Q_e                 ! Normal component (east) of the advective flux VW
    real(dp), dimension(:), allocatable :: Q_w                 ! Normal component (west) of the advective flux VW
    real(dp), dimension(:), allocatable :: Q_n                 ! Normal component (north) of the advective flux VW
    real(dp), dimension(:), allocatable :: Q_s                 ! Normal component (south) of the advective flux VW

    real(dp), dimension(:), allocatable :: phi_0               ! Englacial porosity

    ! How do we handle constants? Are those also types somewhere?
    ! Seems to be in model_configuration.f90 and parameters.f90?

    real(dp), dimension(:), allocatable :: u_b                 ! Ice sliding velocity in x direction
    real(dp), dimension(:), allocatable :: v_b                 ! Ice sliding velocity in y direction

    real(dp), dimension(:), allocatable :: A                   ! Softness of the ice

    real(dp), dimension(:), allocatable :: psi                 ! Hydraulic potential

    real(dp), dimension(:), allocatable :: b                   ! Bedrock elevation (reference geometry?)

    real(dp), dimension(:), allocatable :: H_i                 ! Ice thickness

    logical, dimension(:), allocatable  :: floating            ! Is the ice floating? (probably an "ice" variable)
    ! ice%mask_floating_ice
    logical, dimension(:), allocatable  :: ice_free            ! Is there ice at this location? (probably an "ice" variable)
    ! ice%mask_icefree_land

    ! Metadata
    CHARACTER(LEN=256)                      :: restart_filename            ! Name for generated restart file

    ! Timestepping
    REAL(dp)                                :: t_next
    !real(dp)                                :: dt                  ! Timestep
    

    ! LADDIE
    type(type_laddie_model)                       :: laddie
    type(type_laddie_forcing)                     :: forcing


  END TYPE type_basal_hydrology_model

CONTAINS

END MODULE basal_hydrology_model_types
