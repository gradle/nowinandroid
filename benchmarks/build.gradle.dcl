androidTest {
    namespace = "com.google.samples.apps.nowinandroid.benchmarks"

    minSdk = 28
    compileSdk = 34
    buildConfig = true

    baselineProfile {
        enabled = true

        // This specifies the managed devices to use that you run the tests on.
        additionalManagedDevice = "pixel6Api33"

        // Don't use a connected device but rely on a GMD for consistency between local and CI builds.
        useConnectedDevices = false
    }

    experimentalProperties {
        experimentalProperty("android.experimental.self-instrumenting") {
            value = true
        }
    }

    targetProjectPath = ":app"

    testOptions {
        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"

        managedDevices {
            managedDevice("pixel6Api33") {
                device = "Pixel 6"
                apiLevel = 33
                systemImageSource = "aosp"
            }
        }
    }

    dependencies {
        implementation("androidx.benchmark:benchmark-macro-junit4:1.2.2")
        implementation("androidx.test:core:1.5.0")
        implementation("androidx.test.espresso:espresso-core:3.5.1")
        implementation("androidx.test.ext:junit-ktx:1.1.5")
        implementation("androidx.test:rules:1.5.0")
        implementation("androidx.test:runner:1.5.2")
        implementation("androidx.test.uiautomator:uiautomator:2.2.0")
    }
}
