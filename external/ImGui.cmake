if (__IMGUI_INCLUDE__LIB)
else (__IMGUI_INCLUDE__LIB)

    include(ExternalProject)
    include(cmake-util/script/CommonVars.cmake)
    set(IMGUI_VERSION 1.52)
    set(IMGUI_BUILD_CMD "${CMAKE_CXX_COMPILER} -c ../imgui/imgui.cpp ../imgui/imgui_draw.cpp && ar -cvq libimgui.a *.o && rm *.o")

    ### imgui
    #git checkout tags/<tag_name>
    ExternalProject_Add(
            imgui
            GIT_REPOSITORY https://github.com/ocornut/imgui.git
            GIT_TAG v${IMGUI_VERSION}
            PREFIX ${C_V__LIBRARIES_HOME}/imgui-${IMGUI_VERSION}
            # Disable install step
            CONFIGURE_COMMAND ""
            BUILD_COMMAND bash -c ${IMGUI_BUILD_CMD}
            INSTALL_COMMAND ""
            DOWNLOAD_DIR "${C_V__LIBRARIES_HOME}/download/imgui-${IMGUI_VERSION}"
    )

    add_library(libimgui IMPORTED STATIC GLOBAL)
    add_dependencies(libimgui imgui)

    ExternalProject_Get_Property(imgui source_dir binary_dir)

    MESSAGE("-- [imgui] source_dir: " ${source_dir})
    MESSAGE("-- [imgui] binary_dir: " ${binary_dir})

    set_target_properties(libimgui PROPERTIES
            "IMPORTED_LOCATION" "${binary_dir}/libimgui.a"
            "IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
            #"INTERFACE_INCLUDE_DIRECTORIES" "${source_dir}/include"
            )
    include_directories("${source_dir}")

    set(__IMGUI_INCLUDE__LIB true)
endif (__IMGUI_INCLUDE__LIB)
