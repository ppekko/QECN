cmake_minimum_required(VERSION 3.9)
project(app)

add_subdirectory(QECN/Vendor/glad)
find_package(SDL2 REQUIRED)


execute_process(COMMAND ./fetchNuklear.sh
                WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})


if(MSVC)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")
else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall  -Wextra -Wpedantic -std=c++11 -fomit-frame-pointer")
    if(NOT WIN32)
        set(GLAD_LIBRARIES dl)
    endif()
endif()

include_directories(QECN/Headers/
                    QECN/Nuklear/
                    QECN/Vendor/glad/)



file(GLOB PROJECT_HEADERS QECN/Headers/*.hpp)
file(GLOB PROJECT_SOURCES QECN/Sources/*.cpp)
file(GLOB PROJECT_CONFIGS CMakeLists.txt
                          Readme.md
                         .gitattributes
                         .gitignore
                         .gitmodules)

source_group("Headers" FILES ${PROJECT_HEADERS})
source_group("Sources" FILES ${PROJECT_SOURCES})

add_definitions(-DGLFW_INCLUDE_NONE
                -DPROJECT_SOURCE_DIR=\"${PROJECT_SOURCE_DIR}\")

add_executable(${PROJECT_NAME} ${PROJECT_SOURCES} ${PROJECT_HEADERS}
                               ${PROJECT_SHADERS} ${PROJECT_CONFIGS}
                               ${VENDORS_SOURCES} )



target_link_libraries(${PROJECT_NAME}  glad SDL2 -lm -lc
                      ${GLFW_LIBRARIES} ${GLAD_LIBRARIES})

