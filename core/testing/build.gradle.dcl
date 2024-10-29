androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.testing"

    compose {
        enabled = true
    }

    hilt {
        enabled = true
    }

    dependencies {
        // TODO:DCL - api(kotlin("test"))
        api("androidx.compose.ui:ui-test-junit4:1.7.0-alpha06")

        api(project(":core:analytics"))
        api(project(":core:data"))
        api(project(":core:model"))
        api(project(":core:notifications"))

        implementation("androidx.test:rules:1.5.0")
        implementation("com.google.dagger:hilt-android-testing:2.51")
        implementation("org.jetbrains.kotlinx:kotlinx-coroutines-test:1.8.0")
        implementation("org.jetbrains.kotlinx:kotlinx-datetime:0.5.0")
        implementation(project(":core:common"))
        implementation(project(":core:designsystem"))
    }

    buildTypes {
        debug {
            dependencies {
                api("androidx.compose.ui:ui-test-manifest")
            }
        }
    }
}