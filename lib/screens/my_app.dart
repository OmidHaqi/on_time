import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:on_time/generated/l10n.dart';
import 'package:on_time/resource/themes.dart';
import 'package:on_time/screens/home/home_page.dart';
import 'package:on_time/screens/settings/bloc/localizations_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationsBloc, LocalizationsState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'On Time',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: state.locale,
          home: const HomePage(),
        );
      },
    );
  }
}
