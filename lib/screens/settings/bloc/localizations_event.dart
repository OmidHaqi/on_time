part of 'localizations_bloc.dart';

sealed class LocalizationsEvent extends Equatable {
  const LocalizationsEvent();

  @override
  List<Object> get props => [];
}

class LoadLocalizations extends LocalizationsEvent {
  final Locale locale;

  const LoadLocalizations(this.locale);

  @override
  List<Object> get props => [locale];
}

class LoadSavedLocalizations extends LocalizationsEvent {}
