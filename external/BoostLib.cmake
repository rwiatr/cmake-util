if (__BOOST__LIB)
else(__BOOST__LIB)

message( "External project - Boost" )

set( Boost_Bootstrap_Command )
if( UNIX )
  set( Boost_Bootstrap_Command ./bootstrap.sh )
  set( Boost_b2_Command ./b2 )
  set( Boost_URL https://sourceforge.net/projects/boost/files/boost/1.61.0/boost_1_61_0.tar.gz)
  set( Boost_SHA256 a77c7cc660ec02704c6884fbb20c552d52d60a18f26573c9cee0788bf00ed7e6)
elseif( MINGW OR MSYS OR CYGWIN OR WIN32 )
  set( Boost_Bootstrap_Command ./bootstrap.sh )
  set( Boost_b2_Command ./b2 )
  set( Boost_URL https://sourceforge.net/projects/boost/files/boost/1.61.0/boost_1_61_0.zip)
  set( Boost_SHA256 02d420e6908016d4ac74dfc712eec7d9616a7fc0da78b0a1b5b937536b2e01e8)
elseif( WIN32 )
  set( Boost_Bootstrap_Command bootstrap.bat )
  set( Boost_b2_Command b2.exe )
  set( Boost_URL https://sourceforge.net/projects/boost/files/boost/1.61.0/boost_1_61_0.zip)
  set( Boost_SHA256 02d420e6908016d4ac74dfc712eec7d9616a7fc0da78b0a1b5b937536b2e01e8)
endif()

ExternalProject_Add(boost
  URL ${Boost_URL}
  URL_HASH SHA256=${Boost_SHA256}
  BUILD_IN_SOURCE 1
  UPDATE_COMMAND ""
  PATCH_COMMAND ""
  DOWNLOAD_DIR ${CMAKE_SOURCE_DIR}/Libraries/download/boost
  PREFIX ${CMAKE_SOURCE_DIR}/Libraries/boost
  CONFIGURE_COMMAND ${Boost_Bootstrap_Command}
  BUILD_COMMAND  ${Boost_b2_Command} install
    --without-python
    --without-mpi
    --disable-icu
    --prefix=${CMAKE_SOURCE_DIR}/Libraries/boost/src/boost-build
    --threading=single,multi
    --link=shared
    --variant=release
    -j8
  INSTALL_COMMAND ""
#  INSTALL_COMMAND ${Boost_b2_Command} install
#    --without-python
#    --without-mpi
#    --disable-icu
#    --prefix=${CMAKE_BINARY_DIR}/INSTALL
#    --threading=single,multi
#    --link=shared
#    --variant=release
#    -j8
#  INSTALL_DIR ${CMAKE_BINARY_DIR}/INSTALL
)

add_library(libboost IMPORTED STATIC GLOBAL)
add_dependencies(libboost boost)

set(Boost_LIBRARY_DIR ${CMAKE_SOURCE_DIR}/Libraries/boost/src/boost-build/lib/ )
set(Boost_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/Libraries/boost/src/boost-build/include/**/ )

message("Boost_LIBRARY_DIR - ${Boost_LIBRARY_DIR}")
message("Boost_INCLUDE_DIR - ${Boost_INCLUDE_DIR}")

set(__BOOST__LIB true)
endif(__BOOST__LIB)
