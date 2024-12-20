/*
 * Copyright 2021 The Android Open Source Project
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

pluginManagement {
    // If you need to work with the latest, unpublished version of the Declrative Gradle prototype plugin
    // check it out into a `declarative-gradle` subdirectory (inside the root of this project) and uncomment the following line:
    // includeBuild("declarative-gradle/unified-prototype/unified-plugin")
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("org.gradle.experimental.android-ecosystem").version("0.1.30")
    id("org.gradle.experimental.kmp-ecosystem").version("0.1.30") // For the Kotlin JVM Library used by :lint
}

rootProject.name = "nowinandroid"

dependencyResolutionManagement {
    repositoriesMode = FAIL_ON_PROJECT_REPOS
    repositories {
        google()
        mavenCentral()
    }
}

defaults {
    androidApplication {
        jdkVersion = 17
        minSdk = 21
        targetSdk = 34
        compileSdk = 34

        lint {
            enabled = true
        }
    }

    androidLibrary {
        jdkVersion = 17
        minSdk = 21
        targetSdk = 34
        compileSdk = 34

        dependencies {
            implementation("androidx.tracing:tracing-ktx:1.3.0-alpha02")
        }

        kotlinSerialization {
            enabled = false
            jsonEnabled = true
        }

        room {
            enabled = false
            schemaDirectory = "schemas"
        }

        protobuf {
            enabled = false

            version = "3.25.2"
            generatedRootDir = "generated/source/proto"

            dependencies {
                protoc("com.google.protobuf:protoc:3.25.2")
            }
        }

        lint {
            enabled = true
            xmlReport = true
            checkDependencies = true
        }

        testing {
            jacoco {
                enabled = false
                version = "0.8.7"
            }

            testOptions {
                testInstrumentationRunner = "com.google.samples.apps.nowinandroid.core.testing.NiaTestRunner"
            }
        }
    }

    androidTest {
        jdkVersion = 17
        minSdk = 26
        compileSdk = 34
    }
}

enableFeaturePreview("TYPESAFE_PROJECT_ACCESSORS")
include(":app")
include(":app-nia-catalog")
include(":benchmarks")
include(":core:analytics")
include(":core:common")
include(":core:data")
include(":core:data-test")
include(":core:database")
include(":core:datastore")
include(":core:datastore-proto")
include(":core:datastore-test")
include(":core:designsystem")
include(":core:domain")
include(":core:model")
include(":core:network")
include(":core:notifications")
include(":core:screenshot-testing")
include(":core:testing")
include(":core:ui")

include(":feature:foryou")
include(":feature:interests")
include(":feature:bookmarks")
include(":feature:topic")
include(":feature:search")
include(":feature:settings")
include(":lint")
include(":sync:work")
include(":sync:sync-test")
include(":ui-test-hilt-manifest")
