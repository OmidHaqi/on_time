import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'localizations_event.dart';
part 'localizations_state.dart';

class LocalizationsBloc extends Bloc<LocalizationsEvent, LocalizationsState> {
  LocalizationsBloc() : super(LocalizationsState.initial()) {
    on<LoadSavedLocalizations>(getLanguage);
    on<LoadLocalizations>(changeLanguage);
  }

  void changeLanguage(
      LoadLocalizations event, Emitter<LocalizationsState> emit) {
    if (event.locale == state.locale) return;
    saveLocale(event.locale);
    emit(LocalizationsState(event.locale));
  }

  Future<void> getLanguage(
      LoadSavedLocalizations event, Emitter<LocalizationsState> emit) async {
    Locale saveLocale = await getLocale();
    emit(LocalizationsState(saveLocale));
  }

  saveLocale(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', locale.languageCode);
  }

  Future<Locale> getLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('language') ?? 'en';
    return Locale(languageCode);
  }
}
