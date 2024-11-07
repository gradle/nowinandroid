androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.sync"

    hilt {
        enabled = true
    }

    dependencies {
        implementation("androidx.tracing:tracing-ktx:1.3.0-alpha02")
        implementation("androidx.hilt:hilt-work:1.1.0")
        implementation("androidx.work:work-runtime-ktx:2.9.0")
        implementation(project(":core:analytics"))
        implementation(project(":core:data"))

        // TODO:DCL - No flavors yet, these used to be Prod-only
        //implementation(platform(libs.firebase.bom)) - TODO:DCL - This was a platform dep
        implementation("com.google.firebase:firebase-messaging-ktx:23.3.0") // TODO:DCL - This is the version from the platform
    }

    testing {
        jacoco {
            enabled = true
        }

        dependencies {
            androidImplementation("androidx.work:work-testing:2.9.0")
            androidImplementation("com.google.dagger:hilt-android-testing:2.51")
            androidImplementation(project(":core:testing"))
            androidImplementation("com.google.guava:guava:31.1-android") // For ListenableFuture
        }
    }
}