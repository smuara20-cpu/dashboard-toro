import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _themeModePreferenceKey = 'ventra.theme_mode';

final themeModeProvider = NotifierProvider<ThemeModeController, ThemeMode>(
  ThemeModeController.new,
);

class ThemeModeController extends Notifier<ThemeMode> {
  bool _userChangedMode = false;

  @override
  ThemeMode build() {
    unawaited(_restorePreference());
    return ThemeMode.system;
  }

  Future<void> _restorePreference() async {
    final preferences = await SharedPreferences.getInstance();

    if (_userChangedMode) return;

    final savedMode = preferences.getString(_themeModePreferenceKey);

    final restoredMode = switch (savedMode) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      'system' => ThemeMode.system,
      _ => ThemeMode.system,
    };

    if (!_userChangedMode) {
      state = restoredMode;
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _userChangedMode = true;
    state = mode;

    final preferences = await SharedPreferences.getInstance();

    final value = switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };

    await preferences.setString(_themeModePreferenceKey, value);
  }
}
