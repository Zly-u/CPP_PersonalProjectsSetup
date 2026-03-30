########################################################################################################################
# Checking if VCPKG is installed on the system.
########################################################################################################################

include_guard(GLOBAL)

# Check if we can find variable/exe
find_program(VCPKG_EXECUTABLE vcpkg)
set(VCPKG_AVAILABLE FALSE)
if(DEFINED ENV{VCPKG_ROOT})
	message(STATUS "[CHECKS] - [OK] vcpkg path found at: $ENV{VCPKG_ROOT}")
elseif (VCPKG_EXECUTABLE)
	message(STATUS "[CHECKS] - [OK] vcpkg.exe found at: ${VCPKG_EXECUTABLE}")
else()
	message(STATUS "[CHECKS] - [ERROR] vcpkg not found (env variable \"VCPKG_ROOT\" is not set nor could find its Executable)")
	set(VCPKG_AVAILABLE FALSE)
endif()

# Check if toolchains are available
if(DEFINED ENV{VCPKG_ROOT} OR VCPKG_EXECUTABLE)
	if(DEFINED CMAKE_TOOLCHAIN_FILE AND CMAKE_TOOLCHAIN_FILE MATCHES "vcpkg")
		message(STATUS "[CHECKS] - [OK] vcpkg toolchain detected: ${CMAKE_TOOLCHAIN_FILE}")
		set(VCPKG_AVAILABLE TRUE)
	endif()
endif()

# Install vcpkg for the user.
if(VCPKG_AVAILABLE)
	message(STATUS "[CHECKS] - [OK] vcpkg is available.")
else()
	message(SEND_ERROR "[CHECKS] - [ERROR] vcpkg is NOT available...")
	return()
endif()