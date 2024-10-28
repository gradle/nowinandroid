androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.screenshottesting"

    hilt {
        enabled = true
    }

    compose {
        enabled = true
    }

    dependencies {
        api("io.github.takahirom.roborazzi:roborazzi:1.7.0")

        implementation("androidx.activity:activity-compose:1.8.0")
        implementation("androidx.compose.ui:ui-test-junit4:1.7.0-alpha06")
        implementation("org.robolectric:robolectric:4.11.1")

        implementation(project(":core:common"))
        implementation(project(":core:designsystem"))
    }
}