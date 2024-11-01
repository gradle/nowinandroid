androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.sync.test"

    hilt {
        enabled = true
    }

    dependencies {
        implementation("com.google.dagger:hilt-android-testing:2.51")
        implementation(project(":core:data"))
        implementation(project(":sync:work"))
    }
}
