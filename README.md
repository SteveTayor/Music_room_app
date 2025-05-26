# Music Room App

Welcome to the **Music Room App**, a Flutter application showcasing music services information in a clean, MVVM-based architecture.

---

## 🚀 Features

* **MVVM Architecture**: Clean separation of data, logic, and UI.
* **Provider**: State management for reactive UI updates.
* **Firebase Firestore**: Dynamic data loading for music services.
* **GetIt**: Service locator for dependency injection.
* **Google Fonts**: Custom typography.
* **Cached Network Images**: Efficient image loading.

---

## 📁 Project Structure

```
lib/
├── main.dart
├── models/
│   └── music_service.dart
├── repositories/
│   └── music_service_repository.dart
├── view_models/
│   └── music_service_view_model.dart
├── views/
│   ├── home_screen.dart
│   ├── service_detail_screen.dart
│   ├── track_screen.dart
│   ├── news_screen.dart
│   └── project_screen.dart
├── widgets/
│   ├── service_card.dart
│   └── custom_bottom_navigation_bar_widget.dart
└── utils/
    ├── constants.dart
    ├── app_style_theme.dart
    └── service_locator.dart
```

---

## 📦 Dependencies

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1
  cloud_firestore: ^4.13.6
  firebase_core: ^2.24.2
  get_it: ^7.6.4
  google_fonts: ^6.1.0
  cached_network_image: ^3.2.3

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
```

---

## 🛠 Implementation Steps

1. **Setup Firebase**

   * Add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) under the respective platform folders.
2. **Install Dependencies**

   * Run `flutter pub get` to install all packages.
3. **Configure Service Locator**

   * Register your `MusicServiceRepository` and `MusicServiceViewModel` in `service_locator.dart`.
4. **Implement MVVM**

   * **Model**: `music_service.dart` defines the `MusicService` data class.
   * **Repository**: `music_service_repository.dart` handles Firestore streams.
   * **ViewModel**: `music_service_view_model.dart` uses Provider to manage state.
   * **View**: Screens in `views/` render UI and listen to the ViewModel.
5. **Run the App**

   * Launch on your simulator or device with `flutter run`.

---

## 🎥 Demo Recording

You can find the demo screen recording in the assets folder at:

```
assets/video/demo.mkv
```

A short screen recording demonstrating the UI, navigation, and dynamic data loading.


