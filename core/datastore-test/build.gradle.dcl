androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.datastore.test"

    hilt {
        enabled = true
    }

    dependencies {
        implementation("com.google.dagger:hilt-android-testing:2.51")
        implementation(project(":core:common"))
        implementation(project(":core:datastore"))
    }
}
