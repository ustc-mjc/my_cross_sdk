rootProject.name = "my-cpp-sdk"
def projectRootDir = new File("@PROJECT_ROOT_DIR@")
def build_app = "@BUILD_ANDROID_APP@"

include ':cross'
project(":cross").projectDir = new File(projectRootDir, "sdk/java")

if (build_app in ["ON", "TRUE", "true"]) {
    println "include android app project"
    include ':cross_app'
    project(":cross_app").projectDir = new File(projectRootDir, "app/android")
}


