// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'FitMax';

  @override
  String get tabPrograms => 'Programmazioni';

  @override
  String get tabStatistics => 'Statistiche';

  @override
  String get tabSession => 'Sessione';

  @override
  String get actionAdd => 'Aggiungi';

  @override
  String get actionEdit => 'Modifica';

  @override
  String get actionDelete => 'Elimina';

  @override
  String get actionSave => 'Salva';

  @override
  String get actionCancel => 'Annulla';

  @override
  String get themeLabel => 'Tema';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Chiaro';

  @override
  String get themeDark => 'Scuro';

  @override
  String get languageLabel => 'Lingua';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get languageItalian => 'Italiano';

  @override
  String get languageEnglish => 'Inglese';

  @override
  String get programsEmptyTitle => 'Nessuna programmazione';

  @override
  String get programsEmptySubtitle =>
      'Importa una scheda JSON o creane una nuova per iniziare.';

  @override
  String get importFromFile => 'Importa da file';

  @override
  String get importFromUrl => 'Importa da URL';

  @override
  String get programName => 'Nome programma';

  @override
  String get programNote => 'Note';

  @override
  String get weeksCount => 'Settimane';

  @override
  String get select => 'Seleziona';

  @override
  String get sessionStart => 'Avvia sessione';

  @override
  String get sessionResume => 'Riprendi';

  @override
  String get sessionEnd => 'Chiudi sessione';

  @override
  String get sessionRest => 'Recupero';

  @override
  String get sessionRestStart => 'Avvia';

  @override
  String get sessionRestReset => 'Azzera';

  @override
  String get statisticsEmpty =>
      'Aggiungi una sessione per vedere le statistiche.';

  @override
  String get calendarTitle => 'Calendario allenamenti';

  @override
  String get filtersTitle => 'Filtri';

  @override
  String get weekCurrentToggle => 'Mostra solo settimana corrente';

  @override
  String get suggestedSessionTitle => 'Sessione consigliata';

  @override
  String get suggestedSessionReason => 'Basata sull\'ultimo allenamento.';

  @override
  String get exportData => 'Esporta dati';

  @override
  String get importData => 'Importa dati';

  @override
  String get deleteConfirmation => 'Sei sicuro?';

  @override
  String get deleteProgramDescription =>
      'Questo rimuoverà la scheda e i dati locali.';

  @override
  String get actionRename => 'Rinomina';

  @override
  String get importFromClipboard => 'Importa dagli appunti';

  @override
  String get exportProgram => 'Esporta JSON';

  @override
  String get renameProgram => 'Rinomina programma';

  @override
  String get programNameHint => 'Nome programma';

  @override
  String get programDeleteConfirmTitle => 'Eliminare la scheda?';

  @override
  String programDeleteConfirmMessage(Object name) {
    return 'Questo rimuoverà $name e la sua cronologia.';
  }

  @override
  String weekLabel(int number) {
    return 'Settimana $number';
  }

  @override
  String get deloadWeekLabel => 'Scarico';

  @override
  String get setsShort => 'Serie';

  @override
  String get repsShort => 'Rip';

  @override
  String get restShort => 'Rec';

  @override
  String get bufShort => 'BUF';

  @override
  String get tutShort => 'TUT';

  @override
  String get intensityShort => 'Intensità';

  @override
  String get notesShort => 'Note';

  @override
  String get videoShort => 'Video';

  @override
  String programImportedMessage(Object name) {
    return 'Importata $name.';
  }

  @override
  String programDeletedMessage(Object name) {
    return 'Eliminata $name.';
  }

  @override
  String programRenamedMessage(Object name) {
    return 'Rinominata in $name.';
  }

  @override
  String get programExportCopiedMessage => 'JSON copiato negli appunti.';

  @override
  String get programImportError => 'Impossibile importare la scheda.';

  @override
  String get programDeleteError => 'Impossibile eliminare la scheda.';

  @override
  String get programRenameError => 'Impossibile rinominare la scheda.';

  @override
  String get urlPromptLabel => 'URL scheda';

  @override
  String get urlPromptHint => 'https://esempio.com/scheda.json';

  @override
  String get confirm => 'Conferma';

  @override
  String get close => 'Chiudi';

  @override
  String lastSessionLabel(Object date) {
    return 'Ultima sessione: $date';
  }

  @override
  String get noSessionsYet => 'Nessuna sessione registrata.';

  @override
  String get weightShort => 'Peso';

  @override
  String get sessionFinishConfirmMessage =>
      'Salvare e chiudere questa sessione?';

  @override
  String get settings => 'Impostazioni';

  @override
  String get allProgramsOption => 'Tutti i programmi';

  @override
  String get volumeLabel => 'Volume';

  @override
  String get bestLiftLabel => 'Alzate migliori';

  @override
  String get copiedToClipboard => 'Copiato negli appunti.';

  @override
  String importedSessionsMessage(int count) {
    return 'Importate $count sessioni.';
  }

  @override
  String get noSessionsForDay => 'Nessuna sessione per questo giorno.';

  @override
  String get fileSaveUnsupported =>
      'Salvataggio su file non supportato su questa piattaforma. JSON copiato negli appunti.';

  @override
  String get totalSessionsLabel => 'Sessioni';

  @override
  String get averageLabel => 'Media';

  @override
  String get accentColorLabel => 'Colore accento';

  @override
  String get accentColorCustom => 'Colore personalizzato';

  @override
  String get accentColorReset => 'Ripristina';

  @override
  String get languageGerman => 'Tedesco';

  @override
  String get languageAlbanian => 'Albanese';

  @override
  String get languageFrench => 'Francese';

  @override
  String get languageSpanish => 'Spagnolo';

  @override
  String get languageRussian => 'Russo';

  @override
  String get languageHebrew => 'Ebraico';

  @override
  String get languageArabic => 'Arabo';

  @override
  String get sessionRestPause => 'Pausa';

  @override
  String get sessionRestResume => 'Riprendi';

  @override
  String get sessionRestPaused => 'Timer in pausa';

  @override
  String get volumeLegend =>
      'Somma di peso × ripetizioni per distretto muscolare nella data.';

  @override
  String get bestLiftLegend =>
      'Peso massimo registrato per esercizio nello storico filtrato.';

  @override
  String get categoryVolumeTitle => 'Volume per distretto muscolare';

  @override
  String get exerciseProgressionTitle => 'Progressione esercizio';

  @override
  String get exerciseProgressionLegend =>
      'Miglior peso registrato per sessione per l’esercizio selezionato.';

  @override
  String get noExerciseData => 'Nessun dato esercizio disponibile.';

  @override
  String get sessionDeleteTitle => 'Eliminare la sessione?';

  @override
  String get sessionDeleteMessage =>
      'Questo rimuoverà la sessione e i dati registrati.';

  @override
  String get deleteSession => 'Elimina sessione';

  @override
  String get sessionDetailTitle => 'Dettagli sessione';

  @override
  String get sessionDetailClose => 'Chiudi';
}
