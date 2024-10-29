androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.data"

    hilt {
        enabled = true
    }
    kotlinSerialization {
        enabled = true
    }

    dependencies {
        api(project(":core:common"))
        api(project(":core:database"))
        api(project(":core:datastore"))
        api(project(":core:network"))

        implementation(project(":core:analytics"))
        implementation(project(":core:notifications"))
    }


    testing {
        jacoco {
            enabled = true
        }

        testOptions {
            includeAndroidResources = true
            returnDefaultValues = true
        }

        dependencies {
            implementation("org.jetbrains.kotlinx:kotlinx-coroutines-test:1.7.3")
            implementation(project(":core:datastore-test"))
            implementation(project(":core:testing"))
        }
    }
}
