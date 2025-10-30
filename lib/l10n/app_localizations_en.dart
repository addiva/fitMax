// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'FitMax';

  @override
  String get tabPrograms => 'Programs';

  @override
  String get tabStatistics => 'Statistics';

  @override
  String get tabSession => 'Session';

  @override
  String get actionAdd => 'Add';

  @override
  String get actionEdit => 'Edit';

  @override
  String get actionDelete => 'Delete';

  @override
  String get actionSave => 'Save';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get themeLabel => 'Theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get languageLabel => 'Language';

  @override
  String get languageSystem => 'System';

  @override
  String get languageItalian => 'Italian';

  @override
  String get languageEnglish => 'English';

  @override
  String get programsEmptyTitle => 'No programs yet';

  @override
  String get programsEmptySubtitle =>
      'Import a JSON plan or create a new one to get started.';

  @override
  String get importFromFile => 'Import from file';

  @override
  String get importFromUrl => 'Import from URL';

  @override
  String get programName => 'Program name';

  @override
  String get programNote => 'Note';

  @override
  String get weeksCount => 'Weeks';

  @override
  String get select => 'Select';

  @override
  String get sessionStart => 'Start session';

  @override
  String get sessionResume => 'Resume';

  @override
  String get sessionEnd => 'Finish session';

  @override
  String get sessionRest => 'Rest';

  @override
  String get sessionRestStart => 'Start';

  @override
  String get sessionRestReset => 'Reset';

  @override
  String get statisticsEmpty => 'Add a session to see your statistics.';

  @override
  String get calendarTitle => 'Training calendar';

  @override
  String get filtersTitle => 'Filters';

  @override
  String get weekCurrentToggle => 'Show current week only';

  @override
  String get suggestedSessionTitle => 'Suggested session';

  @override
  String get suggestedSessionReason => 'Based on your last workout.';

  @override
  String get exportData => 'Export data';

  @override
  String get importData => 'Import data';

  @override
  String get deleteConfirmation => 'Are you sure?';

  @override
  String get deleteProgramDescription =>
      'This will remove the program and its local data.';

  @override
  String get actionRename => 'Rename';

  @override
  String get importFromClipboard => 'Import from clipboard';

  @override
  String get exportProgram => 'Export JSON';

  @override
  String get renameProgram => 'Rename program';

  @override
  String get programNameHint => 'Program name';

  @override
  String get programDeleteConfirmTitle => 'Delete program?';

  @override
  String programDeleteConfirmMessage(Object name) {
    return 'This will remove $name and its history.';
  }

  @override
  String weekLabel(int number) {
    return 'Week $number';
  }

  @override
  String get deloadWeekLabel => 'Deload';

  @override
  String get setsShort => 'Sets';

  @override
  String get repsShort => 'Reps';

  @override
  String get restShort => 'Rest';

  @override
  String get bufShort => 'BUF';

  @override
  String get tutShort => 'TUT';

  @override
  String get intensityShort => 'Intensity';

  @override
  String get notesShort => 'Notes';

  @override
  String get videoShort => 'Video';

  @override
  String programImportedMessage(Object name) {
    return 'Imported $name.';
  }

  @override
  String programDeletedMessage(Object name) {
    return 'Deleted $name.';
  }

  @override
  String programRenamedMessage(Object name) {
    return 'Renamed to $name.';
  }

  @override
  String get programExportCopiedMessage => 'JSON copied to clipboard.';

  @override
  String get programImportError => 'Unable to import program.';

  @override
  String get programDeleteError => 'Unable to delete program.';

  @override
  String get programRenameError => 'Unable to rename program.';

  @override
  String get urlPromptLabel => 'Program URL';

  @override
  String get urlPromptHint => 'https://example.com/program.json';

  @override
  String get confirm => 'Confirm';

  @override
  String get close => 'Close';

  @override
  String lastSessionLabel(Object date) {
    return 'Last session: $date';
  }

  @override
  String get noSessionsYet => 'No sessions recorded yet.';

  @override
  String get weightShort => 'Weight';

  @override
  String get sessionFinishConfirmMessage => 'Save and close this session?';

  @override
  String get settings => 'Settings';

  @override
  String get allProgramsOption => 'All programs';

  @override
  String get volumeLabel => 'Volume';

  @override
  String get bestLiftLabel => 'Best lifts';

  @override
  String get copiedToClipboard => 'Copied to clipboard.';

  @override
  String importedSessionsMessage(int count) {
    return 'Imported $count sessions.';
  }

  @override
  String get noSessionsForDay => 'No sessions for this day.';

  @override
  String get fileSaveUnsupported =>
      'File saving is not supported on this platform. JSON copied to clipboard.';

  @override
  String get totalSessionsLabel => 'Sessions';

  @override
  String get averageLabel => 'Average';

  @override
  String get accentColorLabel => 'Accent color';

  @override
  String get accentColorCustom => 'Custom color';

  @override
  String get accentColorReset => 'Reset';

  @override
  String get languageGerman => 'German';

  @override
  String get languageAlbanian => 'Albanian';

  @override
  String get languageFrench => 'French';

  @override
  String get languageSpanish => 'Spanish';

  @override
  String get languageRussian => 'Russian';

  @override
  String get languageHebrew => 'Hebrew';

  @override
  String get languageArabic => 'Arabic';

  @override
  String get sessionRestPause => 'Pause';

  @override
  String get sessionRestResume => 'Resume';

  @override
  String get sessionRestPaused => 'Timer paused';

  @override
  String get volumeLegend =>
      'Total weight × reps per muscle group on each day.';

  @override
  String get bestLiftLegend =>
      'Top weight recorded per exercise across the selected history.';

  @override
  String get categoryVolumeTitle => 'Volume by muscle group';

  @override
  String get exerciseProgressionTitle => 'Exercise progression';

  @override
  String get exerciseProgressionLegend =>
      'Best weight logged per session for the selected exercise.';

  @override
  String get noExerciseData => 'No exercise data yet.';

  @override
  String get sessionDeleteTitle => 'Delete session?';

  @override
  String get sessionDeleteMessage =>
      'This will remove the session and its exercise logs.';

  @override
  String get deleteSession => 'Delete session';

  @override
  String get sessionDetailTitle => 'Session details';

  @override
  String get sessionDetailClose => 'Close';
}
