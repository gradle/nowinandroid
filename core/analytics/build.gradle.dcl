androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.analytics"

    compose {
        enabled = true
    }

    hilt {
        enabled = true
    }

    dependencies {
        implementation("androidx.compose.runtime:runtime")

        // TODO:DCL These were Prod-Only deps, but we don't have product flavors yet
        // implementation(platform("com.google.firebase:firebase-bom:32.4.0")) // TODO:DCL This was a platform dep
        implementation("com.google.firebase:firebase-analytics-ktx:21.4.0") // TODO:DCL - This is the version from the platform
    }
}