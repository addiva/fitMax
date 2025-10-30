import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_settings_state.dart';

final appSettingsControllerProvider =
    AsyncNotifierProvider<AppSettingsController, AppSettingsState>(
      AppSettingsController.new,
    );

class AppSettingsController extends AsyncNotifier<AppSettingsState> {
  static const _themeKey = 'settings_theme_mode';
  static const _localeKey = 'settings_locale_code';
  static const _accentKey = 'settings_accent_color';

  late SharedPreferences _prefs;

  @override
  Future<AppSettingsState> build() async {
    _prefs = await SharedPreferences.getInstance();
    final themeName = _prefs.getString(_themeKey);
    final localeCode = _prefs.getString(_localeKey);
    final accentHex = _prefs.getString(_accentKey);

    final themeMode = _themeFromName(themeName);
    final locale = localeCode == null || localeCode.isEmpty
        ? null
        : _localeFromCode(localeCode);
    final accentColor = accentHex == null
        ? const Color(0xFF27AE60)
        : _colorFromHex(accentHex);

    return AppSettingsState(
      themeMode: themeMode,
      locale: locale,
      accentColor: accentColor,
    );
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await _prefs.setString(_themeKey, _themeToName(mode));
    final current = state.value ?? const AppSettingsState();
    state = AsyncValue.data(current.copyWith(themeMode: mode));
  }

  Future<void> setLocale(Locale? locale) async {
    if (locale == null) {
      await _prefs.remove(_localeKey);
    } else {
      await _prefs.setString(_localeKey, locale.languageCode);
    }
    final current = state.value ?? const AppSettingsState();
    state = AsyncValue.data(current.copyWith(locale: locale));
  }

  Future<void> setAccentColor(Color color) async {
    await _prefs.setString(_accentKey, _colorToHex(color));
    final current = state.value ?? const AppSettingsState();
    state = AsyncValue.data(current.copyWith(accentColor: color));
  }

  ThemeMode _themeFromName(String? name) {
    switch (name) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  String _themeToName(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }

  Locale _localeFromCode(String code) {
    final segments = code.split('_');
    if (segments.length == 2) {
      return Locale(segments.first, segments.last);
    }
    return Locale(code);
  }

  Color _colorFromHex(String value) {
    final sanitized = value.replaceAll('#', '').padLeft(8, 'FF');
    final intColor = int.tryParse(sanitized, radix: 16) ?? 0xFF27AE60;
    return Color(intColor);
  }

  String _colorToHex(Color color) =>
      '#${color.toARGB32().toRadixString(16).padLeft(8, '0')}';
}
