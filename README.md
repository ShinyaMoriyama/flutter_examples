# my_app

My example project mainly provided by [Flutter Complete Reference](https://fluttercompletereference.com/)

## The changes of properties in Xcode

| Key                                 | Value                                           |
| ----------------------------------- | ----------------------------------------------- |
| Bundle Identifier                   | com.flutter.morisin.myapp                       |
| NSCameraUsageDescription            | Explanation on why the camera access is needed. |
| NSLocationWhenInUseUsageDescription | This app needs access to location when open.    |

## Firebase Project

flutter-morisin-myapp

    Note: Added GoogleService-Info.plist into Xcode workspace

pod install

Podfile

```
platform :ios, ‘10.0’

# Add the pods for the Firebase products you want to use in your app
# For example, to use Firebase Authentication and Cloud Firestore
pod 'Firebase/Auth'
pod 'Firebase/Firestore'
```

[Mac M1 issue](https://github.com/CocoaPods/CocoaPods/issues/10718)

1. Install ffi
    ```
    sudo arch -x86_64 gem install ffi
    ```
2. Re-install dependencies

    ```
    arch -x86_64 pod install
    ```

## Re-install dependencies from clearing Pod

References:

https://stackoverflow.com/questions/66148505/flutter-include-of-non-modular-header-inside-framework-module-firebase-core-fl

https://stackoverflow.com/questions/46428752/how-to-clear-or-clean-specific-pod-from-the-local-cocoapods-cache

1. Put all the `pubspec.yaml` dependencies to the latest version.

    ```
    dart pub outdated
    ```

2. Delete `pubspec.lock`, `Pods` folder in `ios` and `Podfile.lock`

    ```
    rm pubspec.lock
    cd ios
    rm Podfile.lock
    rm -rf ~/Library/Caches/CocoaPods
    rm -rf Pods
    rm -rf ~/Library/Developer/Xcode/DerivedData/\*
    ```

3. Run `flutter clean` -> `flutter pub get` -> `cd ios` -> `pod install` -> `cd ..` -> `flutter run`

    ```
    flutter clean
    flutter pub get

    cd ios
    pod deintegrate
    pod setup
    arch -x86_64 pod install
    cd ..
    flutter run
    ```
