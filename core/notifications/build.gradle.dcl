androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.notifications"

    hilt {
        enabled = true
    }

    dependencies {
        api(project(":core:model"))

        implementation(project(":core:common"))

        // compileOnly(platform(libs.androidx.compose.bom)) TODO:DCL - This was a platform dep
        compileOnly("androidx.compose.runtime:runtime:1.6.3") // TODO:DCL - This is the version from the platform
    }
}