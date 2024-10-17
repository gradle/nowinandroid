androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.designsystem"

    dependencies {
        lintPublish(project(":lint"))

        api("androidx.compose.foundation:foundation")
        api("androidx.compose.foundation:foundation-layout")
        api("androidx.compose.material:material-icons-extended")
        api("androidx.compose.material3:material3")
        api("androidx.compose.runtime:runtime")
        api("androidx.compose.ui:ui-util")

        implementation("io.coil-kt:coil-compose:2.6.0")
    }

    testing {
        testOptions {
            testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        }

        dependencies {
            implementation("androidx.compose.ui:ui-test-junit4")
            implementation("com.google.dagger:hilt-android-testing:2.51")
            implementation("org.robolectric:robolectric:4.11.1")
            implementation("io.github.takahirom.roborazzi:roborazzi:1.7.0")

            implementation(project(":core:screenshotTesting"))
            implementation(project(":core:testing"))

            androidImplementation("androidx.compose.ui:ui-test-junit4")
            androidImplementation(project(":core:testing"))
        }
    }
}