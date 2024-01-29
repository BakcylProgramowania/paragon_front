# Paragon App

This guide provides step-by-step instructions on setting up your Flutter development environment and configuring the Android Studio Emulator.

## Requirements

- [Flutter](https://flutter.dev/docs/get-started/install) - Version X.X.X
- [Dart](https://dart.dev/get-dart) - Version X.X.X
- [Android Studio](https://developer.android.com/studio) - Recommended version X.X.X

## Installation

1. Clone the repository: `git clone https://github.com/BakcylProgramowania/paragon_front/tree/PARAGON_APP`
2. Create a folder for project: `mkdir 'folder_nazwa'`
3. Navigate to the project directory: `cd 'folder'`
4. Install dependencies: `flutter pub get`
5. Check required dependencies: `flutter doctor`

### Installing Flutter on Linux

1. Download the latest stable release of Flutter from [Flutter GitHub releases](https://github.com/flutter/flutter/releases).
2. Extract the downloaded archive.
3. Add the Flutter binary path to your system's `PATH` variable. For example, add the following line to your shell profile file (e.g., `~/.bashrc`, `~/.zshrc`, etc.):
4. ```bash
   export PATH="$PATH:`<path_to_flutter_folder>`/flutter/bin"
5. Check required dependencies: `flutter doctor`
   
## Installing the Emulator (Android Studio)

1. Download and install [Android Studio](https://developer.android.com/studio).
2. Open Android Studio and go to "Preferences" (macOS) or "Settings" (Windows/Linux).
3. Select "Appearance & Behavior" -> "System Settings" -> "Android SDK".
4. Go to the "SDK Tools" tab and check "Android Emulator".
5. Click "Apply" and wait for Android Studio to install the Emulator.

## Running

If you are in project folder

```bash
flutter run
