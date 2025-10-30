// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'FitMax';

  @override
  String get tabPrograms => 'Programas';

  @override
  String get tabStatistics => 'Estadísticas';

  @override
  String get tabSession => 'Sesión';

  @override
  String get actionAdd => 'Agregar';

  @override
  String get actionEdit => 'Editar';

  @override
  String get actionDelete => 'Eliminar';

  @override
  String get actionSave => 'Guardar';

  @override
  String get actionCancel => 'Cancelar';

  @override
  String get themeLabel => 'Tema';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get languageLabel => 'Idioma';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get languageItalian => 'Italiano';

  @override
  String get languageEnglish => 'Inglés';

  @override
  String get programsEmptyTitle => 'Sin programas';

  @override
  String get programsEmptySubtitle =>
      'Importa un plan en JSON o crea uno nuevo para comenzar.';

  @override
  String get importFromFile => 'Importar desde archivo';

  @override
  String get importFromUrl => 'Importar desde URL';

  @override
  String get programName => 'Nombre del programa';

  @override
  String get programNote => 'Nota';

  @override
  String get weeksCount => 'Semanas';

  @override
  String get select => 'Seleccionar';

  @override
  String get sessionStart => 'Iniciar sesión';

  @override
  String get sessionResume => 'Reanudar';

  @override
  String get sessionEnd => 'Finalizar sesión';

  @override
  String get sessionRest => 'Descanso';

  @override
  String get sessionRestStart => 'Inicio';

  @override
  String get sessionRestReset => 'Reiniciar';

  @override
  String get statisticsEmpty => 'Agrega una sesión para ver las estadísticas.';

  @override
  String get calendarTitle => 'Calendario de entrenamiento';

  @override
  String get filtersTitle => 'Filtros';

  @override
  String get weekCurrentToggle => 'Mostrar solo la semana actual';

  @override
  String get suggestedSessionTitle => 'Sesión sugerida';

  @override
  String get suggestedSessionReason => 'Basada en tu último entrenamiento.';

  @override
  String get exportData => 'Exportar datos';

  @override
  String get importData => 'Importar datos';

  @override
  String get deleteConfirmation => '¿Estás seguro?';

  @override
  String get deleteProgramDescription =>
      'Esto eliminará el programa y sus datos locales.';

  @override
  String get actionRename => 'Renombrar';

  @override
  String get importFromClipboard => 'Importar desde el portapapeles';

  @override
  String get exportProgram => 'Exportar JSON';

  @override
  String get renameProgram => 'Renombrar programa';

  @override
  String get programNameHint => 'Nombre del programa';

  @override
  String get programDeleteConfirmTitle => '¿Eliminar programa?';

  @override
  String programDeleteConfirmMessage(Object name) {
    return 'Esto eliminará $name y su historial.';
  }

  @override
  String weekLabel(int number) {
    return 'Semana $number';
  }

  @override
  String get deloadWeekLabel => 'Descarga';

  @override
  String get setsShort => 'Series';

  @override
  String get repsShort => 'Reps';

  @override
  String get restShort => 'Desc';

  @override
  String get bufShort => 'BUF';

  @override
  String get tutShort => 'TUT';

  @override
  String get intensityShort => 'Intensidad';

  @override
  String get notesShort => 'Notas';

  @override
  String get videoShort => 'Video';

  @override
  String programImportedMessage(Object name) {
    return 'Se importó $name.';
  }

  @override
  String programDeletedMessage(Object name) {
    return 'Se eliminó $name.';
  }

  @override
  String programRenamedMessage(Object name) {
    return 'Renombrado a $name.';
  }

  @override
  String get programExportCopiedMessage => 'JSON copiado al portapapeles.';

  @override
  String get programImportError => 'No se pudo importar el programa.';

  @override
  String get programDeleteError => 'No se pudo eliminar el programa.';

  @override
  String get programRenameError => 'No se pudo renombrar el programa.';

  @override
  String get urlPromptLabel => 'URL del programa';

  @override
  String get urlPromptHint => 'https://example.com/program.json';

  @override
  String get confirm => 'Confirmar';

  @override
  String get close => 'Cerrar';

  @override
  String lastSessionLabel(Object date) {
    return 'Última sesión: $date';
  }

  @override
  String get noSessionsYet => 'Aún no hay sesiones registradas.';

  @override
  String get weightShort => 'Peso';

  @override
  String get sessionFinishConfirmMessage => '¿Guardar y cerrar esta sesión?';

  @override
  String get settings => 'Configuración';

  @override
  String get allProgramsOption => 'Todos los programas';

  @override
  String get volumeLabel => 'Volumen';

  @override
  String get bestLiftLabel => 'Mejores pesos';

  @override
  String get copiedToClipboard => 'Copiado al portapapeles.';

  @override
  String importedSessionsMessage(int count) {
    return 'Se importaron $count sesiones.';
  }

  @override
  String get noSessionsForDay => 'No hay sesiones para este día.';

  @override
  String get fileSaveUnsupported =>
      'Esta plataforma no permite guardar. JSON copiado.';

  @override
  String get totalSessionsLabel => 'Sesiones';

  @override
  String get averageLabel => 'Promedio';

  @override
  String get accentColorLabel => 'Color de acento';

  @override
  String get accentColorCustom => 'Color personalizado';

  @override
  String get accentColorReset => 'Restablecer';

  @override
  String get languageGerman => 'Alemán';

  @override
  String get languageAlbanian => 'Albanés';

  @override
  String get languageFrench => 'Francés';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageRussian => 'Ruso';

  @override
  String get languageHebrew => 'Hebreo';

  @override
  String get languageArabic => 'Árabe';

  @override
  String get sessionRestPause => 'Pausa';

  @override
  String get sessionRestResume => 'Reanudar';

  @override
  String get sessionRestPaused => 'Temporizador en pausa';

  @override
  String get volumeLegend =>
      'Peso total × repeticiones por grupo muscular y por día.';

  @override
  String get bestLiftLegend =>
      'Mayor peso registrado por ejercicio en el período seleccionado.';

  @override
  String get categoryVolumeTitle => 'Volumen por grupo muscular';

  @override
  String get exerciseProgressionTitle => 'Progresión del ejercicio';

  @override
  String get exerciseProgressionLegend =>
      'Mejor peso por sesión para el ejercicio seleccionado.';

  @override
  String get noExerciseData => 'Aún no hay datos de ejercicios.';

  @override
  String get sessionDeleteTitle => '¿Eliminar sesión?';

  @override
  String get sessionDeleteMessage => 'Se eliminarán la sesión y sus registros.';

  @override
  String get deleteSession => 'Eliminar sesión';

  @override
  String get sessionDetailTitle => 'Detalles de la sesión';

  @override
  String get sessionDetailClose => 'Cerrar';
}
