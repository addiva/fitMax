// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'FitMax';

  @override
  String get tabPrograms => 'Programmes';

  @override
  String get tabStatistics => 'Statistiques';

  @override
  String get tabSession => 'Séance';

  @override
  String get actionAdd => 'Ajouter';

  @override
  String get actionEdit => 'Modifier';

  @override
  String get actionDelete => 'Supprimer';

  @override
  String get actionSave => 'Enregistrer';

  @override
  String get actionCancel => 'Annuler';

  @override
  String get themeLabel => 'Thème';

  @override
  String get themeSystem => 'Système';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get languageLabel => 'Langue';

  @override
  String get languageSystem => 'Système';

  @override
  String get languageItalian => 'Italien';

  @override
  String get languageEnglish => 'Anglais';

  @override
  String get programsEmptyTitle => 'Aucun programme';

  @override
  String get programsEmptySubtitle =>
      'Importez un plan JSON ou créez-en un nouveau pour commencer.';

  @override
  String get importFromFile => 'Importer depuis un fichier';

  @override
  String get importFromUrl => 'Importer depuis une URL';

  @override
  String get programName => 'Nom du programme';

  @override
  String get programNote => 'Note';

  @override
  String get weeksCount => 'Semaines';

  @override
  String get select => 'Sélectionner';

  @override
  String get sessionStart => 'Démarrer la séance';

  @override
  String get sessionResume => 'Reprendre';

  @override
  String get sessionEnd => 'Terminer la séance';

  @override
  String get sessionRest => 'Repos';

  @override
  String get sessionRestStart => 'Démarrer';

  @override
  String get sessionRestReset => 'Réinitialiser';

  @override
  String get statisticsEmpty =>
      'Ajoutez une séance pour voir les statistiques.';

  @override
  String get calendarTitle => 'Calendrier d\'entraînement';

  @override
  String get filtersTitle => 'Filtres';

  @override
  String get weekCurrentToggle => 'Afficher uniquement la semaine actuelle';

  @override
  String get suggestedSessionTitle => 'Séance suggérée';

  @override
  String get suggestedSessionReason => 'Basée sur votre dernier entraînement.';

  @override
  String get exportData => 'Exporter les données';

  @override
  String get importData => 'Importer des données';

  @override
  String get deleteConfirmation => 'Êtes-vous sûr ?';

  @override
  String get deleteProgramDescription =>
      'Le programme et ses données locales seront supprimés.';

  @override
  String get actionRename => 'Renommer';

  @override
  String get importFromClipboard => 'Importer depuis le presse-papiers';

  @override
  String get exportProgram => 'Exporter en JSON';

  @override
  String get renameProgram => 'Renommer le programme';

  @override
  String get programNameHint => 'Nom du programme';

  @override
  String get programDeleteConfirmTitle => 'Supprimer le programme ?';

  @override
  String programDeleteConfirmMessage(Object name) {
    return '$name et son historique seront supprimés.';
  }

  @override
  String weekLabel(int number) {
    return 'Semaine $number';
  }

  @override
  String get deloadWeekLabel => 'Semaine de décharge';

  @override
  String get setsShort => 'Séries';

  @override
  String get repsShort => 'Rép.';

  @override
  String get restShort => 'Repos';

  @override
  String get bufShort => 'BUF';

  @override
  String get tutShort => 'TUT';

  @override
  String get intensityShort => 'Intensité';

  @override
  String get notesShort => 'Notes';

  @override
  String get videoShort => 'Vidéo';

  @override
  String programImportedMessage(Object name) {
    return '$name importé.';
  }

  @override
  String programDeletedMessage(Object name) {
    return '$name supprimé.';
  }

  @override
  String programRenamedMessage(Object name) {
    return 'Renommé en $name.';
  }

  @override
  String get programExportCopiedMessage => 'JSON copié dans le presse-papiers.';

  @override
  String get programImportError => 'Impossible d\'importer le programme.';

  @override
  String get programDeleteError => 'Impossible de supprimer le programme.';

  @override
  String get programRenameError => 'Impossible de renommer le programme.';

  @override
  String get urlPromptLabel => 'URL du programme';

  @override
  String get urlPromptHint => 'https://example.com/program.json';

  @override
  String get confirm => 'Confirmer';

  @override
  String get close => 'Fermer';

  @override
  String lastSessionLabel(Object date) {
    return 'Dernière séance : $date';
  }

  @override
  String get noSessionsYet => 'Aucune séance enregistrée pour l\'instant.';

  @override
  String get weightShort => 'Poids';

  @override
  String get sessionFinishConfirmMessage =>
      'Enregistrer et quitter cette séance ?';

  @override
  String get settings => 'Réglages';

  @override
  String get allProgramsOption => 'Tous les programmes';

  @override
  String get volumeLabel => 'Volume';

  @override
  String get bestLiftLabel => 'Meilleures charges';

  @override
  String get copiedToClipboard => 'Copié dans le presse-papiers.';

  @override
  String importedSessionsMessage(int count) {
    return '$count séances importées.';
  }

  @override
  String get noSessionsForDay => 'Aucune séance pour ce jour.';

  @override
  String get fileSaveUnsupported =>
      'Enregistrement non pris en charge sur cette plateforme. JSON copié.';

  @override
  String get totalSessionsLabel => 'Séances';

  @override
  String get averageLabel => 'Moyenne';

  @override
  String get accentColorLabel => 'Couleur d\'accent';

  @override
  String get accentColorCustom => 'Couleur personnalisée';

  @override
  String get accentColorReset => 'Réinitialiser';

  @override
  String get languageGerman => 'Allemand';

  @override
  String get languageAlbanian => 'Albanais';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageSpanish => 'Espagnol';

  @override
  String get languageRussian => 'Russe';

  @override
  String get languageHebrew => 'Hébreu';

  @override
  String get languageArabic => 'Arabe';

  @override
  String get sessionRestPause => 'Pause';

  @override
  String get sessionRestResume => 'Reprendre';

  @override
  String get sessionRestPaused => 'Minuteur en pause';

  @override
  String get volumeLegend =>
      'Poids total × répétitions par groupe musculaire et par jour.';

  @override
  String get bestLiftLegend =>
      'Charge maximale enregistrée par exercice sur la période choisie.';

  @override
  String get categoryVolumeTitle => 'Volume par groupe musculaire';

  @override
  String get exerciseProgressionTitle => 'Progression de l\'exercice';

  @override
  String get exerciseProgressionLegend =>
      'Meilleure charge par séance pour l\'exercice sélectionné.';

  @override
  String get noExerciseData => 'Pas encore de données d\'exercice.';

  @override
  String get sessionDeleteTitle => 'Supprimer la séance ?';

  @override
  String get sessionDeleteMessage =>
      'La séance et ses données seront supprimées.';

  @override
  String get deleteSession => 'Supprimer la séance';

  @override
  String get sessionDetailTitle => 'Détails de la séance';

  @override
  String get sessionDetailClose => 'Fermer';
}
