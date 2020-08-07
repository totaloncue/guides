# React Native Template App Installation

## Required packages

1. react-native-navigation

   1. yarn add @react-navigation/native --- 279 Kb
   1. yarn add react-native-reanimated --- 384 Kb
   1. yarn add react-native-screens --- 254 Kb
   1. uarn add react-native-safe-area-context --- 118 Kb
   1. yarn add @react-native-community/masked-view --- 56 Kb
   1. yarn add react-native-gesture-handler --- 425 Kb

      1. [Installation on Android:](https://software-mansion.github.io/react-native-gesture-handler/docs/getting-started.html#android)

         1. Make changes to /android/app/src/main/java/MainActivity.java

         ```java

                 Imports section

                 import com.facebook.react.ReactActivityDelegate;
                 import com.facebook.react.ReactRootView;
                 import com.swmansion.gesturehandler.react.RNGestureHandlerEnabledRootView;

                 Inside public class MainActivity

                 @Override
                 protected ReactActivityDelegate createReactActivityDelegate() {
                   return new ReactActivityDelegate(this, getMainComponentName()) {
                     @Override
                     protected ReactRootView createRootView() {
                      return new RNGestureHandlerEnabledRootView(MainActivity.this);
                     }
                   };
                 }
         ```

   1. yarn add @react-navigation/stack --- 1.07 Mb
   1. yarn add @react-navigation/bottom-tabs --- 241 Kb
   1. yarn add @react-navigation/drawer --- 429 Kb

1. yarn add react-native-animatable --- 58 Kb
1. yarn add react-native-vector-icons --- 3.49 Mb
   1. Extra steps needed
      1. iOS:
         1. Follow manual installation procedure
         1. Remove font messages from build phases
         1. Use npx pod-install ios
         1. Other resources
            1. [Article on iOS installation](https://medium.com/@vimniky/how-to-use-vector-icons-in-your-react-native-project-8212ac6a8f06)
            1. [Xcode basics](https://stackoverflow.com/questions/21631313/xcode-project-vs-xcode-workspace-differences)
      1. Android:
         1. Add below to android/app/build.gradle
            `apply from: "../../node_modules/react-native-vector-icons/fonts.gradle"`
1. yarn add react-native-elements --- 630 Kb
1. npx pod-install ios

### Other

1. redux
1. firebase

   1. yarn add @react-native-firebase/app --- 1.51 Mb

      1. References:
         1. [https://rnfirebase.io/](https://rnfirebase.io/)
         1. [https://firebase.google.com/docs/android/setup](https://firebase.google.com/docs/android/setup)
         1. [https://firebase.google.com/docs/ios/setup](https://firebase.google.com/docs/ios/setup)
      1. Android

         1. Generate configuration file for project using Firebase console
         1. Download config file (google-services.json) and place it in /android/app/google-services.json
         1. Validate Android credentials

            1. Add google-services plugin as a dependency inside of the /android/build.gradle file

            ```java
                buildscript {
                  dependencies {
                    // ... other dependencies
                    classpath 'com.google.gms:google-services:4.2.0'
                  }
                }
            ```

            1. execute the plugin by adding the following to the very bottom of the /android/app/build.gradle file:

            ```java

            apply plugin: 'com.google.gms.google-services'
            ```

      1. iOS setup

         1. Generate configuration file for project using Firebase console
            1. "iOS bundle ID" must match your local project bundle ID
            1. bundle ID can be found within the "General" tab when opening the project with Xcode
         1. Download the GoogleService-Info.plist file
            1. Open xCode workspace
               1. Right click on the project name and "Add files" to the project
               1. Select the downloaded GoogleService-Info.plist file from your computer, and ensure the "Copy items if needed" checkbox is enabled
         1. Validate iOS credentials

            1. open the /ios/{projectName}/AppDelegate.m file, and add the following lines

            ```objectivec

            #import <Firebase.h>
            ```

            Within the didFinishLaunchingWithOptions method, add the configure method:

            ```objectivec

            - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
              if ([FIRApp defaultApp] == nil) {
                [FIRApp configure];
              }
            ```

   1. Add relevant Firebase SDKs to app e.g.

      1. yarn add @react-native-firebase/auth

         1. This below step not needed if using @react-native-firebase ??? Add relevant SDKs

            1. Android – add below to app level gradle file

            ```java

                implementation 'com.google.firebase:firebase-auth:19.3.1
            ```

            1. iOS -- use CocoaPods

1. [react-native-unimodules](https://github.com/unimodules/react-native-unimodules)
   Base for integrating various Expo SDKs
   yarn add react-native-unimodules 1. iOS config 1. in iOS/Podfile:

   ```objectivec

   platform :ios, '10.0'
   use_unimodules!
   require_relative '../node_modules/react-native-unimodules/cocoapods.rb'
   ```

   1. iOS/appname/<AppDelegate.h>

   ```objectivec

   #import <UMReactNativeAdapter/UMModuleRegistryAdapter.h>
   @property (nonatomic, strong) UMModuleRegistryAdapter *moduleRegistryAdapter;
   ```

   1. iOS/appname/AppDelegate.m

   ```objectivec

   #import <UMCore/UMModuleRegistry.h>
   #import <UMReactNativeAdapter/UMNativeModulesProxy.h>
   #import <UMReactNativeAdapter/UMModuleRegistryAdapter.h>
       self.moduleRegistryAdapter = [[UMModuleRegistryAdapter alloc] initWithModuleRegistryProvider:[[UMModuleRegistryProvider alloc] init]];
   - (NSArray<id<RCTBridgeModule>> *)extraModulesForBridge:(RCTBridge *)bridge
   {
       NSArray<id<RCTBridgeModule>> *extraModules = [_moduleRegistryAdapter extraModulesForBridge:bridge];
       // You can inject any extra modules that you would like here, more information at:
       // https://facebook.github.io/react-native/docs/native-modules-ios.html#dependency-injection
       return extraModules;
   }
   ```

1. Android config

   1. In android/settings.gradle

      1. At the top add

      ```java

      apply from: '../node_modules/react-native-unimodules/gradle.groovy'
      ```

      1. Then call `includeUnimodulesProjects()` on the next line

   1. In android/app/build.gradle
      1. Add `apply from: '../../node_modules/react-native-unimodules/gradle.groovy'` anywhere before the `dependencies {}` block
      1. Add `addUnimodulesDependencies()` inside `dependencies {}` block
      1. Use Java 1.8, set [like this](https://github.com/expo/expo/commit/e175f870418fc69e8c129168118264439d73d7cc)
   1. In android/build.gradle
      1. Update `minSdkVersion` to 21
   1. In app/src/main/java/MainApplication.java make the changes outlined in the diff that correspond to react-native version
      1. [react-native version <= 0.59](https://gist.github.com/mczernek/0670ec16ca6071796853a66d589b49a5/revisions#diff-a2e7ff8a82f1c4be06f8b8163f2afefa)
      1. [react-native version >= 0.60](https://gist.github.com/mczernek/9de9e184abc430e9e3508d26738c8a14/revisions#diff-a2e7ff8a82f1c4be06f8b8163f2afefa)

1. yarn add react-native-splash-screen [crazycodeboy/react-native-splash-screen](https://github.com/crazycodeboy/react-native-splash-screen)
   1. Plugin installation
      1. npx pod-install ios
   1. Plugin config
      1. iOS
         1. Update iOS/appname/AppDelegate.m

### Links

1. [https://dev.to/mkilmer/how-to-use-react-native-gesture-handler-and-react-navigation-side-menu-example-1p5b](https://dev.to/mkilmer/how-to-use-react-native-gesture-handler-and-react-navigation-side-menu-example-1p5b)
1. [Clear React Native cache](https://medium.com/@abhisheknalwaya/how-to-clear-react-native-cache-c435c258834e)
1. [Failure to build iOS](https://stackoverflow.com/questions/55235825/error-failed-to-build-ios-project-we-ran-xcodebuild-command-but-it-exited-wit)

### Making Android Builds

1. Go to android folder in project
1. `./gradlew clean`
1. `./gradlew assembleRelease`
1. `./gradlew bundleRelease`

### Making iOS Builds

1. Enable App Transport Security
1. Configure Release scheme

### Key Packages

1. Expo
   1. react-native-unimodules
   1. expo-secure-store 67 Kb
   1. expo-sensors 145 Kb
   1. expo-constants 58 Kb
   1. expo-font 112 Kb
   1. expo-asset 126 Kb
   1. expo-linear-gradient 58 Kb
   1. expo-filesystem 138 Kb
   1. expo-location 207 Kb
   1. expo-localization 28 Kb
   1. expo-barcode-scanner 118 Kb
   1. expo-blur 49 Kb
   1. expo-local-authentication 37 Kb
   1. expo-image-picker 99 Kb
   1. expo-crypto 30 Kb
   1. expo-google-sign-in 103 Kb
   1. expo-sms 20 Kb
   1. expo-brightness 36 Kb
   1. expo-facebook 43 Kb
   1. expo-contacts 226 Kb
   1. expo-linking 72 Kb
   1. expo-updates 330 Kb
   1. expo-firebase-recaptcha 39 Kb
   1. expo-sharing 23 Kb
   1. expo-permissions 111 Kb
   1. expo-av 530 Kb
   1. expo-background-fetch 28 Kb
   1. react-native-view-shot 127 Kb
   1. expo-firebase-analytics 145 Kb
   1. expo-firebase-core 32 Kb
   1. expo-in-app-purchases 68 Kb

### Other Interesting Packages

1. react-native-game-engine
1. bberak/react-native-game-engine 53Kb
1. react-native-svg 2.27Mb
1. amazon-cognito-identity-js 1.12 Mb
1. react-native-device-info 643 Kb
1. react-native-linear-gradient 278 Kb
1. react-with-styles 147 Kb
1. react-native-modal 62 Kb
1. react-native-iphone-x-helper 5.43 Kb
1. react-native-keyboard-aware-scroll-view 55.6 Kb
1. react-native-camera 1.07 Mb
1. react-native-swiper 66.6 Kb
1. react-native-image-picker 231 Kb
1. @react-native-community/async-storage 286 Kb
1. react-native-maps 45 Mb
1. react-native-fs 566 Kb
1. react-native-video 402 Kb
1. native-base 3.79 Mb
1. react-native-permissions 222 Kb
1. react-native-safe-area-view 81.8 Kb
1. @react-native-community/netinfo 473 Kb
1. lottie-react-native 382 Kb
1. @react-native-community/datetimepicker 153 Kb
1. dancormier/react-native-swipeout 114 Kb – deprecated
   1. jemise111/react-native-swipe-list-view 162 Kb
