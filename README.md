# My personal configurations

My configuration files.

```
Root
├── .clang-format           -
├── .clang-tidy             -
├── .gitignore              -
├── CLionCPP_CodeStyle.xml  -
├── CMakePresets.json       - Cross IDE compatible CMake configurations,
│                             least between CLion and VS.
└───cmake
    ├── BuildConfig.cmake   -
    ├── Compilers.cmake     -
    ├── GlobalDefines.cmake -
    ├── VcpkgCheck.cmake    - My lil script for checking if VCPKG is set up in the system.
    │
    └───libs
            ImGUI.cmake     - A lil set of functions for setting up ImGUI,
                              I prolly need to change it to proper CMake method.
```