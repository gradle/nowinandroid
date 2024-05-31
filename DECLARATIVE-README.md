# Declarative Gradle DSL

## Current status

This branch has been modified to work with the prototype of the Declarative Gradle DSL. This build relies on nightly versions of Gradle, Android Studio and [Declarative Gradle prototype plugins](https://github.com/gradle/declarative-gradle).

The NowInAndroid project is a "hybrid" build now where there's a mix of declarative and non-declarative (Kotlin DSL) build files. The build can be imported and builds.

The [settings file](settings.gradle.dcl) applies a new "Android ecosystem plugin", which exposes `androidLibrary` and `androidApplication` software types that can be used in subprojects. The current prototype is limited to a single `androidLibrary` software type convention, so only a few subprojects have been converted.

Converted subprojects:
- [`:core:common`](core/common/build.gradle.dcl)
- [`:core:data`](core/data/build.gradle.dcl)
- [`:core:data-test`](core/data-test/build.gradle.dcl)
- [`:core:database`](core/database/build.gradle.dcl)
- [`:core:datastore`](core/datastore/build.gradle.dcl)
- [`:core:datastore-proto`](core/datastore-proto/build.gradle.dcl)
- [`:core:domain`](core/domain/build.gradle.dcl)
- [`:feature:bookmarks`](feature/bookmarks/build.gradle.dcl)

The `androidLibrary` software type exposes [several configuration options](https://github.com/gradle/declarative-gradle/blob/main/unified-prototype/unified-plugin/plugin-android/src/main/java/org/gradle/api/experimental/android/library/AndroidLibrary.java) and dependencies. Test related configuration mimics the existing Android extension for now. 

The [settings file](settings.gradle.dcl) contains several shared conventions that are applied to all subprojects with an `androidLibrary` software type.

Syntax highlighting, code completion and content assist are limited to the latest nightly for Android Studio that understands Gradle DCL files.

There are several capabilities of the `androidLibrary` or `androidApplication` software types that are optional, such as `hilt`, `compose`, `libraryDesugaring`, `feature` and `kotlinSerialization`.  These capabilities are only enabled by configuring them in the software type model.  For instance, an `androidLibrary` software type will not use hilt unless its `hilt { }` block is configured.  This block can be configured with or without setting any properties of hilt.  In other words, an empty `hilt { }` block will enable the hilt capability, but will use its defaults.

NOTE: The build logic and conventions used by declarative and non-declarative projects is currently duplicated. Subsequent milestones/feedback points will bring these back together. 

## Setup

```shell
git clone https://github.com/gradle/nowinandroid.git
cd nowinandroid
git checkout main-declarative
git clone https://github.com/gradle/declarative-gradle.git
```

This should checkout the `main` branch of the [Declarative Gradle prototype plugins](https://github.com/gradle/declarative-gradle) inside the **root** of Gradle's NowInAndroid fork. 

You should have this project structure:
```
nowinandroid/
    declarative-gradle/
```

## Trying things out

### Building the project

You can assemble the project with the following command:

```shell
./gradlew buildDemoDebug
```

### Running tests
**Note:** See the note in [Screenshot tests](README.md#screenshot-tests) about setting up Roborazzi for non-Linux test runs. You may need to run `recordRoborazziDemoDebug` to regenerate screenshots that will work on your machine.

```shell
./gradlew testDemoDebug :lint:test
```

```shell
./gradlew testDemoDebugUnitTest -Proborazzi.test.verify=false
```

After starting a local Android emulator in Android Studio:
```shell
./gradlew connectedDemoDebugAndroidTest --daemon
````

### IDE editing

Syntax highlighting, code completion and content assist should work in the latest Android Studio nightlies that understand Gradle DCL files.

### Reusable conventions

The [settings file](settings.gradle.dcl) contains several shared conventions that are applied to all subprojects with an `androidLibrary` software type.  
Editing these conventions will affect all subprojects.  
Similarly, changing one of these values in a subproject will override the shared convention.

> **NOTE:** In order to avoid applying all configuration from nested blocks such as `kotlinSerialization` or `room` to subprojects
> where this functionality is unnecessary and perhaps build-breaking, we are using an `enabled=false` flag to **SIMULATE** defining
> a convention without automatically applying it.  This is **TEMPORARY WORKAROUND** which will ba addressed soon and should not
> be seen as a pattern to copy.