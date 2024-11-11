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
    namespace = "com.google.samples.apps.niacatalog"

    applicationId = "com.google.samples.apps.niacatalog"
    versionCode = 1
    versionName = "0.0.1" // X.Y.Z; X = Major, Y = minor, Z = Patch level

    // The UI catalog does not depend on content from the app, however, it depends on modules
    // which do, so we must specify a default value for the contentType dimension.
    missingDimensionStrategy {
        name = "contentType"
        value = "demo"
    }

    compose {
        enabled = true
    }

    dependencyGuard {
        enabled = true
        configurationName = "releaseRuntimeClasspath"
    }

    dependencies {
        implementation("androidx.activity:activity-compose:1.8.0")

        implementation(project(":core:designsystem"))
        implementation(project(":core:ui"))
    }

    buildTypes {
        release {
            // TODO:DCL Setup Signing config
            // To publish on the Play store a private signing key is required, but to allow anyone
            // who clones the code to sign and run the release variant, use the debug signing key.
            // TODO:DCL Abstract the signing configuration to a separate file to avoid hardcoding this.
            // signingConfig = signingConfigs.named("debug").get()
        }
    }
}

val android: CommonExtension<*, *, *, *, *, *> = extensions.getByType(CommonExtension::class)
android.packaging {
    resources {
        excludes.add("/META-INF/{AL2.0,LGPL2.1}")
    }
}
