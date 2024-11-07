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

plugins {
    id("com.android.lint")
}

kotlinJvmLibrary {
    javaVersion = 11

    dependencies {
        compileOnly("org.jetbrains.kotlin:kotlin-stdlib-jdk8:1.9.23")
        compileOnly("com.android.tools.lint:lint-api:31.3.0")
    }

    testing {
        dependencies {
            implementation("com.android.tools.lint:lint-checks:31.3.0")
            implementation("com.android.tools.lint:lint-tests:31.3.0")
            implementation("org.jetbrains.kotlin:kotlin-test:1.9.23")
        }
    }
}

lint {
    xmlReport = true
    checkDependencies = true
}
