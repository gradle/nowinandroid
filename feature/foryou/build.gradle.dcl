androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.feature.foryou"
    
    feature {
        enabled = true
    }
    compose {
        enabled = true
    }
    
    dependencies {
        implementation("com.google.accompanist:accompanist-permissions:0.34.0")
        implementation(project(":core:data"))
        implementation(project(":core:domain"))
    }
    
    testing {
        jacoco {
            enabled = true
        }
        roborazzi {
            enabled = true
        }
        
        dependencies {
            implementation("com.google.dagger:hilt-android-testing:2.51")
            implementation("org.robolectric:robolectric:4.11.1")
            implementation(project(":core:testing"))
            implementation(project(":core:screenshot-testing"))

            // TODO:DCL - Was just for Demo flavor
            implementation("io.github.takahirom.roborazzi:roborazzi:1.7.0")

            androidImplementation(project(":core:testing"))
        }
    }
}
