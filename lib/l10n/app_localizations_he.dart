// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'FitMax';

  @override
  String get tabPrograms => 'תוכניות';

  @override
  String get tabStatistics => 'סטטיסטיקות';

  @override
  String get tabSession => 'אימון';

  @override
  String get actionAdd => 'הוסף';

  @override
  String get actionEdit => 'ערוך';

  @override
  String get actionDelete => 'מחק';

  @override
  String get actionSave => 'שמור';

  @override
  String get actionCancel => 'בטל';

  @override
  String get themeLabel => 'ערכת נושא';

  @override
  String get themeSystem => 'מערכת';

  @override
  String get themeLight => 'בהיר';

  @override
  String get themeDark => 'כהה';

  @override
  String get languageLabel => 'שפה';

  @override
  String get languageSystem => 'מערכת';

  @override
  String get languageItalian => 'איטלקית';

  @override
  String get languageEnglish => 'אנגלית';

  @override
  String get programsEmptyTitle => 'אין תוכניות';

  @override
  String get programsEmptySubtitle =>
      'ייבא תוכנית JSON או צור חדשה כדי להתחיל.';

  @override
  String get importFromFile => 'ייבא מקובץ';

  @override
  String get importFromUrl => 'ייבא מכתובת URL';

  @override
  String get programName => 'שם התוכנית';

  @override
  String get programNote => 'הערה';

  @override
  String get weeksCount => 'שבועות';

  @override
  String get select => 'בחר';

  @override
  String get sessionStart => 'התחל אימון';

  @override
  String get sessionResume => 'המשך';

  @override
  String get sessionEnd => 'סיים אימון';

  @override
  String get sessionRest => 'מנוחה';

  @override
  String get sessionRestStart => 'התחל';

  @override
  String get sessionRestReset => 'איפוס';

  @override
  String get statisticsEmpty => 'הוסף אימון כדי לראות נתונים.';

  @override
  String get calendarTitle => 'יומן אימונים';

  @override
  String get filtersTitle => 'מסננים';

  @override
  String get weekCurrentToggle => 'הצג רק את השבוע הנוכחי';

  @override
  String get suggestedSessionTitle => 'אימון מוצע';

  @override
  String get suggestedSessionReason => 'מבוסס על האימון האחרון שלך.';

  @override
  String get exportData => 'ייצוא נתונים';

  @override
  String get importData => 'ייבוא נתונים';

  @override
  String get deleteConfirmation => 'האם אתה בטוח?';

  @override
  String get deleteProgramDescription =>
      'פעולה זו תמחק את התוכנית ואת הנתונים המקומיים.';

  @override
  String get actionRename => 'שנה שם';

  @override
  String get importFromClipboard => 'ייבא מלוח הגזירים';

  @override
  String get exportProgram => 'ייצא JSON';

  @override
  String get renameProgram => 'שנה שם לתוכנית';

  @override
  String get programNameHint => 'שם התוכנית';

  @override
  String get programDeleteConfirmTitle => 'למחוק תוכנית?';

  @override
  String programDeleteConfirmMessage(Object name) {
    return 'זה ימחק את $name ואת ההיסטוריה שלו.';
  }

  @override
  String weekLabel(int number) {
    return 'שבוע $number';
  }

  @override
  String get deloadWeekLabel => 'שבוע הורדת עומס';

  @override
  String get setsShort => 'סטים';

  @override
  String get repsShort => 'חזרות';

  @override
  String get restShort => 'מנוחה';

  @override
  String get bufShort => 'BUF';

  @override
  String get tutShort => 'TUT';

  @override
  String get intensityShort => 'עוצמה';

  @override
  String get notesShort => 'הערות';

  @override
  String get videoShort => 'וידאו';

  @override
  String programImportedMessage(Object name) {
    return '$name יובאה.';
  }

  @override
  String programDeletedMessage(Object name) {
    return '$name נמחקה.';
  }

  @override
  String programRenamedMessage(Object name) {
    return 'שונה השם ל-$name.';
  }

  @override
  String get programExportCopiedMessage => 'JSON הועתק ללוח הגזירים.';

  @override
  String get programImportError => 'לא ניתן היה לייבא את התוכנית.';

  @override
  String get programDeleteError => 'לא ניתן היה למחוק את התוכנית.';

  @override
  String get programRenameError => 'לא ניתן היה לשנות את שם התוכנית.';

  @override
  String get urlPromptLabel => 'כתובת URL של התוכנית';

  @override
  String get urlPromptHint => 'https://example.com/program.json';

  @override
  String get confirm => 'אישור';

  @override
  String get close => 'סגור';

  @override
  String lastSessionLabel(Object date) {
    return 'אימון אחרון: $date';
  }

  @override
  String get noSessionsYet => 'עדיין אין אימונים רשומים.';

  @override
  String get weightShort => 'משקל';

  @override
  String get sessionFinishConfirmMessage => 'לשמור ולסגור את האימון?';

  @override
  String get settings => 'הגדרות';

  @override
  String get allProgramsOption => 'כל התוכניות';

  @override
  String get volumeLabel => 'נפח';

  @override
  String get bestLiftLabel => 'משקלים גבוהים';

  @override
  String get copiedToClipboard => 'הועתק ללוח הגזירים.';

  @override
  String importedSessionsMessage(int count) {
    return 'יובאו $count אימונים.';
  }

  @override
  String get noSessionsForDay => 'אין אימונים ביום זה.';

  @override
  String get fileSaveUnsupported =>
      'שמירה בפלטפורמה זו אינה נתמכת. JSON הועתק.';

  @override
  String get totalSessionsLabel => 'אימונים';

  @override
  String get averageLabel => 'ממוצע';

  @override
  String get accentColorLabel => 'צבע הדגשה';

  @override
  String get accentColorCustom => 'צבע מותאם אישית';

  @override
  String get accentColorReset => 'איפוס';

  @override
  String get languageGerman => 'גרמנית';

  @override
  String get languageAlbanian => 'אלבנית';

  @override
  String get languageFrench => 'צרפתית';

  @override
  String get languageSpanish => 'ספרדית';

  @override
  String get languageRussian => 'רוסית';

  @override
  String get languageHebrew => 'עברית';

  @override
  String get languageArabic => 'ערבית';

  @override
  String get sessionRestPause => 'השהה';

  @override
  String get sessionRestResume => 'המשך';

  @override
  String get sessionRestPaused => 'הטיימר הושהה';

  @override
  String get volumeLegend => 'משקל כולל × חזרות לכל קבוצת שרירים לפי יום.';

  @override
  String get bestLiftLegend =>
      'המשקל הגבוה ביותר שנרשם לכל תרגיל בתקופה שנבחרה.';

  @override
  String get categoryVolumeTitle => 'נפח לפי קבוצת שרירים';

  @override
  String get exerciseProgressionTitle => 'התקדמות תרגיל';

  @override
  String get exerciseProgressionLegend =>
      'המשקל הטוב ביותר לכל אימון עבור התרגיל שנבחר.';

  @override
  String get noExerciseData => 'עדיין אין נתוני תרגילים.';

  @override
  String get sessionDeleteTitle => 'למחוק את האימון?';

  @override
  String get sessionDeleteMessage => 'האימון והנתונים שלו יימחקו.';

  @override
  String get deleteSession => 'מחק אימון';

  @override
  String get sessionDetailTitle => 'פרטי האימון';

  @override
  String get sessionDetailClose => 'סגור';
}
