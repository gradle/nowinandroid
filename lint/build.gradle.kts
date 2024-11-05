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
