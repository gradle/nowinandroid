androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.datastore"

    consumerProguardFile = "consumer-proguard-rules.pro"

    hilt {
        enabled = true
    }

    dependencies {
        api("androidx.datastore:datastore:1.0.0")
        api(project(":core:datastore-proto"))
        api(project(":core:model"))

        implementation(project(":core:common"))
    }

    testing {
        jacoco {
            enabled = true
        }

        testOptions {
            returnDefaultValues = true
        }

        dependencies {
            implementation(project(":core:datastore-test"))
            implementation("org.jetbrains.kotlinx:kotlinx-coroutines-test:1.8.0")
        }
    }
}
