import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// Load keystore properties
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.example.FeatureRichArchFlutter"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.FeatureRichArchFlutter"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }
signingConfigs {
    create("release") {
        try {
            val keyAliasValue = keystoreProperties["keyAlias"] as? String
            val keyPasswordValue = keystoreProperties["keyPassword"] as? String
            val storeFileValue = keystoreProperties["storeFile"] as? String
            val storePasswordValue = keystoreProperties["storePassword"] as? String

            val missingFields = mutableListOf<String>()
            if (keyAliasValue == null) missingFields.add("keyAlias")
            if (keyPasswordValue == null) missingFields.add("keyPassword")
            if (storeFileValue == null) missingFields.add("storeFile")
            if (storePasswordValue == null) missingFields.add("storePassword")

            if (missingFields.isNotEmpty()) {
                throw GradleException("Missing the following keystore properties in key.properties: ${missingFields.joinToString(", ")}")
            }

            keyAlias = keyAliasValue
            keyPassword = keyPasswordValue
            storeFile = file(storeFileValue)
            storePassword = storePasswordValue

        } catch (e: Exception) {
            throw GradleException("Error reading keystore properties: ${e.message}", e)
        }
    }
}




// signingConfigs {
//     create("release") {






//         val keyAliasValue = keystoreProperties["keyAlias"] as? String
//         val keyPasswordValue = keystoreProperties["keyPassword"] as? String
//         val storeFileValue = keystoreProperties["storeFile"] as? String
//         val storePasswordValue = keystoreProperties["storePassword"] as? String

//         if (keyAliasValue == null || keyPasswordValue == null || storeFileValue == null || storePasswordValue == null) {
//             throw GradleException("Missing one or more keystore values in key.properties")
//         }

//         keyAlias = keyAliasValue
//         keyPassword = keyPasswordValue
//         storeFile = file(storeFileValue)
//         storePassword = storePasswordValue
//     }
// }

    // signingConfigs {
    //     create("release") {
    //         keyAlias = keystoreProperties["keyAlias"] as String
    //         keyPassword = keystoreProperties["keyPassword"] as String
    //         storeFile = keystoreProperties["storeFile"]?.let { file(it) }
    //         storePassword = keystoreProperties["storePassword"] as String
    //     }
    // }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = false
            isShrinkResources = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("com.google.android.gms:play-services-auth:20.7.0")
    implementation("com.google.android.material:material:1.14.0")
}
