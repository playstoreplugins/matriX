# PlaystorePlugins iOS App

## Building the iOS App

### Requirements
- macOS with Xcode 14 or later
- iOS 13.0 or later target device
- Apple Developer Account (for distribution)

### Build Instructions

1. Open the project in Xcode:
   ```bash
   open PlaystorePlugins.xcodeproj
   ```

2. Select your development team in the project settings

3. Connect your iOS device or select a simulator

4. Build and run the project (Cmd + R)

### Creating IPA for Distribution

1. In Xcode, select Product > Archive
2. Once archived, click "Distribute App"
3. Choose distribution method (App Store, Ad Hoc, or Enterprise)
4. Follow the wizard to export the IPA file

### Features
- Keep screen on functionality
- Background audio playback mode
- Direct TikTok app integration
- Clean, native iOS interface

### Note
iOS has strict background execution policies. The app uses silent audio playback to maintain background activity, which is an approved method for media apps.

### Contact
playstoreplugins@gmail.com
