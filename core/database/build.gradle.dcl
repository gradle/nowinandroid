androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.database"

    room {
        enabled = true
    }
    hilt {
        enabled = true
    }

    dependencies {
        api(project(":core:model"))

        implementation("org.jetbrains.kotlinx:kotlinx-datetime:0.5.0")
    }

    testing {
        jacoco {
            enabled = true
        }

        dependencies {
            androidImplementation(project(":core:testing"))
        }
    }
}

