// Import the specific extension class we need to provide the correct context.
import com.android.build.gradle.internal.dsl.BaseAppModuleExtension
import org.gradle.api.tasks.Exec
import org.gradle.internal.os.OperatingSystem
import java.util.Properties


// This PQC task setup is correct.
tasks.register<Exec>("installPqcAndroid") {
    onlyIf { !OperatingSystem.current().isWindows }
    group       = "pqc-setup"
    description = "Cross-compile liboqs/OpenSSL/oqs-provider/OpenVPN for Android ABIs"
    workingDir  = rootProject.projectDir
    commandLine("bash", "scripts/install_pqc_android.sh")
}

tasks.named("preBuild") {
    dependsOn("installPqcAndroid")
}

// Use direct plugin IDs. This is correct.
plugins {
    id("com.android.application")
    id("kotlin-android")
    id("checkstyle")
    id ("kotlin-parcelize")
}

configure<BaseAppModuleExtension> {
    namespace = "de.blinkt.openvpn"
    compileSdk = 35

    defaultConfig {
        applicationId = "de.blinkt.openvpn"
        minSdk = 23
        targetSdk = 35
        versionCode = 216
        versionName = "0.7.61"
        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        externalNativeBuild {
            cmake {
                arguments += listOf("-DANDROID_STL=c++_shared")
                cppFlags.add("-std=c++17")
                // It is correct to tell Gradle to build our JNI wrapper target.
                targets.add("openvpn")
            }
        }
    }

    // Set the jniLibs source directory.
    // The modern AGP does not strip libraries by default anymore, so
    // 'useLegacyPackaging' is not needed and we remove the packagingOptions block.
    sourceSets {
        getByName("main") {
            // leave java alone...
            java.srcDirs("src/main/java", "src/ui/java")
            // and explicitly tell Gradle where your .so files live:
            jniLibs.srcDirs("src/main/jniLibs")
        }
    }

    buildTypes {
        getByName("debug") {
            // We no longer need special packaging options here.
            // The default behaviour is what we want for the .so files.
            packaging {
                jniLibs.keepDebugSymbols.add("**/*.so")
            }
        }
        getByName("release") {
            // Your release config
        }
    }

    buildFeatures {
        aidl = true
        buildConfig = true
        viewBinding = true
    }

    externalNativeBuild {
        cmake {
            path = File("${projectDir}/src/main/cpp/CMakeLists.txt")
        }
    }

    signingConfigs {
        create("release") { /* Your signing config here */ }
        create("releaseOvpn2") { /* Your signing config here */ }
    }

    flavorDimensions += listOf("implementation", "ovpnimpl")

    productFlavors {
        create("ui") { dimension = "implementation" }
        create("skeleton") { dimension = "implementation" }
        create("ovpn23") {
            dimension = "ovpnimpl"
            buildConfigField("boolean", "openvpn3", "true")
        }
        create("ovpn2") {
            dimension = "ovpnimpl"
            versionNameSuffix = "-o2"
            buildConfigField("boolean", "openvpn3", "false")
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlinOptions {
        jvmTarget = "17"
    }

    packaging {
        resources.excludes += setOf("META-INF/**")
    }

    applicationVariants.all {
        val variant = this
        val sourceDir = registerGenTask(variant.name, variant.baseName.replace("-", "/"))
        val task = tasks.named("generateOpenVPN3Swig${variant.name}").get()
        variant.registerJavaGeneratingTask(task, sourceDir)
    }
}

// SWIG TASK REGISTRATION (Helper Function)

// 1. Load local.properties to get machine-specific paths
val localProperties = Properties()
val localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    // Use a reader to handle the input stream properly
    localPropertiesFile.reader().use { reader ->
        localProperties.load(reader)
    }
}

// 2. Define the SWIG command with OS-specific logic
val swigcmd: String = when {
    // Priority 1: Use swig.dir from local.properties if on Windows
    OperatingSystem.current().isWindows -> {
        val swigDir = localProperties.getProperty("swig.dir")
        if (!swigDir.isNullOrBlank()) {
            // FIX: Create the path from a single string to avoid ambiguity.
            // This creates a path like "C:/swigwin-4.3.1/swig.exe"
            File("$swigDir/swig.exe").absolutePath
        } else {
            // Fallback if property is not set, will likely fail but informs the user.
            println("Warning: 'swig.dir' not set in local.properties for Windows build.")
            "swig"
        }
    }
    // Priority 2: Check for Homebrew on macOS
    file("/opt/homebrew/bin/swig").exists() -> "/opt/homebrew/bin/swig"
    // Priority 3: Check standard Unix path
    file("/usr/local/bin/swig").exists() -> "/usr/local/bin/swig"
    // Default: Rely on system PATH as a last resort
    else -> "swig"
}
fun registerGenTask(variantName: String, variantDirName: String): File {
    val baseDir = File(buildDir, "generated/source/ovpn3swig/${variantDirName}")
    val genDir = File(baseDir, "net/openvpn/ovpn3")

    tasks.register<Exec>("generateOpenVPN3Swig${variantName}") {
        doFirst {
            mkdir(genDir)
        }
        commandLine(listOf(swigcmd, "-outdir", genDir, "-outcurrentdir", "-c++", "-java", "-package", "net.openvpn.ovpn3",
            "-Isrc/main/cpp/openvpn3/client", "-Isrc/main/cpp/openvpn3/",
            "-DOPENVPN_PLATFORM_ANDROID",
            "-o", "${genDir}/ovpncli_wrap.cxx", "-oh", "${genDir}/ovpncli_wrap.h",
            "src/main/cpp/openvpn3/client/ovpncli.i"))
        inputs.files("src/main/cpp/openvpn3/client/ovpncli.i")
        outputs.dir(genDir)
    }
    return baseDir
}


// DIRECT DEPENDENCIES
dependencies {

    implementation("androidx.lifecycle:lifecycle-runtime-ktx:2.8.1")

    implementation("androidx.annotation:annotation:1.7.1")
    implementation("androidx.core:core-ktx:1.13.1")
    implementation("androidx.preference:preference-ktx:1.2.1")
    implementation("androidx.browser:browser:1.8.0")
    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation("com.google.android.material:material:1.12.0")
    implementation("androidx.activity:activity-ktx:1.9.0")
    implementation("androidx.cardview:cardview:1.0.0")
    implementation("androidx.viewpager2:viewpager2:1.1.0")
    implementation("androidx.constraintlayout:constraintlayout:2.1.4")
    implementation("androidx.fragment:fragment-ktx:1.7.1")
    implementation("androidx.lifecycle:lifecycle-runtime-ktx:2.8.1")
    implementation("androidx.lifecycle:lifecycle-viewmodel-ktx:2.8.1")
    implementation("androidx.recyclerview:recyclerview:1.3.2")
    implementation("androidx.security:security-crypto:1.0.0")
    implementation("androidx.webkit:webkit:1.11.0")
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8:1.9.22")
    implementation("com.github.PhilJay:MPAndroidChart:v3.1.0")
    implementation("com.squareup.okhttp3:okhttp:4.12.0")
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.mockito:mockito-core:5.11.0")
    testImplementation("org.robolectric:robolectric:4.12.2")

    implementation("androidx.core:core-ktx:1.13.1")
    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation("com.google.android.material:material:1.12.0")
    implementation("androidx.constraintlayout:constraintlayout:2.1.4")
    implementation("androidx.lifecycle:lifecycle-runtime-ktx:2.8.1")
}