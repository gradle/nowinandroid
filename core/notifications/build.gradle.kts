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
