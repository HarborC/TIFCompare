cmake_minimum_required(VERSION 3.0)

project(TIFCompare)

add_definitions(-w)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
SET(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(GDAL REQUIRED)
include_directories(
    ${GDAL_INCLUDE_DIRS} 
)
if(CGAL_FOUND)
    message(STATUS "Found GDAL")
    message(STATUS "  Module : ${GDAL_INCLUDE_DIRS}")
    message(STATUS "  Module : ${GDAL_LIBRARY}")
endif()

find_package(Qt5 COMPONENTS Core OpenGL Widgets)
if(Qt5_FOUND)
    message(STATUS "Found Qt")
    message(STATUS "  Module : ${Qt5Core_DIR}")
    message(STATUS "  Module : ${Qt5OpenGL_DIR}")
    message(STATUS "  Module : ${Qt5Widgets_DIR}")
endif()
include_directories(
    ${Qt5Core_INCLUDE_DIRS} 
    ${Qt5OpenGL_INCLUDE_DIRS} 
    ${Qt5Widgets_INCLUDE_DIRS}
)

include_directories("src")

qt5_wrap_ui(ui_FILES 
    ui/bandchoosedialog.ui
    ui/mainwindow.ui
)

file(GLOB Files
  "src/*.h"
  "src/*.cc"
  "src/*.cpp"
  "src/*.hpp"
)

add_library(${PROJECT_NAME} SHARED
  ${Files}
  ${ui_FILES}
)

target_link_libraries(${PROJECT_NAME}
    ${Qt5Core_LIBRARIES} 
    ${Qt5OpenGL_LIBRARIES} 
    ${Qt5Widgets_LIBRARIES}
    ${GDAL_LIBRARY} 
)

add_executable(main main.cpp)
target_link_libraries(main ${PROJECT_NAME})