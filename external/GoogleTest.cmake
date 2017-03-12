if (__GOOGLE_TEST_INCLUDE__LIB)
else(__GOOGLE_TEST_INCLUDE__LIB)

include(ExternalProject)
include(cmake/script/CommonVars.cmake)
set(GOOGLE_TEST_VERSION 1.7.0)

### GoogleTest
ExternalProject_Add(
    googletest
	GIT_REPOSITORY https://github.com/google/googletest.git
	GIT_TAG release-${GOOGLE_TEST_VERSION}
    PREFIX ${C_V__LIBRARIES_HOME}/googletest-${GOOGLE_TEST_VERSION}
    # Disable install step
    INSTALL_COMMAND ""
    DOWNLOAD_DIR "${C_V__LIBRARIES_HOME}/download/googletest-${GOOGLE_TEST_VERSION}"
)

add_library(libgtest IMPORTED STATIC GLOBAL)
add_dependencies(libgtest googletest)

ExternalProject_Get_Property(googletest source_dir binary_dir)

MESSAGE( "-- [googletest] source_dir: " ${source_dir} )
MESSAGE( "-- [googletest] binary_dir: " ${binary_dir} )

set_target_properties(libgtest PROPERTIES
    "IMPORTED_LOCATION" "${binary_dir}/libgtest.a"
    "IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
    #"INTERFACE_INCLUDE_DIRECTORIES" "${source_dir}/include"
)
include_directories("${source_dir}/include")

set(__GOOGLE_TEST_INCLUDE__LIB true)
endif(__GOOGLE_TEST_INCLUDE__LIB)
