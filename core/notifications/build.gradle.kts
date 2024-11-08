androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.notifications"

    hilt {
        enabled = true
    }

    dependencies {
        api(project(":core:model"))

        implementation(project(":core:common"))
    }
}

// DCL does not support platform dependencies yet
dependencies {
    add("compileOnly", platform(libs.androidx.compose.bom))
    add("compileOnly", "androidx.compose.runtime:runtime")
}
