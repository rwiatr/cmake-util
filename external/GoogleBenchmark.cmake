if (__GOOGLE_BENCHMARK_INCLUDE__LIB)
else (__GOOGLE_BENCHMARK_INCLUDE__LIB)

    include(ExternalProject)
    include(cmake-util/script/CommonVars.cmake)
    set(GOOGLE_BENCHMARK_VERSION 1.1.0)

    ### GoogleBenchmark
    ExternalProject_Add(
            googlebenchmark
            GIT_REPOSITORY https://github.com/google/benchmark.git
            GIT_TAG v${GOOGLE_BENCHMARK_VERSION}
            PREFIX ${C_V__LIBRARIES_HOME}/googlebenchmark-${GOOGLE_BENCHMARK_VERSION}
            # Disable install step
            INSTALL_COMMAND ""
            DOWNLOAD_DIR "${C_V__LIBRARIES_HOME}/download/googlebenchmark-${GOOGLE_BENCHMARK_VERSION}"
    )

    add_library(libbenchmark IMPORTED STATIC GLOBAL)
    add_dependencies(libbenchmark googlebenchmark)

    ExternalProject_Get_Property(googlebenchmark source_dir binary_dir)

    MESSAGE("-- [googlebenchmark] source_dir: " ${source_dir})
    MESSAGE("-- [googlebenchmark] binary_dir: " ${binary_dir})

    set_target_properties(libbenchmark PROPERTIES
            "IMPORTED_LOCATION" "${binary_dir}/src/libbenchmark.a"
            "IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
            #"INTERFACE_INCLUDE_DIRECTORIES" "${source_dir}/include"
            )
    include_directories("${source_dir}/include")

    set(__GOOGLE_BENCHMARK_INCLUDE__LIB true)
endif (__GOOGLE_BENCHMARK_INCLUDE__LIB)
