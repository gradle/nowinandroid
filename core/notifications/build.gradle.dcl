androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.notifications"

    hilt {
        enabled = true
    }

    compose {
        enabled = true
    }

    dependencies {
        api(project(":core:model"))

        implementation(project(":core:common"))

        compileOnly("androidx.compose.runtime:runtime")
    }
}