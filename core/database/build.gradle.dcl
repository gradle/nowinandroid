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
            androidImplementation("org.jetbrains.kotlin:kotlin-test:2.0.21")

            androidImplementation("androidx.test:core:1.5.0")
            androidImplementation("androidx.test:runner:1.5.2")
            androidImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-test:1.8.0")
        }
    }
}

