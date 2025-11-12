# Voice Notes App Documentation

This document provides an overview of the Voice Notes App, a Flutter-based mobile application that enables users to record voice notes, convert them to text, and manage them locally with search and edit functionality. The app is designed to be simple, intuitive, and supports dark mode.

## 1. Features

### 1.1 Voice Note Recording
- **Functionality**: Users can record voice notes by pressing a mic button in a dialog, with real-time speech-to-text conversion.
- **Implementation**: Uses the `speech_to_text` package to transcribe audio input into text.
- **User Experience**: A floating action button opens a dialog showing the mic status and transcribed text. Users can save the note with a timestamp.

### 1.2 Local Storage
- **Functionality**: Notes are saved locally with a title, content, and timestamp.
- **Implementation**: The `hive` package stores notes in a lightweight, NoSQL database.
- **Details**: Each note is a `Note` object with fields for title, content, and timestamp, persisted in a Hive box.

### 1.3 Notes List with Search
- **Functionality**: Displays a list of saved notes with a search bar to filter by keyword or date.
- **Implementation**: A `ListView` renders `NoteCard` widgets, and the `NoteProvider` filters notes based on search input.
- **User Experience**: The search is live, updating the list as the user types.

### 1.4 Edit & Delete Notes
- **Functionality**: Users can edit note titles/content or delete notes.
- **Implementation**: The `NoteDetailScreen` allows editing via text fields, and deletion is handled via an app bar action.
- **User Experience**: Tap a note to edit, save changes, or delete it.

### 1.5 Dark Mode Support
- **Functionality**: The app adapts to the system’s light/dark mode.
- **Implementation**: Uses `ThemeMode.system` in `MaterialApp` with predefined light and dark themes.
- **User Experience**: Seamless theme switching based on device settings.

## 2. Packages Used

| Package             | Purpose                              |
|---------------------|--------------------------------------|
| `speech_to_text`    | Converts speech to text in real-time |
| `hive`              |Local storage for notes               |
| `hive_flutter`      | Flutter integration for Hive         |
| `provider`          |State management for notes            |
| `intl`              |Date and time formatting              |
| `cupertino_icons`   |Platform-specific icons               |

### Dependencies Installation
Add to `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  speech_to_text: 
  hive:
  hive_flutter: 
  provider:
  intl:
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  hive_generator:
  build_runner: 
