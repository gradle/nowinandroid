androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.database"

    dependencies {
        api(project(":core:model"))

        implementation("org.jetbrains.kotlinx:kotlinx-datetime:0.5.0")
    }

    room {
        enabled = true
    }
    hilt {
        enabled = true
    }

    testing {
        dependencies {
            androidImplementation(project(":core:testing"))
        }

        jacoco {
            enabled = true
        }
    }
}

