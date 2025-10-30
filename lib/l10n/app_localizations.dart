import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_he.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sq.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('he'),
    Locale('it'),
    Locale('ru'),
    Locale('sq'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'FitMax'**
  String get appTitle;

  /// No description provided for @tabPrograms.
  ///
  /// In en, this message translates to:
  /// **'Programs'**
  String get tabPrograms;

  /// No description provided for @tabStatistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get tabStatistics;

  /// No description provided for @tabSession.
  ///
  /// In en, this message translates to:
  /// **'Session'**
  String get tabSession;

  /// No description provided for @actionAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get actionAdd;

  /// No description provided for @actionEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get actionEdit;

  /// No description provided for @actionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get actionDelete;

  /// No description provided for @actionSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get actionSave;

  /// No description provided for @actionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// No description provided for @themeLabel.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeLabel;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @languageLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageLabel;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get languageSystem;

  /// No description provided for @languageItalian.
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get languageItalian;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @programsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No programs yet'**
  String get programsEmptyTitle;

  /// No description provided for @programsEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Import a JSON plan or create a new one to get started.'**
  String get programsEmptySubtitle;

  /// No description provided for @importFromFile.
  ///
  /// In en, this message translates to:
  /// **'Import from file'**
  String get importFromFile;

  /// No description provided for @importFromUrl.
  ///
  /// In en, this message translates to:
  /// **'Import from URL'**
  String get importFromUrl;

  /// No description provided for @programName.
  ///
  /// In en, this message translates to:
  /// **'Program name'**
  String get programName;

  /// No description provided for @programNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get programNote;

  /// No description provided for @weeksCount.
  ///
  /// In en, this message translates to:
  /// **'Weeks'**
  String get weeksCount;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @sessionStart.
  ///
  /// In en, this message translates to:
  /// **'Start session'**
  String get sessionStart;

  /// No description provided for @sessionResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get sessionResume;

  /// No description provided for @sessionEnd.
  ///
  /// In en, this message translates to:
  /// **'Finish session'**
  String get sessionEnd;

  /// No description provided for @sessionRest.
  ///
  /// In en, this message translates to:
  /// **'Rest'**
  String get sessionRest;

  /// No description provided for @sessionRestStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get sessionRestStart;

  /// No description provided for @sessionRestReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get sessionRestReset;

  /// No description provided for @statisticsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Add a session to see your statistics.'**
  String get statisticsEmpty;

  /// No description provided for @calendarTitle.
  ///
  /// In en, this message translates to:
  /// **'Training calendar'**
  String get calendarTitle;

  /// No description provided for @filtersTitle.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filtersTitle;

  /// No description provided for @weekCurrentToggle.
  ///
  /// In en, this message translates to:
  /// **'Show current week only'**
  String get weekCurrentToggle;

  /// No description provided for @suggestedSessionTitle.
  ///
  /// In en, this message translates to:
  /// **'Suggested session'**
  String get suggestedSessionTitle;

  /// No description provided for @suggestedSessionReason.
  ///
  /// In en, this message translates to:
  /// **'Based on your last workout.'**
  String get suggestedSessionReason;

  /// No description provided for @exportData.
  ///
  /// In en, this message translates to:
  /// **'Export data'**
  String get exportData;

  /// No description provided for @importData.
  ///
  /// In en, this message translates to:
  /// **'Import data'**
  String get importData;

  /// No description provided for @deleteConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get deleteConfirmation;

  /// No description provided for @deleteProgramDescription.
  ///
  /// In en, this message translates to:
  /// **'This will remove the program and its local data.'**
  String get deleteProgramDescription;

  /// No description provided for @actionRename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get actionRename;

  /// No description provided for @importFromClipboard.
  ///
  /// In en, this message translates to:
  /// **'Import from clipboard'**
  String get importFromClipboard;

  /// No description provided for @exportProgram.
  ///
  /// In en, this message translates to:
  /// **'Export JSON'**
  String get exportProgram;

  /// No description provided for @renameProgram.
  ///
  /// In en, this message translates to:
  /// **'Rename program'**
  String get renameProgram;

  /// No description provided for @programNameHint.
  ///
  /// In en, this message translates to:
  /// **'Program name'**
  String get programNameHint;

  /// No description provided for @programDeleteConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete program?'**
  String get programDeleteConfirmTitle;

  /// No description provided for @programDeleteConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'This will remove {name} and its history.'**
  String programDeleteConfirmMessage(Object name);

  /// No description provided for @weekLabel.
  ///
  /// In en, this message translates to:
  /// **'Week {number}'**
  String weekLabel(int number);

  /// No description provided for @deloadWeekLabel.
  ///
  /// In en, this message translates to:
  /// **'Deload'**
  String get deloadWeekLabel;

  /// No description provided for @setsShort.
  ///
  /// In en, this message translates to:
  /// **'Sets'**
  String get setsShort;

  /// No description provided for @repsShort.
  ///
  /// In en, this message translates to:
  /// **'Reps'**
  String get repsShort;

  /// No description provided for @restShort.
  ///
  /// In en, this message translates to:
  /// **'Rest'**
  String get restShort;

  /// No description provided for @bufShort.
  ///
  /// In en, this message translates to:
  /// **'BUF'**
  String get bufShort;

  /// No description provided for @tutShort.
  ///
  /// In en, this message translates to:
  /// **'TUT'**
  String get tutShort;

  /// No description provided for @intensityShort.
  ///
  /// In en, this message translates to:
  /// **'Intensity'**
  String get intensityShort;

  /// No description provided for @notesShort.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notesShort;

  /// No description provided for @videoShort.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get videoShort;

  /// No description provided for @programImportedMessage.
  ///
  /// In en, this message translates to:
  /// **'Imported {name}.'**
  String programImportedMessage(Object name);

  /// No description provided for @programDeletedMessage.
  ///
  /// In en, this message translates to:
  /// **'Deleted {name}.'**
  String programDeletedMessage(Object name);

  /// No description provided for @programRenamedMessage.
  ///
  /// In en, this message translates to:
  /// **'Renamed to {name}.'**
  String programRenamedMessage(Object name);

  /// No description provided for @programExportCopiedMessage.
  ///
  /// In en, this message translates to:
  /// **'JSON copied to clipboard.'**
  String get programExportCopiedMessage;

  /// No description provided for @programImportError.
  ///
  /// In en, this message translates to:
  /// **'Unable to import program.'**
  String get programImportError;

  /// No description provided for @programDeleteError.
  ///
  /// In en, this message translates to:
  /// **'Unable to delete program.'**
  String get programDeleteError;

  /// No description provided for @programRenameError.
  ///
  /// In en, this message translates to:
  /// **'Unable to rename program.'**
  String get programRenameError;

  /// No description provided for @urlPromptLabel.
  ///
  /// In en, this message translates to:
  /// **'Program URL'**
  String get urlPromptLabel;

  /// No description provided for @urlPromptHint.
  ///
  /// In en, this message translates to:
  /// **'https://example.com/program.json'**
  String get urlPromptHint;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @lastSessionLabel.
  ///
  /// In en, this message translates to:
  /// **'Last session: {date}'**
  String lastSessionLabel(Object date);

  /// No description provided for @noSessionsYet.
  ///
  /// In en, this message translates to:
  /// **'No sessions recorded yet.'**
  String get noSessionsYet;

  /// No description provided for @weightShort.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weightShort;

  /// No description provided for @sessionFinishConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Save and close this session?'**
  String get sessionFinishConfirmMessage;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @allProgramsOption.
  ///
  /// In en, this message translates to:
  /// **'All programs'**
  String get allProgramsOption;

  /// No description provided for @volumeLabel.
  ///
  /// In en, this message translates to:
  /// **'Volume'**
  String get volumeLabel;

  /// No description provided for @bestLiftLabel.
  ///
  /// In en, this message translates to:
  /// **'Best lifts'**
  String get bestLiftLabel;

  /// No description provided for @copiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard.'**
  String get copiedToClipboard;

  /// No description provided for @importedSessionsMessage.
  ///
  /// In en, this message translates to:
  /// **'Imported {count} sessions.'**
  String importedSessionsMessage(int count);

  /// No description provided for @noSessionsForDay.
  ///
  /// In en, this message translates to:
  /// **'No sessions for this day.'**
  String get noSessionsForDay;

  /// No description provided for @fileSaveUnsupported.
  ///
  /// In en, this message translates to:
  /// **'File saving is not supported on this platform. JSON copied to clipboard.'**
  String get fileSaveUnsupported;

  /// No description provided for @totalSessionsLabel.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get totalSessionsLabel;

  /// No description provided for @averageLabel.
  ///
  /// In en, this message translates to:
  /// **'Average'**
  String get averageLabel;

  /// No description provided for @accentColorLabel.
  ///
  /// In en, this message translates to:
  /// **'Accent color'**
  String get accentColorLabel;

  /// No description provided for @accentColorCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom color'**
  String get accentColorCustom;

  /// No description provided for @accentColorReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get accentColorReset;

  /// No description provided for @languageGerman.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get languageGerman;

  /// No description provided for @languageAlbanian.
  ///
  /// In en, this message translates to:
  /// **'Albanian'**
  String get languageAlbanian;

  /// No description provided for @languageFrench.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get languageFrench;

  /// No description provided for @languageSpanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get languageSpanish;

  /// No description provided for @languageRussian.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get languageRussian;

  /// No description provided for @languageHebrew.
  ///
  /// In en, this message translates to:
  /// **'Hebrew'**
  String get languageHebrew;

  /// No description provided for @languageArabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get languageArabic;

  /// No description provided for @sessionRestPause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get sessionRestPause;

  /// No description provided for @sessionRestResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get sessionRestResume;

  /// No description provided for @sessionRestPaused.
  ///
  /// In en, this message translates to:
  /// **'Timer paused'**
  String get sessionRestPaused;

  /// No description provided for @volumeLegend.
  ///
  /// In en, this message translates to:
  /// **'Total weight × reps per muscle group on each day.'**
  String get volumeLegend;

  /// No description provided for @bestLiftLegend.
  ///
  /// In en, this message translates to:
  /// **'Top weight recorded per exercise across the selected history.'**
  String get bestLiftLegend;

  /// No description provided for @categoryVolumeTitle.
  ///
  /// In en, this message translates to:
  /// **'Volume by muscle group'**
  String get categoryVolumeTitle;

  /// No description provided for @exerciseProgressionTitle.
  ///
  /// In en, this message translates to:
  /// **'Exercise progression'**
  String get exerciseProgressionTitle;

  /// No description provided for @exerciseProgressionLegend.
  ///
  /// In en, this message translates to:
  /// **'Best weight logged per session for the selected exercise.'**
  String get exerciseProgressionLegend;

  /// No description provided for @noExerciseData.
  ///
  /// In en, this message translates to:
  /// **'No exercise data yet.'**
  String get noExerciseData;

  /// No description provided for @sessionDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete session?'**
  String get sessionDeleteTitle;

  /// No description provided for @sessionDeleteMessage.
  ///
  /// In en, this message translates to:
  /// **'This will remove the session and its exercise logs.'**
  String get sessionDeleteMessage;

  /// No description provided for @deleteSession.
  ///
  /// In en, this message translates to:
  /// **'Delete session'**
  String get deleteSession;

  /// No description provided for @sessionDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Session details'**
  String get sessionDetailTitle;

  /// No description provided for @sessionDetailClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get sessionDetailClose;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'he',
    'it',
    'ru',
    'sq',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'he':
      return AppLocalizationsHe();
    case 'it':
      return AppLocalizationsIt();
    case 'ru':
      return AppLocalizationsRu();
    case 'sq':
      return AppLocalizationsSq();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
