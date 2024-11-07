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

import com.android.build.api.dsl.CommonExtension
import com.android.build.api.variant.LibraryAndroidComponentsExtension

androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.datastore.proto"

    // Setup protobuf configuration, generating lite Java and Kotlin classes
    protobuf {
        enabled = true
        option = "lite" // TODO:DCL This is modeled in a very limited manner for now
    }
}

// Additional, imperative protobuf configuration
extensions.configure<LibraryAndroidComponentsExtension> {
    beforeVariants {
        val android: CommonExtension<*, *, *, *, *, *> = extensions.getByType(CommonExtension::class)
        android.sourceSets.register(it.name) {
            val buildDir = layout.buildDirectory.get().asFile
            java.srcDir(buildDir.resolve("generated/source/proto/${it.name}/java"))
            kotlin.srcDir(buildDir.resolve("generated/source/proto/${it.name}/kotlin"))
        }
    }
}

// Define and register a misc one-off task imperatively
abstract class PrintProtobufTasks : DefaultTask() {
    @get:Input
    abstract val protoTasks: Property<String>

    @TaskAction
    fun printTasks() {
        println("Protobuf tasks report:\n${protoTasks.get()}")
    }
}
tasks.register("protobufTasks", PrintProtobufTasks::class) {
    protoTasks.set(tasks.filter { it.name.lowercase().contains("proto") }.joinToString("\n"))
}
