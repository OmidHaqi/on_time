part of '../index.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationsBloc, LocalizationsState>(
      builder: (localizationsContext, localizationsState) {
        return BlocBuilder<ThemeBloc, ThemeMode>(
          builder: (themeContext, themeState) {
            return MaterialApp(
              title: 'On Time',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme(),
              darkTheme: AppTheme.darkTheme(),
              themeMode: themeState,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: localizationsState.locale,
              home: const HomePage(),
            );
          },
        );
      },
    );
  }
}
