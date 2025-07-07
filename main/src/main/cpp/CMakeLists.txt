# CMakeLists.txt for ics-openvpn/main/cpp/
# MODIFIED TO DISABLE INTERNAL OPENVPN 2.x BUILD
# This allows using a pre-built PQC-enabled 'openvpn' executable
# placed in 'main/src/main/jniLibs/<ABI>/'.

# Original comments and structure largely preserved for context.
# Lines related to building OpenVPN 2.x components are commented out.

#long comment

cmake_minimum_required(VERSION 3.4.1) # Or current version used by ics-openvpn
project("ics-openvpn")                 # Or current project name
# Git version string
#lonf comment end


# Attempt to include GetGitRevisionDescription.cmake, but make it optional
# as it's not critical if it's missing or fails for some reason.
include(GetGitRevisionDescription.cmake OPTIONAL RESULT_VARIABLE GIT_DESC_INCLUDE_RESULT)
if(NOT GIT_DESC_INCLUDE_RESULT)
    message(STATUS "GetGitRevisionDescription.cmake not found or failed. Git versions might not be embedded.")
endif()

# Check if git_describe command is available
if(COMMAND git_describe)
    # Safely try to get git descriptions for OpenVPN 2.x and 3.x source trees
    # These are for embedding version info into the built libraries (ovpnutil, etc.)
    # If these source directories are removed from your ics-openvpn clone, these will fail gracefully.
    if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/openvpn")
        git_describe(OPENVPN2_GIT "${CMAKE_CURRENT_SOURCE_DIR}/openvpn" "--tags" "--always" "--long")
    else()
        set(OPENVPN2_GIT "N/A_ics_openvpn_src_removed") # Default if path is gone
    endif()
    message(STATUS "OpenVPN 2.x (ics-openvpn tree version if present): ${OPENVPN2_GIT}")

    if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/openvpn3")
        git_describe(OPENVPN3_GIT "${CMAKE_CURRENT_SOURCE_DIR}/openvpn3" "--tags" "--always" "--long")
    else()
        set(OPENVPN3_GIT "N/A_ics_openvpn_src_removed") # Default if path is gone
    endif()
    message(STATUS "OpenVPN 3.x (ics-openvpn tree version if present): ${OPENVPN3_GIT}")
else()
    set(OPENVPN2_GIT "N/A_git_describe_missing")
    set(OPENVPN3_GIT "N/A_git_describe_missing")
    message(WARNING "git_describe command not available. Embedded git versions will be 'N/A'.")
endif()


# Set mbedtls options (relevant for OpenVPN 3 if not using OpenSSL)
OPTION(ENABLE_PROGRAMS "" OFF)
OPTION(USE_SHARED_MBEDTLS_LIBRARY "" OFF)
OPTION(ENABLE_TESTING "" OFF)

# Own options
OPTION(OPENVPN2MBED "Use mbed TLS for OpenVPN2" OFF) # This option is now moot as OpenVPN2 build is disabled
OPTION(OPENVPN3OSSL "Use OpenSSL for OpenVPN3" ON)  # Keep for OpenVPN3
SET(OPENVPN3OSSL ON) # Explicitly set

# STATIC or SHARED for OpenSSL (used by OpenVPN 3 or original OpenVPN 2)
SET(SSLLIBTYPE STATIC)
SET(OPENSSL_PATH "openssl") # Path to OpenSSL source for its internal build (if used by openssl.cmake)

set(CMAKE_CXX_STANDARD 23) # Or current CXX standard used by ics-openvpn


# Include helper CMake files for dependencies
# Make these includes optional in case the files or subdirectories (lzo, lz4, openssl for OVPN3)
# are not present or not needed for the remaining targets.
include(tools.cmake OPTIONAL)
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/lzo")
    include(lzo.cmake)
else()
    message(STATUS "lzo.cmake or lzo source directory not found, lzo support might be disabled for OVPN3.")
endif()
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/lz4")
    include(lz4.cmake)
else()
    message(STATUS "lz4.cmake or lz4 source directory not found, lz4 support might be disabled for OVPN3.")
endif()
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/openssl/openssl.cmake") # This is usually for finding/building OpenSSL for OVPN3
    include(openssl/openssl.cmake)
else()
    message(STATUS "openssl/openssl.cmake not found, OpenSSL for OVPN3 might rely on system/NDK.")
endif()


# mbedTLS build (if needed for OpenVPN 3)
# The original condition was (NOT ${OPENVPN3OSSL} OR ${OPENVPN2MBED})
# Since OPENVPN2MBED is irrelevant, it simplifies to (NOT ${OPENVPN3OSSL})
if(NOT ${OPENVPN3OSSL})
    if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/mbedtls")
        add_subdirectory(mbedtls)
    else()
        message(WARNING "mbedtls configured for OVPN3, but mbedtls source directory not found.")
    endif()
endif()

# --- OpenVPN 3 Core (libovpn3.so) Build ---
# This section is KEPT as it builds OpenVPN 3 functionality.
# Your PQC setup is for OpenVPN 2.x.
if (NOT CMAKE_LIBRARY_OUTPUT_DIRECTORY MATCHES "build/intermediates/cmake/.*skeleton.*/")
    if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/openvpn3") # Check if OVPN3 source exists
        FIND_PACKAGE(SWIG 3.0) # Make SWIG find optional
        if(NOT SWIG_FOUND)
            message(WARNING "SWIG 3.0 not found. OpenVPN 3 Java bindings (libovpn3.so) will not be built.")
        else()
            message(STATUS "SWIG found: ${SWIG_EXECUTABLE}. Building OpenVPN 3 core.")
            add_custom_command(OUTPUT "ovpncli_wrap.cxx"
                    COMMAND ${CMAKE_COMMAND} -E make_directory ovpn3
                    COMMAND ${SWIG_EXECUTABLE} -outdir ovpn3
                    -c++
                    -java -package net.openvpn.ovpn3
                    -outcurrentdir
                    -DOPENVPN_PLATFORM_ANDROID
                    -I${CMAKE_CURRENT_SOURCE_DIR}/openvpn3/client
                    -I${CMAKE_CURRENT_SOURCE_DIR}/openvpn3
                    "${CMAKE_CURRENT_SOURCE_DIR}/openvpn3/client/ovpncli.i") # Quoted path

            set(ovpn3_SRCS
                    openvpn3/client/ovpncli.cpp
                    openvpn3/openvpn/openssl/xkey/xkey_provider.c
                    openvpn3/openvpn/openssl/xkey/xkey_helper.c
                    openvpn3/openvpn/crypto/data_epoch.cpp
                    ovpncli_wrap.cxx)

            add_library(ovpn3 SHARED ${ovpn3_SRCS})

            target_include_directories(ovpn3 PUBLIC
                    ${CMAKE_CURRENT_SOURCE_DIR}/openvpn3
                    ${CMAKE_CURRENT_SOURCE_DIR}/openvpn3/client)
            # Conditionally add include directories if sources exist
            if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/lzo/include")
                target_include_directories(ovpn3 PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/lzo/include)
            endif()
            if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/asio/asio/include")
                target_include_directories(ovpn3 PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/asio/asio/include)
            endif()
            if(NOT ${OPENVPN3OSSL} AND EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/mbedtls/include")
                target_include_directories(ovpn3 PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/mbedtls/include)
            endif()


            if (${OPENVPN3OSSL})
                target_compile_definitions(ovpn3 PRIVATE -DUSE_OPENSSL)
                # These 'crypto' and 'ssl' are NDK system libraries.
                # lzo and lz4 are other optional dependencies.
                target_link_libraries(ovpn3 PRIVATE crypto ssl lzo lz4)
            else ()
                target_compile_definitions(ovpn3 PRIVATE -DUSE_MBEDTLS)
                target_link_libraries(ovpn3 PRIVATE mbedtls mbedx509 mbedcrypto lzo lz4)
            endif ()

            target_compile_definitions(ovpn3 PRIVATE
                    -DHAVE_CONFIG_H # Assuming config.h is generated appropriately for ovpn3
                    -DHAVE_LZO # If lzo is available and linked
                    -DHAVE_LZ4 # If lz4 is available and linked
                    -DASIO_STANDALONE
                    -DUSE_ASIO
                    -DOPENVPN_CORE_GIT_VERSION=\"${OPENVPN3_GIT}\"
                    -DOPENVPN_SHOW_SESSION_TOKEN
                    -DOPENSSL_API_COMPAT=0x10200000L # Adjust if targeting newer OpenSSL for OVPN3
                    -DOPENVPN_ALLOW_INSECURE_CERTPROFILE
                    -DENABLE_EXTERNAL_PKI
            )
        endif() # End SWIG_FOUND
    else()
        message(STATUS "OpenVPN 3 source directory not found. Skipping libovpn3.so build.")
    endif() # End EXISTS openvpn3
else ()
    message(STATUS "Skeleton build detected. Skipping OpenVPN 3 core (libovpn3.so) build.")
endif () # End NOT skeleton build

# --- Utility Libraries (ovpnutil, osslutil) ---
# These are generally kept as they might be used by the Java layer for various tasks.
# They link against NDK's log, crypto, and ssl, which is fine.

# ovpnutil: JNI glue, version info
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/ovpnutil/jniglue.c")
    add_library(ovpnutil SHARED ovpnutil/jniglue.c)
    target_compile_definitions(ovpnutil PRIVATE -DTARGET_ARCH_ABI=\"${ANDROID_ABI}\"
            -DOPENVPN2_GIT_REVISION=\"${OPENVPN2_GIT}\" # Uses potentially stale OVPN2_GIT
            -DOPENVPN3_GIT_REVISION=\"${OPENVPN3_GIT}\"
    )
    target_link_libraries(ovpnutil PRIVATE log) # Link against Android log library
else()
    message(WARNING "ovpnutil/jniglue.c not found. Skipping ovpnutil build.")
endif()

# osslutil: OpenSSL utility functions (likely for interacting with NDK OpenSSL)
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/ovpnutil/osslutil.cpp")
    add_library(osslutil SHARED ovpnutil/osslutil.cpp)
    target_link_libraries(osslutil PRIVATE log crypto ssl) # Links NDK OpenSSL
else()
    message(WARNING "ovpnutil/osslutil.cpp not found. Skipping osslutil build.")
endif()

# osslspeedtest: Only if not a skeleton build
if (NOT CMAKE_LIBRARY_OUTPUT_DIRECTORY MATCHES "build/intermediates/cmake/.*skeleton.*/")
    if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/ovpnutil/sslspeed.c")
        add_library(osslspeedtest SHARED ovpnutil/sslspeed.c)
        target_link_libraries(osslspeedtest PRIVATE log crypto ssl) # Links NDK OpenSSL
    else()
        message(STATUS "ovpnutil/sslspeed.c not found. Skipping osslspeedtest build.")
    endif()
else ()
    message(STATUS "Skeleton build. Skipping SSLSpeedTest build.")
endif ()


# -----------------------------------------------------------------------------
# --- BEGIN MODIFICATION: Disable ics-openvpn's internal OpenVPN 2.x build ---
# -----------------------------------------------------------------------------
# The following sections for building 'libopenvpn.so' (from openvpn_srcs)
# and 'pie_openvpn.${ANDROID_ABI}' (the executable) are now COMMENTED OUT.
# We will use the pre-built PQC-enabled 'openvpn' executable from jniLibs.

# message(STATUS "Internal OpenVPN 2.x build (libopenvpn, pie_openvpn) is DISABLED in this CMakeLists.txt.")

# set(openvpn_srcs
#         src/compat/compat-basename.c
#         # ... MANY .c files from original list ...
#         src/openvpn/compstub.c
#         )

# PREPEND(openvpn_srcs_with_path "openvpn" ${openvpn_srcs}) # Helper macro from tools.cmake

# add_library(openvpn SHARED ${openvpn_srcs_with_path})

# target_include_directories(openvpn PRIVATE
#         openvpn-config # This might be a generated config dir
#         openvpn/src/compat
#         openvpn/include
#         # mbedtls/include # If OPENVPN2MBED was ON
#         # lzo/include     # If lzo was built
#         openvpn # Assuming this path contains necessary headers for openvpn_srcs
#         )
# if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/mbedtls/include")
#     target_include_directories(openvpn PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/mbedtls/include)
# endif()
# if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/lzo/include")
#     target_include_directories(openvpn PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/lzo/include)
# endif()


# target_compile_definitions(openvpn PRIVATE
#         -DHAVE_CONFIG_H # This would come from ./configure of the OpenVPN 2.x source
#         -DCONFIGURE_GIT_REVISION=\"${OPENVPN2_GIT}\"
#         -DCONFIGURE_GIT_FLAGS=\"\"
#         -DTARGET_ABI=\"${ANDROID_ABI}\"
#         -DOPENSSL_API_COMPAT=0x11000000L # Example, might need adjustment
#         )

# if (${OPENVPN2MBED})
#     target_compile_definitions(openvpn PRIVATE -DENABLE_CRYPTO_MBEDTLS=1)
#     target_link_libraries(openvpn PRIVATE mbedtls mbedx509 mbedcrypto lzo lz4)
# else () # Default is OpenSSL
#     target_compile_definitions(openvpn PRIVATE -DENABLE_CRYPTO_OPENSSL=1)
#     target_link_libraries(openvpn PRIVATE crypto ssl lzo lz4) # Links NDK OpenSSL
# endif ()

# add_executable(libovpnexec.so minivpn/minivpn.c) # Older name, probably not used
# target_compile_options(libovpnexec.so PRIVATE -fPIE)
# target_link_libraries(libovpnexec.so PRIVATE openvpn -fPIE -pie)

# add_executable(pie_openvpn.${ANDROID_ABI} minivpn/minivpn.c)
# target_compile_options(pie_openvpn.${ANDROID_ABI} PRIVATE -fPIE)
# target_link_libraries(pie_openvpn.${ANDROID_ABI} PRIVATE openvpn -fPIE -pie) # Links the 'openvpn' library target defined above

# Hack to copy OpenVPN binaries to assets directory (No longer needed for pie_openvpn)
# SET(OVPN_ASSET_DIR ${CMAKE_SOURCE_DIR}/../../../build/ovpnassets)
# add_custom_target(makeassetdir ALL
#         COMMAND ${CMAKE_COMMAND} -E make_directory ${OVPN_ASSET_DIR})
# add_custom_command(TARGET pie_openvpn.${ANDROID_ABI} POST_BUILD
#         COMMAND
#         ${CMAKE_COMMAND} -E copy
#         $<TARGET_FILE:pie_openvpn.${ANDROID_ABI}>
#         ${OVPN_ASSET_DIR}
#         )

# Hack that these targets are really executed
# The ovpnutil target still exists and should be built.
# If it previously depended on pie_openvpn, that dependency must be removed or re-evaluated.
# It's unlikely ovpnutil *needs* pie_openvpn to be built, more likely a build order hint.
# Let's remove dependencies on the now-disabled pie_openvpn target.
# add_dependencies(ovpnutil pie_openvpn.${ANDROID_ABI}) # REMOVE/COMMENT OUT
# add_dependencies(pie_openvpn.${ANDROID_ABI} makeassetdir) # REMOVE/COMMENT OUT

# ---------------------------------------------------------------------------
# --- END MODIFICATION: OpenVPN 2.x build disabled ---
# ---------------------------------------------------------------------------

# If ovpnutil was made to depend on pie_openvpn just to ensure build order or that something is built,
# and if ovpnutil is still desired, it can be listed as a dependency for another target or built independently.
# Typically, if a library is defined (add_library(ovpnutil ...)), Gradle/CMake will build it if it's
# part of the project's native modules list in build.gradle.

message(STATUS "CMakeLists.txt: Internal OpenVPN 2.x (libopenvpn, pie_openvpn) build is DISABLED.")
message(STATUS "The app will rely on 'openvpn' executable from jniLibs.")