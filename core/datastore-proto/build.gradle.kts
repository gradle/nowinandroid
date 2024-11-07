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
