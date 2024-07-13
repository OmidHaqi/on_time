part of 'localizations_bloc.dart';

class LocalizationsState extends Equatable {
  final Locale locale;
  const LocalizationsState(this.locale);

  //default state

  factory LocalizationsState.initial() {
    return const LocalizationsState(Locale('en'));
  }

  LocalizationsState copyWith() {
    return LocalizationsState(locale ?? this.locale);
  }

  @override
  List<Object> get props => [locale];
}
