// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'FitMax';

  @override
  String get tabPrograms => 'البرامج';

  @override
  String get tabStatistics => 'الإحصائيات';

  @override
  String get tabSession => 'الجلسة';

  @override
  String get actionAdd => 'إضافة';

  @override
  String get actionEdit => 'تعديل';

  @override
  String get actionDelete => 'حذف';

  @override
  String get actionSave => 'حفظ';

  @override
  String get actionCancel => 'إلغاء';

  @override
  String get themeLabel => 'السمة';

  @override
  String get themeSystem => 'النظام';

  @override
  String get themeLight => 'فاتحة';

  @override
  String get themeDark => 'داكنة';

  @override
  String get languageLabel => 'اللغة';

  @override
  String get languageSystem => 'النظام';

  @override
  String get languageItalian => 'الإيطالية';

  @override
  String get languageEnglish => 'الإنجليزية';

  @override
  String get programsEmptyTitle => 'لا توجد برامج';

  @override
  String get programsEmptySubtitle =>
      'قم باستيراد خطة بصيغة JSON أو أنشئ خطة جديدة للبدء.';

  @override
  String get importFromFile => 'استيراد من ملف';

  @override
  String get importFromUrl => 'استيراد من رابط';

  @override
  String get programName => 'اسم البرنامج';

  @override
  String get programNote => 'ملاحظة';

  @override
  String get weeksCount => 'الأسابيع';

  @override
  String get select => 'اختيار';

  @override
  String get sessionStart => 'بدء الجلسة';

  @override
  String get sessionResume => 'استئناف';

  @override
  String get sessionEnd => 'إنهاء الجلسة';

  @override
  String get sessionRest => 'استراحة';

  @override
  String get sessionRestStart => 'بدء';

  @override
  String get sessionRestReset => 'إعادة تعيين';

  @override
  String get statisticsEmpty => 'أضف جلسة لترى الإحصائيات.';

  @override
  String get calendarTitle => 'تقويم التدريب';

  @override
  String get filtersTitle => 'عوامل التصفية';

  @override
  String get weekCurrentToggle => 'عرض الأسبوع الحالي فقط';

  @override
  String get suggestedSessionTitle => 'جلسة مقترحة';

  @override
  String get suggestedSessionReason => 'استنادًا إلى آخر تمرين لك.';

  @override
  String get exportData => 'تصدير البيانات';

  @override
  String get importData => 'استيراد البيانات';

  @override
  String get deleteConfirmation => 'هل أنت متأكد؟';

  @override
  String get deleteProgramDescription => 'سيتم حذف البرنامج والبيانات المحلية.';

  @override
  String get actionRename => 'إعادة تسمية';

  @override
  String get importFromClipboard => 'استيراد من الحافظة';

  @override
  String get exportProgram => 'تصدير JSON';

  @override
  String get renameProgram => 'إعادة تسمية البرنامج';

  @override
  String get programNameHint => 'اسم البرنامج';

  @override
  String get programDeleteConfirmTitle => 'حذف البرنامج؟';

  @override
  String programDeleteConfirmMessage(Object name) {
    return 'سيتم حذف $name وسجله.';
  }

  @override
  String weekLabel(int number) {
    return 'الأسبوع $number';
  }

  @override
  String get deloadWeekLabel => 'أسبوع تخفيف الحمل';

  @override
  String get setsShort => 'مجاميع';

  @override
  String get repsShort => 'تكرارات';

  @override
  String get restShort => 'راحة';

  @override
  String get bufShort => 'BUF';

  @override
  String get tutShort => 'TUT';

  @override
  String get intensityShort => 'الجهد';

  @override
  String get notesShort => 'ملاحظات';

  @override
  String get videoShort => 'فيديو';

  @override
  String programImportedMessage(Object name) {
    return 'تم استيراد $name.';
  }

  @override
  String programDeletedMessage(Object name) {
    return 'تم حذف $name.';
  }

  @override
  String programRenamedMessage(Object name) {
    return 'تمت إعادة تسميته إلى $name.';
  }

  @override
  String get programExportCopiedMessage => 'تم نسخ JSON إلى الحافظة.';

  @override
  String get programImportError => 'تعذّر استيراد البرنامج.';

  @override
  String get programDeleteError => 'تعذّر حذف البرنامج.';

  @override
  String get programRenameError => 'تعذّر إعادة تسمية البرنامج.';

  @override
  String get urlPromptLabel => 'رابط البرنامج';

  @override
  String get urlPromptHint => 'https://example.com/program.json';

  @override
  String get confirm => 'تأكيد';

  @override
  String get close => 'إغلاق';

  @override
  String lastSessionLabel(Object date) {
    return 'آخر جلسة: $date';
  }

  @override
  String get noSessionsYet => 'لا توجد جلسات مسجلة بعد.';

  @override
  String get weightShort => 'الوزن';

  @override
  String get sessionFinishConfirmMessage => 'هل تريد حفظ هذه الجلسة وإغلاقها؟';

  @override
  String get settings => 'الإعدادات';

  @override
  String get allProgramsOption => 'جميع البرامج';

  @override
  String get volumeLabel => 'الحجم';

  @override
  String get bestLiftLabel => 'أثقل الأوزان';

  @override
  String get copiedToClipboard => 'تم النسخ إلى الحافظة.';

  @override
  String importedSessionsMessage(int count) {
    return 'تم استيراد $count جلسات.';
  }

  @override
  String get noSessionsForDay => 'لا توجد جلسات لهذا اليوم.';

  @override
  String get fileSaveUnsupported =>
      'الحفظ غير مدعوم على هذا النظام. تم نسخ JSON.';

  @override
  String get totalSessionsLabel => 'جلسات';

  @override
  String get averageLabel => 'المتوسط';

  @override
  String get accentColorLabel => 'لون مميز';

  @override
  String get accentColorCustom => 'لون مخصص';

  @override
  String get accentColorReset => 'إعادة تعيين';

  @override
  String get languageGerman => 'الألمانية';

  @override
  String get languageAlbanian => 'الألبانية';

  @override
  String get languageFrench => 'الفرنسية';

  @override
  String get languageSpanish => 'الإسبانية';

  @override
  String get languageRussian => 'الروسية';

  @override
  String get languageHebrew => 'العبرية';

  @override
  String get languageArabic => 'العربية';

  @override
  String get sessionRestPause => 'إيقاف مؤقت';

  @override
  String get sessionRestResume => 'استئناف';

  @override
  String get sessionRestPaused => 'المؤقت متوقف';

  @override
  String get volumeLegend =>
      'الوزن الكلي × التكرارات لكل مجموعة عضلية حسب اليوم.';

  @override
  String get bestLiftLegend => 'أعلى وزن مسجل لكل تمرين خلال الفترة المحددة.';

  @override
  String get categoryVolumeTitle => 'الحجم حسب مجموعة العضلات';

  @override
  String get exerciseProgressionTitle => 'تقدم التمرين';

  @override
  String get exerciseProgressionLegend => 'أفضل وزن لكل جلسة للتمرين المحدد.';

  @override
  String get noExerciseData => 'لا توجد بيانات تمارين بعد.';

  @override
  String get sessionDeleteTitle => 'حذف الجلسة؟';

  @override
  String get sessionDeleteMessage => 'سيتم حذف الجلسة وسجلاتها.';

  @override
  String get deleteSession => 'حذف الجلسة';

  @override
  String get sessionDetailTitle => 'تفاصيل الجلسة';

  @override
  String get sessionDetailClose => 'إغلاق';
}
