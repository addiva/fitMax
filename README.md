# FitMax

FitMax is a Flutter app for planning, tracking, and analyzing workouts, with full offline/online support, light/dark themes, automatic or manual language selection, and customizable accent colors. The app allows you to import JSON workout plans (from a file, URL, or clipboard), organize daily sessions, and view charts, a calendar, and progress statistics.

## Key Features
- **Smart Programs**: Full CRUD of workout plans with JSON import/export, suggestions for the next session, and a weekly preview.
- **Guided Sessions**: Rest timer with vibration/alert, progression with pre-filled previous sets, video support, and notes.
- **Advanced Statistics**: Volume chart, best lifts, training calendar, and history with log import/export.
- **Multilingual**: English, Italian, German, French, Spanish, Russian, Albanian, Hebrew, and Arabic (auto/system override from settings).
- **Dynamic Theme**: Light/dark theme linked to the system or manual, customizable accent color.
- **Offline-first**: Data saved locally with Hive/SharedPreferences, works without a network connection.

## Requirements
- Flutter 3.35.6+
- Dart 3.9+

## Getting Started

To get started with the project, run the following commands:
```bash
flutter pub get
flutter run
```

To regenerate the Freezed/JsonSerializable files:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Project Structure
The project is structured as follows:
```
lib/
  app/                # Entry point, theme, router, settings
  core/               # Models, repositories, parsing and storage services
  features/
    programs/         # Program CRUD and import/export
    session/          # Active sessions and suggestions
    statistics/       # Charts, calendar, and logs
    settings/         # Settings bottom sheet
  widgets/            # Reusable components
assets/schede/        # Example JSON files included at startup
l10n/                 # .arb files for localization
```

## JSON Program Format
Each program is an object with the following main fields:

```json
{
  "id": "A",
  "name": "Workout A",
  "note": "Push / Light Back",
  "weeks": { "total": 8, "deload": 4 },
  "exercises": [
    {
      "name": "Dumbbell Bench Press",
      "category": "chest",
      "video_url": "https://…",
      "progression": [
        { "sets": 3, "reps": "10", "rest_sec": 180, "tut": "3-1-0-0", "buf": 3 },
        { "inherit": 1, "set_delta": -1 }
      ]
    }
  ]
}
```

- `weeks.total`: number of programmed weeks.
- `weeks.deload` (optional): to indicate the deload week.
- `progression`: array sorted by week (position = week). Each step can specify `sets`, `reps`, `rest_sec`, `tut`, `buf`, `intensity`, `note`, `video_url` or use `inherit`/*`_delta` to inherit values from another week.

## Import / Export
- **Local Import**: From `Programs → file icon` (FilePicker) or `link icon` for URL (via HTTP) or `clipboard icon` for JSON in the clipboard.
- **Export**: Context menu of the program → "Export JSON" copies to the clipboard. Completed sessions are exported from **Statistics → download icon** (`.json` file or clipboard on web).

## Settings
Open the ⚙️ icon in the Programs tab to:
- choose the theme (System/Light/Dark),
- select the language manually,
- set the accent color (quick palette, custom picker, reset).

## Web-based Program Generator
In the [`docs/`](docs/index.html) folder, you'll find a responsive HTML page to create JSON programs without writing them manually.

1. Open `docs/index.html` (or publish on GitHub Pages pointing to the `docs` folder).
2. Fill in the program data (name, weeks, deload).
3. Add exercises, fill in the weekly progressions.
4. Press **Generate JSON** and copy/download the result.

## Localization
The `.arb` files are in `lib/l10n`. You can update the texts and regenerate the localization files with:

```bash
flutter gen-l10n
```

## Bug Fixes
- **`deleteExercise` bug:** Fixed a bug in the `deleteExercise` function in `lib/features/session/providers/active_session_controller.dart` where deleting the last exercise would cause an `IndexOutOfBounds` error. The fix involves clamping the `exerciseIndex` to the valid range of indices for the updated `exercises` list.

## License
MIT. See [LICENSE](LICENSE) if present.
