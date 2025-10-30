import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppSettingsState extends Equatable {
  const AppSettingsState({
    this.themeMode = ThemeMode.system,
    this.locale,
    this.accentColor = const Color(0xFF27AE60),
  });

  final ThemeMode themeMode;
  final Locale? locale;
  final Color accentColor;

  AppSettingsState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
    Color? accentColor,
  }) {
    return AppSettingsState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
      accentColor: accentColor ?? this.accentColor,
    );
  }

  @override
  List<Object?> get props => [themeMode, locale, accentColor];
}
