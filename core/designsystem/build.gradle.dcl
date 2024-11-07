androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.designsystem"

    compose {
        enabled = true
    }

    dependencies {
        lintPublish(project(":lint"))

        api("androidx.compose.foundation:foundation")
        api("androidx.compose.foundation:foundation-layout")
        api("androidx.compose.material:material-icons-extended:1.6.3")
        api("androidx.compose.material3:material3:1.2.1")
        api("androidx.compose.runtime:runtime")
        api("androidx.compose.ui:ui-util")

        implementation("io.coil-kt:coil-compose:2.6.0")
    }

    testing {
        jacoco {
            enabled = true
        }

        roborazzi {
            enabled = true
        }

        testOptions {
            testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        }

        dependencies {
            implementation("androidx.compose.ui:ui-test-manifest:1.7.0-alpha05")
            implementation("androidx.compose.ui:ui-test-junit4")
            implementation("com.google.dagger:hilt-android-testing:2.51")
            implementation("org.robolectric:robolectric:4.12.2")
            implementation("io.github.takahirom.roborazzi:roborazzi:1.7.0")

            implementation(project(":core:screenshot-testing"))
            implementation(project(":core:testing"))


            androidImplementation("androidx.compose.ui:ui-test-manifest:1.7.0-alpha05")
            androidImplementation("androidx.compose.ui:ui-test-junit4")
            androidImplementation(project(":core:testing"))
        }
    }
}