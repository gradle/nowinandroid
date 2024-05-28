androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.datastore"

    // TODO: We really want to model a list of consumer proguard files here, but can't yet
    consumerProguardFile = "consumer-proguard-rules.pro"

    dependencies {
        api("androidx.datastore:datastore:1.0.0")
        api(project(":core:datastore-proto"))
        api(project(":core:model"))

        implementation(project(":core:common"))
    }

    hilt {}

    testing {
        dependencies {
            implementation(project(":core:datastore-test"))
            implementation("org.jetbrains.kotlinx:kotlinx-coroutines-test:1.8.0")
        }

        testOptions {
            returnDefaultValues = true
        }

        jacoco {}
    }
}
