androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.feature.settings"

    feature {
        enabled = true
    }
    compose {
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

            androidImplementation(project(":core:testing"))
        }
    }
}