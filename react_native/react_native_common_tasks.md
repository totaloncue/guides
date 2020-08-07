# React Native Common Tasks

1. How is local storage handled?

   1. [StackOverflow answer](https://stackoverflow.com/questions/44376002/what-are-my-options-for-storing-data-when-using-react-native-ios-and-android)

1. Reactotron setup gotchas

   1. Android
      1. adb reverse tcp:9090 tcp:9090

1. How to add app icons

   1. [Use react-native-make](https://github.com/bamlab/react-native-make)
   1. yarn add -D @bam.tech/react-native-make
   1. react-native set-icon --path path-to-image

1. How to set the splash screens

   1. [Use react-native-splash-screen](https://github.com/crazycodeboy/react-native-splash-screen)

1. Change name of a React Native project

   1. [StackOverflow answer](https://stackoverflow.com/questions/32830046/renaming-a-react-native-project)
   1. [Guide](https://medium.com/the-react-native-log/how-to-rename-a-react-native-app-dafd92161c35)
   1. Use react-native-rename

1. Run on a specific Android emulator

   1. [StackOverflow answer](https://stackoverflow.com/questions/40725219/react-native-run-android-on-specific-device)

1. Run on a specific iOS simulator

1. Set up secure local storage

   1. [StackOverflow async storage guide](https://stackoverflow.com/questions/39148714/is-react-natives-async-storage-secure)
   1. Use Expo secure storage

1. Expo SDK docs

   1. [Expo docs](https://docs.expo.io/versions/latest/)

1. Peculiar problem with Native Instruments and adb

   1. [Description of problem and solution](https://support.native-instruments.com/hc/en-us/community/posts/360006204558-NTKDaemon-has-an-emulator-5562-android-virtual-device-en-us-)

1. Clear the react native cache

   1. [StackOverflow link](https://stackoverflow.com/questions/46878638/how-to-clear-react-native-cache)
   1. yarn start --reset-cache

1. Android Build settings to ensure build has enough memory

   1. Set gradle.properties

   ```java
   org.gradle.jvmargs=-Xmx4608m
   ```

1. Speed considerations

   1. [Article](https://codeburst.io/6-simple-ways-to-speed-up-your-react-native-app-d5b775ab3f16)

1. Set the context of a parent from a child

   1. [StackOverflow answer](https://stackoverflow.com/questions/41030361/how-to-update-react-context-from-inside-a-child-component)

1. Set the parent state from a child
   1. [StackOverflow answer](https://stackoverflow.com/questions/55726886/react-hook-send-data-from-child-to-parent-component)
