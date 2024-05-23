androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.database"

    dependencies {
        api(project(":core:model"))

        implementation("org.jetbrains.kotlinx:kotlinx-datetime:0.5.0")
    }

    room {}
    hilt {}

    testing {
        dependencies {
            androidImplementation(project(":core:testing"))
        }

        jacoco {}
    }
}

