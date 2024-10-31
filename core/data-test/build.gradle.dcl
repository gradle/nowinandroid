androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.data.test"

    hilt {
        enabled = true
    }

    dependencies {
        api(project(":core:data"))

        implementation("com.google.dagger:hilt-android-testing:2.51")
    }
}
