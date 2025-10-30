import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/settings/app_settings_controller.dart';
import '../../app/settings/app_settings_state.dart';
import '../../l10n/app_localizations.dart';

/// The settings sheet.
class SettingsSheet extends StatelessWidget {
  /// Creates a new settings sheet.
  const SettingsSheet({super.key});

  /// Shows the settings sheet.
  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => const SettingsSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Consumer(
      builder: (context, ref, _) {
        final settings = ref.watch(appSettingsControllerProvider);
        return settings.when(
          data: (state) => SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                24,
                16,
                24,
                24 + MediaQuery.of(context).padding.bottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.settings,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.themeLabel,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 12,
                    children: [
                      ChoiceChip(
                        label: Text(l10n.themeSystem),
                        selected: state.themeMode == ThemeMode.system,
                        onSelected: (_) => ref
                            .read(appSettingsControllerProvider.notifier)
                            .setThemeMode(ThemeMode.system),
                      ),
                      ChoiceChip(
                        label: Text(l10n.themeLight),
                        selected: state.themeMode == ThemeMode.light,
                        onSelected: (_) => ref
                            .read(appSettingsControllerProvider.notifier)
                            .setThemeMode(ThemeMode.light),
                      ),
                      ChoiceChip(
                        label: Text(l10n.themeDark),
                        selected: state.themeMode == ThemeMode.dark,
                        onSelected: (_) => ref
                            .read(appSettingsControllerProvider.notifier)
                            .setThemeMode(ThemeMode.dark),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    l10n.languageLabel,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 8),
                  DropdownButton<Locale?>(
                    value: state.locale,
                    onChanged: (value) => ref
                        .read(appSettingsControllerProvider.notifier)
                        .setLocale(value),
                    items: [
                      DropdownMenuItem<Locale?>(
                        value: null,
                        child: Text(l10n.languageSystem),
                      ),
                      DropdownMenuItem(
                        value: const Locale('en'),
                        child: Text(l10n.languageEnglish),
                      ),
                      DropdownMenuItem(
                        value: const Locale('it'),
                        child: Text(l10n.languageItalian),
                      ),
                      DropdownMenuItem(
                        value: const Locale('de'),
                        child: Text(l10n.languageGerman),
                      ),
                      DropdownMenuItem(
                        value: const Locale('sq'),
                        child: Text(l10n.languageAlbanian),
                      ),
                      DropdownMenuItem(
                        value: const Locale('fr'),
                        child: Text(l10n.languageFrench),
                      ),
                      DropdownMenuItem(
                        value: const Locale('es'),
                        child: Text(l10n.languageSpanish),
                      ),
                      DropdownMenuItem(
                        value: const Locale('ru'),
                        child: Text(l10n.languageRussian),
                      ),
                      DropdownMenuItem(
                        value: const Locale('he'),
                        child: Text(l10n.languageHebrew),
                      ),
                      DropdownMenuItem(
                        value: const Locale('ar'),
                        child: Text(l10n.languageArabic),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    l10n.accentColorLabel,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      for (final color in _accentPalette)
                        ChoiceChip(
                          label: _ColorSwatch(color: color),
                          selected: state.accentColor == color,
                          onSelected: (_) => ref
                              .read(appSettingsControllerProvider.notifier)
                              .setAccentColor(color),
                        ),
                      FilledButton.tonal(
                        onPressed: () => _showColorPicker(context, ref, state),
                        child: Text(l10n.accentColorCustom),
                      ),
                      TextButton(
                        onPressed: () => ref
                            .read(appSettingsControllerProvider.notifier)
                            .setAccentColor(const Color(0xFF27AE60)),
                        child: Text(l10n.accentColorReset),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Padding(
            padding: const EdgeInsets.all(24),
            child: Text('Error: $error'),
          ),
        );
      },
    );
  }

  void _showColorPicker(
    BuildContext context,
    WidgetRef ref,
    AppSettingsState state,
  ) {
    Color tempColor = state.accentColor;
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context).accentColorCustom),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: tempColor,
            onColorChanged: (color) => tempColor = color,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context).actionCancel),
          ),
          FilledButton(
            onPressed: () {
              ref
                  .read(appSettingsControllerProvider.notifier)
                  .setAccentColor(tempColor);
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.of(context).actionSave),
          ),
        ],
      ),
    );
  }
}

const _accentPalette = <Color>[
  Color(0xFF27AE60),
  Color(0xFF1ABC9C),
  Color(0xFF3498DB),
  Color(0xFF9B59B6),
  Color(0xFFE67E22),
  Color(0xFFE74C3C),
  Color(0xFFF1C40F),
  Color(0xFF2C3E50),
];

class _ColorSwatch extends StatelessWidget {
  const _ColorSwatch({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 18,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
