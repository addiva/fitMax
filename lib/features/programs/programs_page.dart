import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/training_program.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/empty_state.dart';
import '../settings/settings_sheet.dart';
import 'providers/programs_controller.dart';
import 'providers/programs_providers.dart';

class ProgramsPage extends ConsumerStatefulWidget {
  const ProgramsPage({super.key});

  @override
  ConsumerState<ProgramsPage> createState() => _ProgramsPageState();
}

class _ProgramsPageState extends ConsumerState<ProgramsPage> {
  ProviderSubscription<WorkoutProgram?>? _selectedProgramSub;
  ProviderSubscription<AsyncValue<void>>? _controllerSub;

  @override
  void initState() {
    super.initState();
    _selectedProgramSub = ref.listenManual<WorkoutProgram?>(
      selectedProgramProvider,
      (previous, next) {
        if (next == null) {
          return;
        }
        final selectedWeek = ref.read(selectedWeekProvider);
        if (selectedWeek > next.weeks.total) {
          ref.read(selectedWeekProvider.notifier).set(1);
        }
      },
    );

    _controllerSub = ref.listenManual<AsyncValue<void>>(
      programsControllerProvider,
      (previous, next) {
        next.whenOrNull(
          error: (error, stackTrace) =>
              _showErrorSnack(context, message: error.toString()),
        );
      },
    );
  }

  @override
  void dispose() {
    _selectedProgramSub?.close();
    _controllerSub?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final bootstrap = ref.watch(programsBootstrapProvider);
    final controllerState = ref.watch(programsControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.tabPrograms),
        actions: [
          IconButton(
            tooltip: l10n.importFromFile,
            icon: const Icon(Icons.file_open_outlined),
            onPressed: controllerState.isLoading
                ? null
                : () => _onImportFile(context),
          ),
          IconButton(
            tooltip: l10n.importFromUrl,
            icon: const Icon(Icons.link_outlined),
            onPressed: controllerState.isLoading
                ? null
                : () => _onImportFromUrl(context),
          ),
          IconButton(
            tooltip: l10n.importFromClipboard,
            icon: const Icon(Icons.content_paste_go_outlined),
            onPressed: controllerState.isLoading
                ? null
                : () => _onImportFromClipboard(context),
          ),
          IconButton(
            tooltip: l10n.settings,
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => SettingsSheet.show(context),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: controllerState.isLoading
            ? null
            : () => _showAddOptions(context),
        icon: const Icon(Icons.add),
        label: Text(l10n.actionAdd),
      ),
      body: Column(
        children: [
          if (controllerState.isLoading)
            const LinearProgressIndicator(minHeight: 2),
          Expanded(
            child: bootstrap.when(
              data: (_) => _ProgramsContent(controllerState: controllerState),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text('${l10n.programImportError}\n$error'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onImportFile(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    try {
      final program = await ref
          .read(programsControllerProvider.notifier)
          .importFromFile();
      if (!context.mounted) return;
      if (program != null) {
        _showSnack(context, l10n.programImportedMessage(program.name));
        ref.read(selectedProgramIdProvider.notifier).set(program.id);
      }
    } catch (_) {
      if (!context.mounted) return;
      _showSnack(context, l10n.programImportError);
    }
  }

  Future<void> _onImportFromClipboard(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    try {
      final program = await ref
          .read(programsControllerProvider.notifier)
          .importFromClipboard();
      if (!context.mounted) return;
      if (program != null) {
        _showSnack(context, l10n.programImportedMessage(program.name));
        ref.read(selectedProgramIdProvider.notifier).set(program.id);
      }
    } catch (_) {
      if (!context.mounted) return;
      _showSnack(context, l10n.programImportError);
    }
  }

  Future<void> _onImportFromUrl(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.importFromUrl),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: l10n.urlPromptLabel,
            hintText: l10n.urlPromptHint,
          ),
          autofocus: true,
          keyboardType: TextInputType.url,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.actionCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(controller.text.trim()),
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );

    if (result == null || result.isEmpty) {
      return;
    }

    try {
      final program = await ref
          .read(programsControllerProvider.notifier)
          .importFromUrl(result);
      if (!context.mounted) return;
      if (program != null) {
        _showSnack(context, l10n.programImportedMessage(program.name));
        ref.read(selectedProgramIdProvider.notifier).set(program.id);
      }
    } catch (_) {
      if (!context.mounted) return;
      _showSnack(context, l10n.programImportError);
    }
  }

  Future<void> _showAddOptions(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    await showModalBottomSheet<void>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.file_open_outlined),
              title: Text(l10n.importFromFile),
              onTap: () async {
                Navigator.of(context).pop();
                await _onImportFile(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.link_outlined),
              title: Text(l10n.importFromUrl),
              onTap: () async {
                Navigator.of(context).pop();
                await _onImportFromUrl(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.content_paste_go_outlined),
              title: Text(l10n.importFromClipboard),
              onTap: () async {
                Navigator.of(context).pop();
                await _onImportFromClipboard(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _showErrorSnack(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

}

class _ProgramsContent extends ConsumerWidget {
  const _ProgramsContent({required this.controllerState});

  final AsyncValue<void> controllerState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final programsAsync = ref.watch(programsStreamProvider);
    final selectedProgram = ref.watch(selectedProgramProvider);

    return programsAsync.when(
      data: (programs) {
        if (programs.isEmpty) {
          return EmptyState(
            icon: Icons.view_list_outlined,
            title: l10n.programsEmptyTitle,
            subtitle: l10n.programsEmptySubtitle,
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
          itemCount: programs.length,
          separatorBuilder: (context, _) => const SizedBox(height: 12),
          itemBuilder: (context, index) => Card(
            child: _ProgramTile(
              program: programs[index],
              isSelected: selectedProgram?.id == programs[index].id,
              onAction: (action) =>
                  _onProgramAction(context, ref, action, programs[index]),
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text('${l10n.programImportError}\n$error'),
        ),
      ),
    );
  }

  Future<void> _onProgramAction(
    BuildContext context,
    WidgetRef ref,
    _ProgramAction action,
    WorkoutProgram program,
  ) async {
    switch (action) {
      case _ProgramAction.rename:
        return _renameProgram(context, ref, program);
      case _ProgramAction.export:
        return _exportProgram(context, ref, program);
      case _ProgramAction.delete:
        return _deleteProgram(context, ref, program);
    }
  }

  Future<void> _renameProgram(
    BuildContext context,
    WidgetRef ref,
    WorkoutProgram program,
  ) async {
    final l10n = AppLocalizations.of(context);
    final controller = TextEditingController(text: program.name);
    final newName = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.renameProgram),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(labelText: l10n.programNameHint),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.actionCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(controller.text.trim()),
            child: Text(l10n.actionSave),
          ),
        ],
      ),
    );

    if (newName == null || newName.isEmpty || newName == program.name) {
      return;
    }

    try {
      await ref
          .read(programsControllerProvider.notifier)
          .renameProgram(programId: program.id, newName: newName);
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.programRenamedMessage(newName))),
      );
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.programRenameError)),
      );
    }
  }

  Future<void> _exportProgram(
    BuildContext context,
    WidgetRef ref,
    WorkoutProgram program,
  ) async {
    final l10n = AppLocalizations.of(context);
    try {
      final json = await ref
          .read(programsControllerProvider.notifier)
          .exportProgram(program.id);
      await Clipboard.setData(ClipboardData(text: json));
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.programExportCopiedMessage)),
      );
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.programImportError)),
      );
    }
  }

  Future<void> _deleteProgram(
    BuildContext context,
    WidgetRef ref,
    WorkoutProgram program,
  ) async {
    final l10n = AppLocalizations.of(context);
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.programDeleteConfirmTitle),
        content: Text(l10n.programDeleteConfirmMessage(program.name)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.actionCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );

    if (confirm != true) {
      return;
    }

    try {
      await ref
          .read(programsControllerProvider.notifier)
          .deleteProgram(program.id);
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.programDeletedMessage(program.name))),
      );
      final programs = ref.read(programsStreamProvider).asData?.value;
      if (programs != null && programs.isNotEmpty) {
        ref.read(selectedProgramIdProvider.notifier).set(programs.first.id);
      }
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.programDeleteError)),
      );
    }
  }
}

enum _ProgramAction { rename, export, delete }

class _ProgramTile extends ConsumerWidget {
  const _ProgramTile({
    required this.program,
    required this.isSelected,
    required this.onAction,
  });

  final WorkoutProgram program;
  final bool isSelected;
  final ValueChanged<_ProgramAction> onAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return ListTile(
      selected: isSelected,
      title: Text(program.name),
      subtitle: Text('${l10n.weeksCount}: ${program.weeks.total}'),
      onTap: () {
        ref.read(selectedProgramIdProvider.notifier).set(program.id);
        ref.read(selectedWeekProvider.notifier).set(1);
      },
      trailing: PopupMenuButton<_ProgramAction>(
        icon: const Icon(Icons.more_vert),
        onSelected: onAction,
        itemBuilder: (context) => [
          PopupMenuItem(
            value: _ProgramAction.rename,
            child: ListTile(
              leading: const Icon(Icons.drive_file_rename_outline),
              title: Text(l10n.actionRename),
            ),
          ),
          PopupMenuItem(
            value: _ProgramAction.export,
            child: ListTile(
              leading: const Icon(Icons.download_outlined),
              title: Text(l10n.exportProgram),
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            value: _ProgramAction.delete,
            child: ListTile(
              leading: const Icon(Icons.delete_outline),
              title: Text(l10n.actionDelete),
            ),
          ),
        ],
      ),
    );
  }
}
