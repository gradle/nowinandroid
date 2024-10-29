androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.core.domain"

    dependencies {
        api(project(":core:data"))
        api(project(":core:model"))

        implementation("javax.inject:javax.inject:1")
    }

    testing {
        jacoco {
            enabled = true
        }

        dependencies {
            implementation(project(":core:testing"))
        }
    }
}
