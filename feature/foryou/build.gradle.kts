/*
 * Copyright 2024 The Android Open Source Project
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

androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.feature.foryou"
    
    feature {
        enabled = true
    }
    compose {
        enabled = true
    }
    hilt {
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

            androidImplementation("androidx.compose.ui:ui-test-manifest:1.7.0-alpha05")
            androidImplementation(project(":core:testing"))
        }
    }
}

afterEvaluate {
    // DCL does not support platform dependencies or product flavors yet
    dependencies {
        add("demoImplementation", "io.github.takahirom.roborazzi:roborazzi:1.7.0")
    }
}
