androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.common"

    hilt {
        enabled = true
    }

    testing {
        jacoco {
            enabled = true
        }

        dependencies {
            implementation("org.jetbrains.kotlinx:kotlinx-coroutines-test:1.7.3")
            implementation("app.cash.turbine:turbine:1.0.0")
        }
    }
}
