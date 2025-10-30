// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Albanian (`sq`).
class AppLocalizationsSq extends AppLocalizations {
  AppLocalizationsSq([String locale = 'sq']) : super(locale);

  @override
  String get appTitle => 'FitMax';

  @override
  String get tabPrograms => 'Programet';

  @override
  String get tabStatistics => 'Statistikat';

  @override
  String get tabSession => 'Seanca';

  @override
  String get actionAdd => 'Shto';

  @override
  String get actionEdit => 'Përpuno';

  @override
  String get actionDelete => 'Fshi';

  @override
  String get actionSave => 'Ruaj';

  @override
  String get actionCancel => 'Anulo';

  @override
  String get themeLabel => 'Temë';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get themeLight => 'E ndritshme';

  @override
  String get themeDark => 'E errët';

  @override
  String get languageLabel => 'Gjuha';

  @override
  String get languageSystem => 'Sistem';

  @override
  String get languageItalian => 'Italisht';

  @override
  String get languageEnglish => 'Anglisht';

  @override
  String get programsEmptyTitle => 'Asnjë program ende';

  @override
  String get programsEmptySubtitle =>
      'Importo një plan JSON ose krijo një të ri për të filluar.';

  @override
  String get importFromFile => 'Importo nga skedari';

  @override
  String get importFromUrl => 'Importo nga URL';

  @override
  String get programName => 'Emri i programit';

  @override
  String get programNote => 'Shënim';

  @override
  String get weeksCount => 'Java';

  @override
  String get select => 'Zgjidh';

  @override
  String get sessionStart => 'Fillo seancën';

  @override
  String get sessionResume => 'Vazhdo';

  @override
  String get sessionEnd => 'Përfundo seancën';

  @override
  String get sessionRest => 'Pushim';

  @override
  String get sessionRestStart => 'Fillo';

  @override
  String get sessionRestReset => 'Rivendos';

  @override
  String get statisticsEmpty => 'Shto një seancë për të parë statistikat.';

  @override
  String get calendarTitle => 'Kalendari i stërvitjes';

  @override
  String get filtersTitle => 'Filtra';

  @override
  String get weekCurrentToggle => 'Shfaq vetëm javën aktuale';

  @override
  String get suggestedSessionTitle => 'Seancë e sugjeruar';

  @override
  String get suggestedSessionReason => 'Bazuar në stërvitjen tënde të fundit.';

  @override
  String get exportData => 'Eksporto të dhëna';

  @override
  String get importData => 'Importo të dhëna';

  @override
  String get deleteConfirmation => 'Je i sigurt?';

  @override
  String get deleteProgramDescription =>
      'Kjo do të heqë programin dhe të dhënat lokale.';

  @override
  String get actionRename => 'Riemërto';

  @override
  String get importFromClipboard => 'Importo nga kujtesa';

  @override
  String get exportProgram => 'Eksporto JSON';

  @override
  String get renameProgram => 'Riemërto programin';

  @override
  String get programNameHint => 'Emri i programit';

  @override
  String get programDeleteConfirmTitle => 'Ta fshij programin?';

  @override
  String programDeleteConfirmMessage(Object name) {
    return 'Kjo do të heqë $name dhe historikun e tij.';
  }

  @override
  String weekLabel(int number) {
    return 'Java $number';
  }

  @override
  String get deloadWeekLabel => 'Javë lehtësimi';

  @override
  String get setsShort => 'Sete';

  @override
  String get repsShort => 'Përsëritje';

  @override
  String get restShort => 'Pushim';

  @override
  String get bufShort => 'BUF';

  @override
  String get tutShort => 'TUT';

  @override
  String get intensityShort => 'Intensitet';

  @override
  String get notesShort => 'Shënime';

  @override
  String get videoShort => 'Video';

  @override
  String programImportedMessage(Object name) {
    return '$name u importua.';
  }

  @override
  String programDeletedMessage(Object name) {
    return '$name u fshi.';
  }

  @override
  String programRenamedMessage(Object name) {
    return 'U riemërtua në $name.';
  }

  @override
  String get programExportCopiedMessage => 'JSON u kopjua në kujtesë.';

  @override
  String get programImportError => 'Programi nuk mund të importohej.';

  @override
  String get programDeleteError => 'Programi nuk mund të fshihej.';

  @override
  String get programRenameError => 'Programi nuk mund të riemërtohej.';

  @override
  String get urlPromptLabel => 'URL e programit';

  @override
  String get urlPromptHint => 'https://example.com/program.json';

  @override
  String get confirm => 'Konfirmo';

  @override
  String get close => 'Mbyll';

  @override
  String lastSessionLabel(Object date) {
    return 'Seanca e fundit: $date';
  }

  @override
  String get noSessionsYet => 'Ende nuk ka seanca të regjistruara.';

  @override
  String get weightShort => 'Pesha';

  @override
  String get sessionFinishConfirmMessage => 'Ta ruaj dhe ta mbyll këtë seancë?';

  @override
  String get settings => 'Cilësimet';

  @override
  String get allProgramsOption => 'Të gjitha programet';

  @override
  String get volumeLabel => 'Vëllimi';

  @override
  String get bestLiftLabel => 'Pesha më e madhe';

  @override
  String get copiedToClipboard => 'U kopjua në kujtesë.';

  @override
  String importedSessionsMessage(int count) {
    return '$count seanca u importuan.';
  }

  @override
  String get noSessionsForDay => 'Nuk ka seanca për këtë ditë.';

  @override
  String get fileSaveUnsupported =>
      'Ruajtja në këtë pajisje nuk mbështetet. JSON u kopjua.';

  @override
  String get totalSessionsLabel => 'Seanca';

  @override
  String get averageLabel => 'Mesatarja';

  @override
  String get accentColorLabel => 'Ngjyra e theksit';

  @override
  String get accentColorCustom => 'Ngjyrë e personalizuar';

  @override
  String get accentColorReset => 'Rivendos';

  @override
  String get languageGerman => 'Gjermanisht';

  @override
  String get languageAlbanian => 'Shqip';

  @override
  String get languageFrench => 'Frëngjisht';

  @override
  String get languageSpanish => 'Spanjisht';

  @override
  String get languageRussian => 'Rusisht';

  @override
  String get languageHebrew => 'Hebraisht';

  @override
  String get languageArabic => 'Arabisht';

  @override
  String get sessionRestPause => 'Pauzë';

  @override
  String get sessionRestResume => 'Vazhdo';

  @override
  String get sessionRestPaused => 'Timer në pauzë';

  @override
  String get volumeLegend =>
      'Pesha totale × përsëritje për çdo grup muskulor sipas ditës.';

  @override
  String get bestLiftLegend =>
      'Pesha më e madhe e regjistruar për secilën ushtrim.';

  @override
  String get categoryVolumeTitle => 'Vëllimi sipas grupit muskulor';

  @override
  String get exerciseProgressionTitle => 'Progresioni i ushtrimit';

  @override
  String get exerciseProgressionLegend =>
      'Pesha më e mirë për seancë për ushtrimin e zgjedhur.';

  @override
  String get noExerciseData => 'Ende nuk ka të dhëna ushtrimesh.';

  @override
  String get sessionDeleteTitle => 'Ta fshij seancën?';

  @override
  String get sessionDeleteMessage =>
      'Kjo do të heqë seancën dhe të dhënat e saj.';

  @override
  String get deleteSession => 'Fshi seancën';

  @override
  String get sessionDetailTitle => 'Detajet e seancës';

  @override
  String get sessionDetailClose => 'Mbyll';
}
