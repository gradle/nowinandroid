androidLibrary {
    namespace = "com.google.samples.apps.nowinandroid.feature.bookmarks"

    dependencies {
        implementation(project(":core:data"))
    }

    feature {
        enabled = true
    }

    compose {
        enabled = true
        stabilityConfigurationFilePath = "/compose_compiler_config.conf"
        experimentalStrongSkipping = true
    }

    testing {
        dependencies {
            implementation(project(":core:testing"))
            androidImplementation(project(":core:testing"))
            androidImplementation("androidx-compose-ui-test:androidx-compose-ui-testManifest")
        }
    }
}
