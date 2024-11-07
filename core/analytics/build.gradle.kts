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
    }
}

afterEvaluate {
    // Platforms and Flavor-specific deps not available in DCL files yet, add them after project is ready
    dependencies {
        add("prodImplementation", platform(libs.firebase.bom))
        add("prodImplementation", libs.firebase.analytics)
    }
}