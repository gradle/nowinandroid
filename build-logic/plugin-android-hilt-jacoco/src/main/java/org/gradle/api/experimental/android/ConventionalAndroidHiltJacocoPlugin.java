/*
 * Copyright 2024 The Android Open Source Project
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

package org.gradle.api.experimental.android;

import org.gradle.api.Plugin;
import org.gradle.api.Project;
import org.gradle.api.attributes.Attribute;

// TODO: Additional android configuration in AndroidLibraryConventionPlugin
// TODO: Lots of JaCoCo configuration (see AndroidLibraryJacocoConventionPlugin and Jacoco.kt)
// TODO: Apply and configure "nowinandroid.android.lint" plugin
// TODO: Add Conventional test dependencies
public abstract class ConventionalAndroidHiltJacocoPlugin implements Plugin<Project> {
    @Override
    public void apply(Project project) {
        ConventionalAndroidHiltJacocoLibrary dslModel = createDslModel(project);

        // Setup Android Library conventions
        dslModel.getJdkVersion().convention(17);
        dslModel.getCompileSdk().convention(34);

        // Register an afterEvaluate listener before we apply the Android plugin to ensure we can
        // run actions before Android does.
        project.afterEvaluate(p -> AndroidDSLSupport.linkDslModelToPlugin(p, dslModel));

        // Apply the official Android plugin.
        project.getPlugins().apply("com.android.library");
        project.getPlugins().apply("org.jetbrains.kotlin.android");

        // ... and Hilt plugins
        project.getPlugins().apply("com.google.devtools.ksp");
        project.getPlugins().apply("dagger.hilt.android.plugin");

        // ...and the Jacoco plugin
        project.getPlugins().apply("org.gradle.jacoco");

        // Add Hilt deps
        project.getDependencies().add("ksp", "com.google.dagger:hilt-android-compiler:2.50");
        project.getDependencies().add("implementation", "com.google.dagger:hilt-android:2.50");

        linkDslModelToPluginLazy(project, dslModel);
    }

    private ConventionalAndroidHiltJacocoLibrary createDslModel(Project project) {
        AndroidTarget dslDebug = project.getObjects().newInstance(AndroidTarget.class, "debug");
        AndroidTarget dslRelease = project.getObjects().newInstance(AndroidTarget.class, "release");
        AndroidTargets dslTargets = project.getExtensions().create("targets", AndroidTargets.class, dslDebug, dslRelease);
        return project.getExtensions().create("conventionalHiltJacocoAndroidLibrary", ConventionalAndroidHiltJacocoLibrary.class, dslTargets);
    }

    @SuppressWarnings("UnstableApiUsage")
    private void linkDslModelToPluginLazy(Project project, ConventionalAndroidHiltJacocoLibrary dslModel) {
        AndroidDSLSupport.linkDslModelToPluginLazy(project, dslModel);
        project.getConfigurations().getByName("ksp").getDependencies().addAllLater(dslModel.getDependencies().getKsp().getDependencies());
            // TODO: This is super hacky - but otherwise these attributes are not set and project dependencies can't be resolved
            project.getConfigurations().all(c -> {
                if (c.getName().contains("debug") || c.getName().contains("Debug")) {
                    c.getAttributes().attribute(Attribute.of("com.android.build.api.attributes.ProductFlavor:contentType", String.class), "demo");
                    //> Cannot have two attributes with the same name but different types. This container already has an attribute named 'com.android.build.gradle.internal.attributes.VariantAttr' of type 'java.lang.String' and you are trying to store another one of type 'com.android.build.gradle.internal.attributes.VariantAttr'
//                    if (c.getAttributes().keySet().stream().noneMatch(a -> a.getName().equals("com.android.build.gradle.internal.attributes.VariantAttr"))) {
//                        c.getAttributes().attribute(Attribute.of("com.android.build.gradle.internal.attributes.VariantAttr", String.class), "demoDebug");
//                    }
                    c.getAttributes().attribute(Attribute.of("contentType", String.class), "demo");
                }
                if (c.getName().contains("release") || c.getName().contains("Release")) {
                    c.getAttributes().attribute(Attribute.of("com.android.build.api.attributes.ProductFlavor:contentType", String.class), "prod");
                    //> Cannot have two attributes with the same name but different types. This container already has an attribute named 'com.android.build.gradle.internal.attributes.VariantAttr' of type 'java.lang.String' and you are trying to store another one of type 'com.android.build.gradle.internal.attributes.VariantAttr'
//                    if (c.getAttributes().keySet().stream().noneMatch(a -> a.getName().equals("com.android.build.gradle.internal.attributes.VariantAttr"))) {
//                        c.getAttributes().attribute(Attribute.of("com.android.build.gradle.internal.attributes.VariantAttr", String.class), "prodDebug");
//                    }
                    c.getAttributes().attribute(Attribute.of("contentType", String.class), "prod");
                }
            });
    }
}
