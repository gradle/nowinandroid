/*
 * Copyright 2022 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import com.android.build.api.dsl.ApplicationBuildType
import com.android.build.api.dsl.CommonExtension

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
            minify {
                enabled = true
            }

            defaultProguardFile {
                name = "proguard-android-optimize.txt"
            }
            proguardFile {
                name = "proguard-rules.pro"
            }

            baselineProfile {
                // Ensure Baseline Profile is fresh for release builds.
                automaticGenerationDuringBuild = true
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

            implementation(project(":ui-test-hilt-manifest"))

            androidImplementation(project(":core:testing"))
            androidImplementation(project(":core:data-test"))
            androidImplementation(project(":core:datastore-test"))
            androidImplementation("androidx.test.espresso:espresso-core:3.5.1")
            androidImplementation("androidx.navigation:navigation-testing:2.7.4")
            androidImplementation("androidx.compose.ui:ui-test-junit4:1.7.0-alpha05")
            androidImplementation("com.google.dagger:hilt-android-testing:2.51")

        }
    }
}

val android: CommonExtension<*, *, *, *, *, *> = extensions.getByType(CommonExtension::class)
android.packaging {
    resources {
        excludes.add("/META-INF/{AL2.0,LGPL2.1}")
    }
}
afterEvaluate {
    // To publish on the Play store a private signing key is required, but to allow anyone
    // who clones the code to sign and run the release variant, use the debug signing key.
    android.buildTypes {
        val release: ApplicationBuildType = getByName("release") as ApplicationBuildType
        release.signingConfig = android.signingConfigs.named("debug").get()
    }
}
