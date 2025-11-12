# Voice Notes App

A Flutter app that allows users to record voice notes, convert them to text using speech-to-text, save them locally with timestamps, and search or edit them. The app supports dark mode and provides a simple, user-friendly interface.

## Features
- **Voice Note Recording**: Press and hold a mic button to record and convert speech to text in real-time using the `speech_to_text` package.
- **Local Storage**: Save notes with titles and timestamps using `hive`.
- **Search Functionality**: Filter notes by keyword or date using a live search bar.
- **Edit & Delete**: Modify or remove existing notes.
- **Dark Mode**: System-based light/dark theme support.

## Screenshots
| Home Screen | Record Dialog | Note Detail |
|-------------|---------------|-------------|
| ![Home Screen](assets/screenshots/home_screen.png) | ![Record Dialog](assets/screenshots/record_dialog.png) | ![Note Detail](assets/screenshots/note_detail.png) |

## Getting Started

### Prerequisites
- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK
- Android/iOS emulator or physical device

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/rani0945h-boop/voice-notes-app.git
   cd voice-notes-app
