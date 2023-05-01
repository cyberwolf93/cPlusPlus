
add_library(MathLib mysqrt.cpp)

target_include_directories(MathLib INTERFACE ${CMAKE_CURRENT_SOURCE_DIR} )
target_link_libraries(MathLib tutorial_compiler_flags)

include(CheckCXXSourceCompiles)
check_cxx_source_compiles("
    #include <cmath>
    int main() {
        std::log(1.0);
        return 0;
    }
" HAVE_LOG)

check_cxx_source_compiles("
    #include <cmath>
    int main() {
        std::exp(1.0);
        return 0;
    }
" HAVE_EXP)

if(HAVE_LOG AND HAVE_EXP)
    target_compile_definitions(MathLib PRIVATE "HAVE_LOG" "HAVE_EXP")
endif()

set(installable_libs MathLib tutorial_compiler_flags)
install(TARGETS ${installable_libs} DESTINATION lib)
install(FILES MathFunctions.h DESTINATION include)