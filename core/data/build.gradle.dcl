androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.data"

    includeKotlinSerialization = true
    configureJacoco = true

    dependencies {
        api(projects.core.common)
        api(projects.core.database)
        api(projects.core.datastore)
        api(projects.core.network)

        implementation(projects.core.analytics)
        implementation(projects.core.notifications)

        testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-test:1.7.3")
        testImplementation(projects.core.datastoreTest)
        testImplementation(projects.core.testing)
        testImplementation(projects.core.network)
    }

    testOptions {
        includeAndroidResources = true
        returnDefaultValues = true
    }

    buildTypes {
        // Need the empty closure to avoid "dangling pure expression" error
        debug {}
        release {}
    }
}