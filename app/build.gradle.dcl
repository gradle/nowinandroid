androidApplication {
    applicationId = "com.google.samples.apps.nowinandroid"
    versionCode = 8
    versionName = "0.1.2" // X.Y.Z; X = Major, Y = minor, Z = Patch level

    compose {}
    hilt {}

    buildTypes {
        debug {
            applicationIdSuffix = ".debug"
        }

        release {
            // TODO: Declarative DSL doesn't support setting this to null
            // Is there any need to explicitly set this to null?
            // applicationIdSuffix = null
        }
    }

    testing {
        jacoco {}
    }
}
