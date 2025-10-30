// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'FitMax';

  @override
  String get tabPrograms => 'Programme';

  @override
  String get tabStatistics => 'Statistiken';

  @override
  String get tabSession => 'Session';

  @override
  String get actionAdd => 'Hinzufügen';

  @override
  String get actionEdit => 'Bearbeiten';

  @override
  String get actionDelete => 'Löschen';

  @override
  String get actionSave => 'Speichern';

  @override
  String get actionCancel => 'Abbrechen';

  @override
  String get themeLabel => 'Design';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get languageLabel => 'Sprache';

  @override
  String get languageSystem => 'System';

  @override
  String get languageItalian => 'Italienisch';

  @override
  String get languageEnglish => 'Englisch';

  @override
  String get programsEmptyTitle => 'Noch keine Programme';

  @override
  String get programsEmptySubtitle =>
      'Importiere einen Trainingsplan als JSON oder erstelle einen neuen.';

  @override
  String get importFromFile => 'Aus Datei importieren';

  @override
  String get importFromUrl => 'Über URL importieren';

  @override
  String get programName => 'Programmname';

  @override
  String get programNote => 'Notiz';

  @override
  String get weeksCount => 'Wochen';

  @override
  String get select => 'Auswählen';

  @override
  String get sessionStart => 'Session starten';

  @override
  String get sessionResume => 'Fortsetzen';

  @override
  String get sessionEnd => 'Session beenden';

  @override
  String get sessionRest => 'Pause';

  @override
  String get sessionRestStart => 'Starten';

  @override
  String get sessionRestReset => 'Zurücksetzen';

  @override
  String get statisticsEmpty =>
      'Füge eine Session hinzu, um Statistiken zu sehen.';

  @override
  String get calendarTitle => 'Trainingskalender';

  @override
  String get filtersTitle => 'Filter';

  @override
  String get weekCurrentToggle => 'Nur aktuelle Woche anzeigen';

  @override
  String get suggestedSessionTitle => 'Empfohlene Session';

  @override
  String get suggestedSessionReason => 'Basierend auf deinem letzten Training.';

  @override
  String get exportData => 'Daten exportieren';

  @override
  String get importData => 'Daten importieren';

  @override
  String get deleteConfirmation => 'Bist du sicher?';

  @override
  String get deleteProgramDescription =>
      'Dadurch werden Programm und lokale Daten entfernt.';

  @override
  String get actionRename => 'Umbenennen';

  @override
  String get importFromClipboard => 'Aus Zwischenablage importieren';

  @override
  String get exportProgram => 'JSON exportieren';

  @override
  String get renameProgram => 'Programm umbenennen';

  @override
  String get programNameHint => 'Programmname';

  @override
  String get programDeleteConfirmTitle => 'Programm löschen?';

  @override
  String programDeleteConfirmMessage(Object name) {
    return 'Dadurch wird $name und dessen Historie entfernt.';
  }

  @override
  String weekLabel(int number) {
    return 'Woche $number';
  }

  @override
  String get deloadWeekLabel => 'Entlastungswoche';

  @override
  String get setsShort => 'Sätze';

  @override
  String get repsShort => 'Wdh.';

  @override
  String get restShort => 'Pause';

  @override
  String get bufShort => 'BUF';

  @override
  String get tutShort => 'TUT';

  @override
  String get intensityShort => 'Intensität';

  @override
  String get notesShort => 'Notizen';

  @override
  String get videoShort => 'Video';

  @override
  String programImportedMessage(Object name) {
    return '$name importiert.';
  }

  @override
  String programDeletedMessage(Object name) {
    return '$name gelöscht.';
  }

  @override
  String programRenamedMessage(Object name) {
    return 'Umbenannt in $name.';
  }

  @override
  String get programExportCopiedMessage =>
      'JSON in die Zwischenablage kopiert.';

  @override
  String get programImportError => 'Programm konnte nicht importiert werden.';

  @override
  String get programDeleteError => 'Programm konnte nicht gelöscht werden.';

  @override
  String get programRenameError => 'Programm konnte nicht umbenannt werden.';

  @override
  String get urlPromptLabel => 'Programm-URL';

  @override
  String get urlPromptHint => 'https://example.com/program.json';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get close => 'Schließen';

  @override
  String lastSessionLabel(Object date) {
    return 'Letzte Session: $date';
  }

  @override
  String get noSessionsYet => 'Noch keine Sessions aufgezeichnet.';

  @override
  String get weightShort => 'Gewicht';

  @override
  String get sessionFinishConfirmMessage => 'Session speichern und schließen?';

  @override
  String get settings => 'Einstellungen';

  @override
  String get allProgramsOption => 'Alle Programme';

  @override
  String get volumeLabel => 'Volumen';

  @override
  String get bestLiftLabel => 'Beste Gewichte';

  @override
  String get copiedToClipboard => 'In die Zwischenablage kopiert.';

  @override
  String importedSessionsMessage(int count) {
    return '$count Sessions importiert.';
  }

  @override
  String get noSessionsForDay => 'Für diesen Tag keine Sessions.';

  @override
  String get fileSaveUnsupported =>
      'Speichern auf diesem Gerät nicht möglich. JSON wurde kopiert.';

  @override
  String get totalSessionsLabel => 'Sessions';

  @override
  String get averageLabel => 'Durchschnitt';

  @override
  String get accentColorLabel => 'Akzentfarbe';

  @override
  String get accentColorCustom => 'Eigene Farbe';

  @override
  String get accentColorReset => 'Zurücksetzen';

  @override
  String get languageGerman => 'Deutsch';

  @override
  String get languageAlbanian => 'Albanisch';

  @override
  String get languageFrench => 'Französisch';

  @override
  String get languageSpanish => 'Spanisch';

  @override
  String get languageRussian => 'Russisch';

  @override
  String get languageHebrew => 'Hebräisch';

  @override
  String get languageArabic => 'Arabisch';

  @override
  String get sessionRestPause => 'Pause';

  @override
  String get sessionRestResume => 'Weiter';

  @override
  String get sessionRestPaused => 'Timer pausiert';

  @override
  String get volumeLegend =>
      'Gesamtes Gewicht × Wiederholungen pro Muskelgruppe pro Tag.';

  @override
  String get bestLiftLegend =>
      'Höchstes registriertes Gewicht pro Übung im ausgewählten Zeitraum.';

  @override
  String get categoryVolumeTitle => 'Volumen nach Muskelgruppe';

  @override
  String get exerciseProgressionTitle => 'Übungsprogression';

  @override
  String get exerciseProgressionLegend =>
      'Beste Last pro Session für die gewählte Übung.';

  @override
  String get noExerciseData => 'Noch keine Übungsdaten.';

  @override
  String get sessionDeleteTitle => 'Session löschen?';

  @override
  String get sessionDeleteMessage =>
      'Die Session und ihre Trainingsdaten werden entfernt.';

  @override
  String get deleteSession => 'Session löschen';

  @override
  String get sessionDetailTitle => 'Sessiondetails';

  @override
  String get sessionDetailClose => 'Schließen';
}
