if (__GLFW_INCLUDE__LIB)
else (__GLFW_INCLUDE__LIB)

    include(ExternalProject)
    include(cmake-util/script/CommonVars.cmake)
    set(GLFW_VERSION 3.2.1)

    ### glfw
    ExternalProject_Add(
            glfw
            GIT_REPOSITORY https://github.com/glfw/glfw.git
            GIT_TAG ${GLFW_VERSION}
            PREFIX ${C_V__LIBRARIES_HOME}/glfw-${GLFW_VERSION}
            # Disable install step
            INSTALL_COMMAND ""
            DOWNLOAD_DIR "${C_V__LIBRARIES_HOME}/download/glfw-${GLFW_VERSION}"
    )

    add_library(libglfw IMPORTED STATIC GLOBAL)
    add_dependencies(libglfw glfw)

    ExternalProject_Get_Property(glfw source_dir binary_dir)

    MESSAGE("-- [glfw] source_dir: " ${source_dir})
    MESSAGE("-- [glfw] binary_dir: " ${binary_dir})

    set_target_properties(libglfw PROPERTIES
            "IMPORTED_LOCATION" "${binary_dir}/libglfw.a"
            "IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
            #"INTERFACE_INCLUDE_DIRECTORIES" "${source_dir}/include"
            )
    include_directories("${source_dir}/include")

    set(__GLFW_INCLUDE__LIB true)
endif (__GLFW_INCLUDE__LIB)
