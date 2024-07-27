part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final Locale locale;
  final ThemeMode themeMode;

  const SettingsState({required this.locale, required this.themeMode});

  // Default state
  factory SettingsState.initial() {
    return const SettingsState(
        locale: Locale('en'), themeMode: ThemeMode.light);
  }

  SettingsState copyWith({Locale? locale, ThemeMode? themeMode}) {
    return SettingsState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object> get props => [locale, themeMode];
}
