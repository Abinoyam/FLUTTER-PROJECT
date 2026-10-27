# Unit Converter Flutter Project — All 10 Stages

**Course:** UI Design Using Flutter Lab (CS506PC)  
**Student:** Abinoyam  
**Branch:** Computer Science and Engineering  
**Year:** III B.Tech  
**College:** ACE Engineering College  
**Academic Year:** 2026

## Overview
All ten experiments are brought together in a single Flutter application. The `lib/` directory is organized into `screens`, `widgets`, `providers`, `services`, `models`, and `utils`, with `main.dart` as the entry point.

## Stage order
1. Dart Basics
2. Widgets & Layouts
3. Responsive UI
4. Navigation
5. State Management
6. Custom Widgets & Themes — includes light/dark mode
7. Forms & Validation
8. Animations
9. REST API
10. Testing & Debugging

## Run
```bash
flutter pub get
flutter run
```

Run automated widget tests:
```bash
flutter test
```

Stage 9 needs internet access. For Android, confirm `android/app/src/main/AndroidManifest.xml` has this permission above `<application>`:
```xml
<uses-permission android:name="android.permission.INTERNET" />
```

## Folder structure
```text
lib/
├── main.dart
├── models/
│   └── conversion_record.dart
├── providers/
│   ├── conversion_provider.dart
│   └── theme_provider.dart
├── screens/
│   ├── home_screen.dart
│   ├── converter_screen.dart
│   ├── history_screen.dart
│   ├── about_screen.dart
│   ├── dart_basics_screen.dart
│   ├── widgets_layouts_screen.dart
│   ├── responsive_ui_screen.dart
│   ├── navigation_screen.dart
│   ├── state_management_screen.dart
│   ├── custom_widgets_themes_screen.dart
│   ├── forms_validation_screen.dart
│   ├── animations_screen.dart
│   ├── rest_api_screen.dart
│   └── testing_debugging_screen.dart
├── services/
│   └── api_service.dart
├── utils/
│   └── conversion_utils.dart
└── widgets/
    ├── stage_card.dart
    ├── responsive_content.dart
    └── result_card.dart
```

GitHub language percentages are calculated from the files committed to the repository. This project keeps the app implementation in Dart and does not include generated Windows/Linux runner folders in this source package; the exact GitHub percentage is not guaranteed.
