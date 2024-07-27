part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class LoadLocalizations extends SettingsEvent {
  final Locale locale;

  const LoadLocalizations(this.locale);

  @override
  List<Object> get props => [locale];
}

class LoadSavedLocalizations extends SettingsEvent {}

class ThemeChanged extends SettingsEvent {
  final bool isDark;

  const ThemeChanged({required this.isDark});
}

class LoadTheme extends SettingsEvent {}
