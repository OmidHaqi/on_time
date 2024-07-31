part of '../index.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'On Time',
          builder: (_, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: MediaQuery.of(context)
                  .textScaler
                  .clamp(minScaleFactor: 0.8, maxScaleFactor: 0.8),
            ),
            child: child!,
          ),
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          themeMode: state.themeMode,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: state.locale,
          home: const SplashScreen(),
        );
      },
    );
  }
}
