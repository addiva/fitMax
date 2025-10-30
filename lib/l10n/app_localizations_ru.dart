// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'FitMax';

  @override
  String get tabPrograms => 'Программы';

  @override
  String get tabStatistics => 'Статистика';

  @override
  String get tabSession => 'Сессия';

  @override
  String get actionAdd => 'Добавить';

  @override
  String get actionEdit => 'Редактировать';

  @override
  String get actionDelete => 'Удалить';

  @override
  String get actionSave => 'Сохранить';

  @override
  String get actionCancel => 'Отменить';

  @override
  String get themeLabel => 'Тема';

  @override
  String get themeSystem => 'Система';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get languageLabel => 'Язык';

  @override
  String get languageSystem => 'Система';

  @override
  String get languageItalian => 'Итальянский';

  @override
  String get languageEnglish => 'Английский';

  @override
  String get programsEmptyTitle => 'Пока нет программ';

  @override
  String get programsEmptySubtitle =>
      'Импортируйте план в формате JSON или создайте новый, чтобы начать.';

  @override
  String get importFromFile => 'Импорт из файла';

  @override
  String get importFromUrl => 'Импорт по URL';

  @override
  String get programName => 'Название программы';

  @override
  String get programNote => 'Заметка';

  @override
  String get weeksCount => 'Недели';

  @override
  String get select => 'Выбрать';

  @override
  String get sessionStart => 'Начать сессию';

  @override
  String get sessionResume => 'Продолжить';

  @override
  String get sessionEnd => 'Завершить сессию';

  @override
  String get sessionRest => 'Отдых';

  @override
  String get sessionRestStart => 'Начать';

  @override
  String get sessionRestReset => 'Сброс';

  @override
  String get statisticsEmpty => 'Добавьте сессию, чтобы увидеть статистику.';

  @override
  String get calendarTitle => 'Календарь тренировок';

  @override
  String get filtersTitle => 'Фильтры';

  @override
  String get weekCurrentToggle => 'Показывать только текущую неделю';

  @override
  String get suggestedSessionTitle => 'Рекомендуемая сессия';

  @override
  String get suggestedSessionReason =>
      'Основано на вашей последней тренировке.';

  @override
  String get exportData => 'Экспорт данных';

  @override
  String get importData => 'Импорт данных';

  @override
  String get deleteConfirmation => 'Вы уверены?';

  @override
  String get deleteProgramDescription =>
      'Это удалит программу и локальные данные.';

  @override
  String get actionRename => 'Переименовать';

  @override
  String get importFromClipboard => 'Импорт из буфера обмена';

  @override
  String get exportProgram => 'Экспорт JSON';

  @override
  String get renameProgram => 'Переименовать программу';

  @override
  String get programNameHint => 'Название программы';

  @override
  String get programDeleteConfirmTitle => 'Удалить программу?';

  @override
  String programDeleteConfirmMessage(Object name) {
    return 'Это удалит $name и всю историю.';
  }

  @override
  String weekLabel(int number) {
    return 'Неделя $number';
  }

  @override
  String get deloadWeekLabel => 'Разгрузка';

  @override
  String get setsShort => 'Подх.';

  @override
  String get repsShort => 'Повт.';

  @override
  String get restShort => 'Отдых';

  @override
  String get bufShort => 'BUF';

  @override
  String get tutShort => 'TUT';

  @override
  String get intensityShort => 'Инт.';

  @override
  String get notesShort => 'Заметки';

  @override
  String get videoShort => 'Видео';

  @override
  String programImportedMessage(Object name) {
    return '$name импортирована.';
  }

  @override
  String programDeletedMessage(Object name) {
    return '$name удалена.';
  }

  @override
  String programRenamedMessage(Object name) {
    return 'Переименовано в $name.';
  }

  @override
  String get programExportCopiedMessage => 'JSON скопирован в буфер обмена.';

  @override
  String get programImportError => 'Не удалось импортировать программу.';

  @override
  String get programDeleteError => 'Не удалось удалить программу.';

  @override
  String get programRenameError => 'Не удалось переименовать программу.';

  @override
  String get urlPromptLabel => 'URL программы';

  @override
  String get urlPromptHint => 'https://example.com/program.json';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get close => 'Закрыть';

  @override
  String lastSessionLabel(Object date) {
    return 'Последняя сессия: $date';
  }

  @override
  String get noSessionsYet => 'Сессии пока не записаны.';

  @override
  String get weightShort => 'Вес';

  @override
  String get sessionFinishConfirmMessage => 'Сохранить и закрыть эту сессию?';

  @override
  String get settings => 'Настройки';

  @override
  String get allProgramsOption => 'Все программы';

  @override
  String get volumeLabel => 'Объём';

  @override
  String get bestLiftLabel => 'Лучшие веса';

  @override
  String get copiedToClipboard => 'Скопировано в буфер обмена.';

  @override
  String importedSessionsMessage(int count) {
    return 'Импортировано сессий: $count.';
  }

  @override
  String get noSessionsForDay => 'Нет сессий на этот день.';

  @override
  String get fileSaveUnsupported =>
      'Сохранение на этой платформе недоступно. JSON скопирован.';

  @override
  String get totalSessionsLabel => 'Сессии';

  @override
  String get averageLabel => 'Среднее';

  @override
  String get accentColorLabel => 'Акцентный цвет';

  @override
  String get accentColorCustom => 'Пользовательский цвет';

  @override
  String get accentColorReset => 'Сброс';

  @override
  String get languageGerman => 'Немецкий';

  @override
  String get languageAlbanian => 'Албанский';

  @override
  String get languageFrench => 'Французский';

  @override
  String get languageSpanish => 'Испанский';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageHebrew => 'Иврит';

  @override
  String get languageArabic => 'Арабский';

  @override
  String get sessionRestPause => 'Пауза';

  @override
  String get sessionRestResume => 'Продолжить';

  @override
  String get sessionRestPaused => 'Таймер на паузе';

  @override
  String get volumeLegend =>
      'Общий вес × повторения для каждой мышечной группы по дням.';

  @override
  String get bestLiftLegend =>
      'Наибольший вес по упражнению за выбранный период.';

  @override
  String get categoryVolumeTitle => 'Объём по мышечным группам';

  @override
  String get exerciseProgressionTitle => 'Прогресс упражнения';

  @override
  String get exerciseProgressionLegend =>
      'Лучший вес за сессию для выбранного упражнения.';

  @override
  String get noExerciseData => 'Пока нет данных упражнений.';

  @override
  String get sessionDeleteTitle => 'Удалить сессию?';

  @override
  String get sessionDeleteMessage => 'Сессия и её записи будут удалены.';

  @override
  String get deleteSession => 'Удалить сессию';

  @override
  String get sessionDetailTitle => 'Подробности сессии';

  @override
  String get sessionDetailClose => 'Закрыть';
}
