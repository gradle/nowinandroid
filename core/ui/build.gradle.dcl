androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.ui"
    
    compose {
        enabled = true
    }
    
    dependencies {
        api("androidx.metrics:metrics-performance:1.0.0-alpha04")
        api(project(":core:analytics"))
        api(project(":core:designsystem"))
        api(project(":core:model"))
        
        implementation("androidx.browser:browser:1.8.0")
        implementation("io.coil-kt:coil:2.6.0")
        implementation("io.coil-kt:coil-compose:2.6.0")
    }
    
    testing {
        jacoco {
            enabled = true
        }

        testOptions {
            testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        }
        
        dependencies {
            androidImplementation("androidx.compose.ui:ui-test-manifest:1.7.0-alpha05")
            androidImplementation(project(":core:testing"))
        }
    }
}