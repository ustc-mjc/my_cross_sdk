rootProject.name = 'cpp-android-ios-example'

def rootDir = new File("@PROJECT_ROOT_DIR@")

include ":cross"
project(":cross").projectDir = new File(rootDir, "sdk/android")
include ":app"
project(":app").projectDir = new File(rootDir, "app/android")