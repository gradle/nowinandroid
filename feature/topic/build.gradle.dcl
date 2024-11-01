androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.feature.topic"

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
