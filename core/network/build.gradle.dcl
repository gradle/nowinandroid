androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.network"

    buildConfig = true

    hilt {
        enabled = true
    }

    kotlinSerialization {
        enabled = true
    }

    secrets {
        enabled = true
        defaultPropertiesFileName = "secrets.defaults.properties"
    }

    dependencies {
        api("org.jetbrains.kotlinx:kotlinx-datetime:0.5.0")
        api(project(":core:common"))
        api(project(":core:model"))

        implementation("io.coil-kt:coil:2.6.0")
        implementation("io.coil-kt:coil-svg:2.6.0")
        implementation("com.squareup.okhttp3:logging-interceptor:4.12.0")
        implementation("com.squareup.retrofit2:retrofit:2.9.0")
        implementation("com.jakewharton.retrofit:retrofit2-kotlinx-serialization-converter:1.0.0")
    }

    testing {
        testOptions {
            includeAndroidResources = true
        }

        dependencies {
            implementation("org.jetbrains.kotlinx:kotlinx-coroutines-test:1.8.0")
        }
    }
}
