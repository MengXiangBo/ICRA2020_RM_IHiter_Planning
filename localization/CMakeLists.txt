cmake_minimum_required(VERSION 3.5)
project(localization)

set(CMAKE_C_FLAGS_RELEASE  "${CMAKE_C_FLAGS_RELEASE} -Wall -O3 -march=native")
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -Wall -pg -march=native")

set(CMAKE_CXX_FLAGS_RELEASE   "${CMAKE_CXX_FLAGS_RELEASE} -Wall -O3 -march=native")
set(CMAKE_CXX_FLAGS_DEBUG    "${CMAKE_CXX_FLAGS_DEBUG} -Wall -pg -march=native")

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib)

set(CMAKE_CXX_STANDARD 11)

find_package(Eigen3)
find_package(OpenCV REQUIRED)
find_package(PCL REQUIRED COMPONENTS common io registration)
find_package(Boost REQUIRED)

set(LOCALIZATION_SRC
        laser_map.cpp
        laser_map.h
        nnmap.cpp
        nnmap.h
        localization.cpp
        localization.h
        particle_filter.cpp
        particle_filter.h
        )

add_library(Localization SHARED
        ${LOCALIZATION_SRC}
        )

include_directories(${PCL_INCLUDE_DIRS} ${Boost_INCLUDE_DIRS} ${OpenCV_INCLUDE_DIRS} ${Eigen3_INCLUDE_DIRS})
add_executable(${PROJECT_NAME} nnmap.cpp nnmap.h test.cpp particle_filter.h particle_filter.cpp laser_map.h laser_map.cpp localization.h localization.cpp)
target_link_libraries(${PROJECT_NAME} ${OpenCV_LIBS} ${PCL_COMMON_LIBRARIES} /usr/lib/x86_64-linux-gnu/libboost_system.so
        /usr/lib/x86_64-linux-gnu/libboost_thread.so ${Boost_LIBRARIES}
        ${PCL_IO_LIBRARIES} ${PCL_REGISTRATION_LIBRARIES})
