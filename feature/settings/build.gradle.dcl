androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.feature.settings"

    feature {
        enabled = true
    }
    compose {
        enabled = true
    }
    hilt {
        enabled = true
    }

    dependencies {
        implementation("androidx.appcompat:appcompat:1.6.1")
        implementation("com.google.android.gms:play-services-oss-licenses:17.0.1")
        implementation(project(":core:data"))
    }

    testing {
        jacoco {
            enabled = true
        }

        dependencies {
            implementation(project(":core:testing"))

            androidImplementation("androidx.compose.ui:ui-test-manifest:1.7.0-alpha05")
            androidImplementation(project(":core:testing"))
        }
    }
}