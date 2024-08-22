import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:on_time/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState.initial()) {
    on<LoadSavedLocalizations>(_getLanguage);
    on<LoadLocalizations>(_changeLanguage);
    on<ThemeChanged>(_onThemeChanged);
    on<LoadTheme>(_onLoadTheme);
    add(LoadSavedLocalizations());
    add(LoadTheme());
  }

  void _changeLanguage(
      LoadLocalizations event, Emitter<SettingsState> emit) async {
    if (event.locale == state.locale) return;
    await _saveLocale(event.locale);
    emit(state.copyWith(locale: event.locale));
    RestartWidget.restartApp(navigatorKey.currentContext!);
  }

  Future<void> _getLanguage(
      LoadSavedLocalizations event, Emitter<SettingsState> emit) async {
    Locale savedLocale = await _getLocale();
    emit(state.copyWith(locale: savedLocale));
  }

  Future<void> _onThemeChanged(
      ThemeChanged event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', event.isDark);
    emit(state.copyWith(
        themeMode: event.isDark ? ThemeMode.dark : ThemeMode.light));
          RestartWidget.restartApp(navigatorKey.currentContext!);
  }

  Future<void> _onLoadTheme(
      LoadTheme event, Emitter<SettingsState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark') ?? false;
    emit(state.copyWith(themeMode: isDark ? ThemeMode.dark : ThemeMode.light));
  }

  Future<void> _saveLocale(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', locale.languageCode);
  }

  Future<Locale> _getLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('language') ?? 'fa';
    return Locale(languageCode);
  }
}
