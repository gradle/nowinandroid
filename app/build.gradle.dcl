androidApplication {
    namespace = "com.google.samples.apps.nowinandroid"

    applicationId = "com.google.samples.apps.nowinandroid"
    versionCode = 8
    versionName = "0.1.2" // X.Y.Z; X = Major, Y = minor, Z = Patch level

    vectorDrawablesUseSupportLibrary = true

    compose {
        enabled = true
    }
    flavors {
        enabled = true
    }
    hilt {
        enabled = true
    }
    licenses {
        enabled = true
    }

    firebase {
        enabled = true
        version = "32.4.0"

        // Disable the Crashlytics mapping file upload. This feature should only be
        // enabled if a Firebase backend is available and configured in
        // google-services.json.
        mappingFileUploadEnabled = false
    }

    baselineProfile {
        enabled = true

        // Don't build on every iteration of a full assemble.
        // Instead enable generation directly for the release build variant.
        automaticGenerationDuringBuild = false

        dependencies {
            profile(project(":benchmarks"))
        }
    }

    dependencyGuard {
        enabled = true
        configurationName = "prodReleaseRuntimeClasspath"
    }

    dependencies {
        implementation(project(":feature:interests"))
        implementation(project(":feature:foryou"))
        implementation(project(":feature:bookmarks"))
        implementation(project(":feature:topic"))
        implementation(project(":feature:search"))
        implementation(project(":feature:settings"))

        implementation(project(":core:common"))
        implementation(project(":core:ui"))
        implementation(project(":core:designsystem"))
        implementation(project(":core:data"))
        implementation(project(":core:model"))
        implementation(project(":core:analytics"))
        implementation(project(":sync:work"))

        implementation("androidx.activity:activity-compose:1.8.0")
        implementation("androidx.compose.material3.adaptive:adaptive:1.0.0-alpha10")
        implementation("androidx.compose.material3.adaptive:adaptive-layout:1.0.0-alpha10")
        implementation("androidx.compose.material3.adaptive:adaptive-navigation:1.0.0-alpha10")
        implementation("androidx.compose.material3:material3-window-size-class")
        implementation("androidx.core:core-ktx:1.12.0")
        implementation("androidx.core:core-splashscreen:1.0.1")
        implementation("androidx.hilt:hilt-navigation-compose:1.2.0")
        implementation("androidx.lifecycle:lifecycle-runtime-compose:2.7.0")
        implementation("androidx.navigation:navigation-compose:2.7.4")
        implementation("androidx.profileinstaller:profileinstaller:1.3.1")
        implementation("androidx.tracing:tracing-ktx:1.3.0-alpha02")
        implementation("org.jetbrains.kotlinx:kotlinx-coroutines-guava:1.8.0")
        implementation("io.coil-kt:coil:2.6.0")
    }

    buildTypes {
        debug {
            applicationIdSuffix = ".debug"
            
            dependencies {
                implementation("androidx.compose.ui:ui-test-manifest")
                implementation(project(":ui-test-hilt-manifest"))
            }
        }

        release {
            // TODO:DCL doesn't support setting this to null
            // Is there any need to explicitly set this to null?
            // applicationIdSuffix = null

            minify {
                enabled = true
            }

            defaultProguardFile {
                name = "proguard-android-optimize.txt"
            }
            proguardFile {
                name = "proguard-rules.pro"
            }

            // TODO:DCL - Skiping converting signing for now
            // To publish on the Play store a private signing key is required, but to allow anyone
            // who clones the code to sign and run the release variant, use the debug signing key.
            // TODO:DCL Abstract the signing configuration to a separate file to avoid hardcoding this.
            // signingConfig = signingConfigs.named("debug")).get()

            baselineProfile {
                // Ensure Baseline Profile is fresh for release builds.
                automaticGenerationDuringBuild = true
            }

            // TODO:DCL - Why is this necessary?  Without it :app:compileDemoReleaseUnitTestKotlin
            // Can't find deps from the ui-test-hilt-manifest project.  But nowhere in the original
            // build were those deps added, except to debugImplementation.  What is the configuration
            // hierarchy in NiA, does the configuration used for this RELEASE compilation classpath
            // somehow extend the DEBUG compilation classpath?
            dependencies {
                implementation("androidx.compose.ui:ui-test-manifest")
                implementation(project(":ui-test-hilt-manifest"))
            }
        }
    }

    testing {
        jacoco {
            enabled = true
        }

        roborazzi {
            enabled = true
        }

        testOptions {
            // TODO:DCL - This was only for unit tests, we need to model different types of tests
            includeAndroidResources = true

            testInstrumentationRunner = "com.google.samples.apps.nowinandroid.core.testing.NiaTestRunner"
        }

        dependencies {
            implementation(project(":core:data-test"))
            implementation(project(":core:testing"))
            implementation("androidx.compose.ui:ui-test-junit4:1.7.0-alpha05")
            implementation("com.google.dagger:hilt-android-testing:2.51")

            // TODO:DCL - These were originally only dependencies of testDemoImplementation, but we haven't modeled Product Flavors yet
            implementation("org.robolectric:robolectric:4.12.2")
            implementation("io.github.takahirom.roborazzi:roborazzi:1.7.0")
            implementation(project(":core:screenshot-testing"))

            androidImplementation(project(":core:testing"))
            androidImplementation(project(":core:data-test"))
            androidImplementation(project(":core:datastore-test"))
            androidImplementation("androidx.test.espresso:espresso-core:3.5.1")
            androidImplementation("androidx.navigation:navigation-testing:2.7.4")
            androidImplementation("androidx.compose.ui:ui-test-junit4:1.7.0-alpha05")
            androidImplementation("com.google.dagger:hilt-android-testing:2.51")
        }
    }

    // TODO:DCL - Packaging
//    packaging {
//        resources {
//        excludes.add("/META-INF/{AL2.0,LGPL2.1}")
//        }
//    }
}
