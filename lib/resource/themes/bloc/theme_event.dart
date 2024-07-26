part of 'theme_bloc.dart';

abstract class ThemeEvent {}

class ThemeChanged extends ThemeEvent {
  final bool isDark;
  ThemeChanged({required this.isDark});
}

class LoadTheme extends ThemeEvent {}
