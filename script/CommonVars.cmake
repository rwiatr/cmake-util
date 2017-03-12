if(__COMMON__VARS)
else(__COMMON__VARS)

if(EXISTS ${CMAKE_SOURCE_DIR}/cmake-util)
  set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake-util)
  get_filename_component(C_V__SOURCE_MODULE_NAME ${CMAKE_SOURCE_DIR} NAME)
  set(C_V__LIBRARIES_HOME ${CMAKE_SOURCE_DIR}/lib)
endif()

message ("-- CMAKE_MODULE_PATH = " ${CMAKE_MODULE_PATH} )
message ("-- CMAKE_SOURCE_DIR = " ${CMAKE_SOURCE_DIR} )
message ("-- C_V__SOURCE_MODULE_NAME = " ${C_V__SOURCE_MODULE_NAME} )
message ("-- C_V__LIBRARIES_HOME = " ${C_V__LIBRARIES_HOME} )

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -std=c++14 -Wall -pedantic") #-Wall -Werror -pedantic ## -static-libstdc++ -static-libgcc
message ("-- CMAKE_CXX_FLAGS = " ${CMAKE_CXX_FLAGS} )

file(GLOB C_V__MODULE_SOURCES "${CMAKE_SOURCE_DIR}/src/*.cc")
file(GLOB C_V__MODULE_TEST_SOURCES "${CMAKE_SOURCE_DIR}/test/*.cc")

include_directories("${CMAKE_SOURCE_DIR}/include/")

message ("-- C_V__MODULE_HEADERS = " ${C_V__MODULE_HEADERS} )
message ("-- C_V__MODULE_SOURCES = " ${C_V__MODULE_SOURCES} )
message ("-- C_V__MODULE_TEST_SOURCES = " ${C_V__MODULE_TEST_SOURCES} )

set(__COMMON__VARS true)
endif(__COMMON__VARS)
