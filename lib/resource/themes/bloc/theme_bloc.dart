import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.light) {
    on<ThemeChanged>(_onThemeChanged);
    on<LoadTheme>(_onLoadTheme);
    add(LoadTheme()); // Load the theme when the bloc is created
  }

  Future<void> _onThemeChanged(
      ThemeChanged event, Emitter<ThemeMode> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', event.isDark);
    emit(event.isDark ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> _onLoadTheme(LoadTheme event, Emitter<ThemeMode> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark') ?? false;
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}
