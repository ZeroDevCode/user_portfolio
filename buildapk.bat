@REM flutter build apk --release -v --split-per-abi
flutter build apk -v --target-platform=android-arm64
@REM adb install  build\app\outputs\flutter-apk\app-arm64-v8a-release.apk
adb install  build\app\outputs\flutter-apk\app-release.apk