androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.database"

    room {
        enabled = true
    }
    hilt {
        enabled = true
    }

    dependencies {
        api(project(":core:model"))

        implementation("org.jetbrains.kotlinx:kotlinx-datetime:0.5.0")
    }

    testing {
        jacoco {
            enabled = true
        }

        dependencies {
            androidImplementation(project(":core:testing"))
            // TODO:DCL - Adding this to fix:
            // Classes that weren't resolved:
            //> androidx.compose.animation.tooling.ComposeAnimatedProperty
            //> com.google.common.util.concurrent.ListenableFuture
            androidImplementation("com.google.guava:listenablefuture:1.0")
            androidImplementation("androidx.compose.animation:animation:1.6.3")
            androidImplementation("androidx.window.extensions.core:core:1.0.0")
        }
    }
}

