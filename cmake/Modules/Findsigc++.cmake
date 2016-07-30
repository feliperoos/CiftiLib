
#use pkg-config
FIND_PACKAGE(PkgConfig)
PKG_CHECK_MODULES(PC_SIGCXX sigc++-2.0)

FIND_PATH(sigc++_INCLUDE_DIR NAMES sigc++/sigc++.h HINTS ${PC_SIGCXX_INCLUDEDIR} ${PC_SIGCXX_INCLUDE_DIRS})
FIND_PATH(sigc++_config_INCLUDE_DIR NAMES sigc++config.h HINTS ${PC_SIGCXX_INCLUDEDIR} ${PC_SIGCXX_INCLUDE_DIRS})
FIND_LIBRARY(sigc++_LIBRARY NAMES sigc sigc-2.0 HINTS ${PC_SIGCXX_LIBDIR} ${PC_SIGCXX_LIBRARY_DIRS})

SET(sigc++_LIBRARIES ${sigc++_LIBRARY} ${PC_SIGCXX_PKGCONF_LIBRARIES})
SET(sigc++_INCLUDE_DIRS ${sigc++_INCLUDE_DIR} ${sigc++_config_INCLUDE_DIR} ${PC_SIGCXX_PKGCONF_INCLUDE_DIRS})

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(sigc++ DEFAULT_MSG sigc++_LIBRARY sigc++_INCLUDE_DIR)

MARK_AS_ADVANCED(sigc++_INCLUDE_DIR sigc++_config_INCLUDE_DIR sigc++_LIBRARY)