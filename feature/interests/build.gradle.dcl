androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.feature.interests"

    feature {
        enabled = true
    }
    compose {
        enabled = true
    }

    dependencies {
        implementation(project(":core:data"))
        implementation(project(":core:domain"))
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