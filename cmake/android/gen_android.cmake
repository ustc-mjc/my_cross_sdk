if(NOT GEN_ANDROID)
  return()
endif()
# copy gradle wrapper
# file(COPY ${PROJECT_CMAKE_DIR}/android/gradle/wrapper/gradle-wrapper.jar
#      DESTINATION ${CMAKE_BINARY_DIR}/gradle/wrapper)
file(
  COPY ${PROJECT_CMAKE_DIR}/android/gradle/wrapper/gradle-wrapper.properties
  DESTINATION ${CMAKE_BINARY_DIR}/gradle/wrapper)
file(COPY ${PROJECT_CMAKE_DIR}/android/gradlew
     DESTINATION ${CMAKE_BINARY_DIR})
file(COPY ${PROJECT_CMAKE_DIR}/android/gradlew.bat
     DESTINATION ${CMAKE_BINARY_DIR})

configure_file(${PROJECT_CMAKE_DIR}/settings.gradle.cmake ${CMAKE_BINARY_DIR}/settings.gradle @ONLY)
