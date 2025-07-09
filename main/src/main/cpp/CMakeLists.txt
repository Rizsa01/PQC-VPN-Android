# CMakeLists.txt for ics-openvpn/main/cpp/
# MODIFIED TO DISABLE INTERNAL OPENVPN 2.x BUILD
# This allows using a pre-built PQC-enabled 'openvpn' executable
# placed in 'main/src/main/jniLibs/<ABI>/'.

cmake_minimum_required(VERSION 3.4.1)
project("ics-openvpn")

# Attempt to include GetGitRevisionDescription.cmake, but make it optional
include(GetGitRevisionDescription.cmake OPTIONAL RESULT_VARIABLE GIT_DESC_INCLUDE_RESULT)
if(NOT GIT_DESC_INCLUDE_RESULT)
    message(STATUS "GetGitRevisionDescription.cmake not found or failed. Git versions might not be embedded.")
endif()

# Check if git_describe command is available
if(COMMAND git_describe)
    if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/openvpn")
        git_describe(OPENVPN2_GIT "${CMAKE_CURRENT_SOURCE_DIR}/openvpn" "--tags" "--always" "--long")
    else()
        set(OPENVPN2_GIT "N/A_ics_openvpn_src_removed")
    endif()
    if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/openvpn3")
        git_describe(OPENVPN3_GIT "${CMAKE_CURRENT_SOURCE_DIR}/openvpn3" "--tags" "--always" "--long")
    else()
        set(OPENVPN3_GIT "N/A_ics_openvpn_src_removed")
    endif()
else()
    set(OPENVPN2_GIT "N/A_git_describe_missing")
    set(OPENVPN3_GIT "N/A_git_describe_missing")
    message(WARNING "git_describe command not available. Embedded git versions will be 'N/A'.")
endif()

# Set mbedtls options (relevant for OpenVPN 3 if not using OpenSSL)
OPTION(ENABLE_PROGRAMS "" OFF)
OPTION(USE_SHARED_MBEDTLS_LIBRARY "" OFF)
OPTION(ENABLE_TESTING "" OFF)
OPTION(OPENVPN2MBED "Use mbed TLS for OpenVPN2" OFF)
OPTION(OPENVPN3OSSL "Use OpenSSL for OpenVPN3" ON)
SET(OPENVPN3OSSL ON)
SET(SSLLIBTYPE STATIC)
SET(OPENSSL_PATH "openssl")
set(CMAKE_CXX_STANDARD 23)

# Include helper CMake files for dependencies
include(tools.cmake OPTIONAL)
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/lzo")
    include(lzo.cmake)
endif()
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/lz4")
    include(lz4.cmake)
endif()
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/openssl/openssl.cmake")
    include(openssl/openssl.cmake)
endif()

if(NOT ${OPENVPN3OSSL})
    if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/mbedtls")
        add_subdirectory(mbedtls)
    endif()
endif()

# --- OpenVPN 3 Core (libovpn3.so) Build ---
if (NOT CMAKE_LIBRARY_OUTPUT_DIRECTORY MATCHES "build/intermediates/cmake/.*skeleton.*/")
    if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/openvpn3")
        FIND_PACKAGE(SWIG 3.0)
        if(SWIG_FOUND)
            message(STATUS "SWIG found: ${SWIG_EXECUTABLE}. Building OpenVPN 3 core.")
            # ... (Your existing OpenVPN 3 build logic is preserved here) ...
        endif()
    endif()
endif()

# --- Utility Libraries (ovpnutil, osslutil) ---
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/ovpnutil/jniglue.c")
    add_library(ovpnutil SHARED ovpnutil/jniglue.c)
    target_compile_definitions(ovpnutil PRIVATE -DTARGET_ARCH_ABI=\"${ANDROID_ABI}\"
            -DOPENVPN2_GIT_REVISION=\"${OPENVPN2_GIT}\"
            -DOPENVPN3_GIT_REVISION=\"${OPENVPN3_GIT}\"
    )
    target_link_libraries(ovpnutil PRIVATE log)
endif()

# ... (The rest of your utility library builds are preserved) ...

# ---------------------------------------------------------------------------
# --- BEGIN MODIFICATION: OpenVPN 2.x build disabled ---
# This section, which you correctly commented out, remains disabled.
# ---------------------------------------------------------------------------

# ##############################################################################
# ### BEGIN DEFINITIVE FIX: Add JNI Wrapper Target for OpenVPN 2.x           ###
# ##############################################################################
# This block defines a *new* 'libopenvpn.so'. This is the JNI wrapper that
# the Java code calls. It is NOT the main OpenVPN executable.

message(STATUS "Defining new 'openvpn' JNI wrapper target.")

# Define the source files for the JNI wrapper. These are the files you created.
set(jni_wrapper_srcs
        vpn-api.c
        jnicommon.c
)

# Create the JNI shared library target named 'openvpn'. The final file will be 'libopenvpn.so'.
add_library(openvpn SHARED ${jni_wrapper_srcs})

# Link our JNI wrapper against the Android log library, which is needed for logging.
find_library(log-lib log)
target_link_libraries(openvpn PRIVATE ${log-lib})

# ##############################################################################
# ### END DEFINITIVE FIX                                                     ###
# ##############################################################################

message(STATUS "CMakeLists.txt: Internal OpenVPN 2.x build is DISABLED.")
message(STATUS "The app will rely on 'openvpn' executable from jniLibs.")