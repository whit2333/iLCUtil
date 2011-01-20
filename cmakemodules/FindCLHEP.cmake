#############################################################
# cmake module for finding CLHEP
#
# returns:
#   CLHEP_FOUND        : set to TRUE or FALSE
#   CLHEP_INCLUDE_DIRS : paths to clhep includes
#   CLHEP_LIBRARY_DIRS : paths to clhep libraries
#   CLHEP_LIBRARIES    : list of clhep libraries
#
# @author Jan Engels, DESY
#############################################################

# -- fix for backwards compatibility
IF( NOT DEFINED CLHEP_DIR AND DEFINED CLHEP_HOME )
    SET( CLHEP_DIR "${CLHEP_HOME}" )
ENDIF( NOT DEFINED CLHEP_DIR AND DEFINED CLHEP_HOME )

IF( NOT CLHEP_FIND_QUIETLY )
    MESSAGE( STATUS "Check for CLHEP: ${CLHEP_DIR}" )
ENDIF( NOT CLHEP_FIND_QUIETLY )


# ---------- includes ---------------------------------------------------------
SET( CLHEP_INCLUDE_DIRS CLHEP_INCLUDE_DIRS-NOTFOUND )
MARK_AS_ADVANCED( CLHEP_INCLUDE_DIRS )

FIND_PATH( CLHEP_INCLUDE_DIRS
    NAMES CLHEP/Vector/ThreeVector.h
    PATHS ${CLHEP_DIR}
    PATH_SUFFIXES include
    NO_DEFAULT_PATH )


# ---------- libraries --------------------------------------------------------
INCLUDE( MacroCheckPackageLibs )

# only standard libraries should be passed as arguments to CHECK_PACKAGE_LIBS
# additional components are set by cmake in variable PKG_FIND_COMPONENTS
# first argument should be the package name
CHECK_PACKAGE_LIBS( CLHEP CLHEP )



# ---------- final checking ---------------------------------------------------
INCLUDE( FindPackageHandleStandardArgs )
# set CLHEP_FOUND to TRUE if all listed variables are TRUE and not empty
FIND_PACKAGE_HANDLE_STANDARD_ARGS( CLHEP DEFAULT_MSG CLHEP_INCLUDE_DIRS CLHEP_LIBRARIES )



# FIXME DEPRECATED
IF( CLHEP_FOUND )
    SET( CLHEP_DEFINITIONS "-DUSE_CLHEP" )
    MARK_AS_ADVANCED( CLHEP_DEFINITIONS )
ENDIF( CLHEP_FOUND )

