part of 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  TaskLocalDataSrc taskLocalDataSrc = TaskLocalDataSrc();
  taskLocalDataSrc.initialize();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xff161928),
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xff161928),
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            final homeBloc = HomeBloc(taskLocalRepo);
            homeBloc.add(
              HomeInit(),
            );
            return homeBloc;
          },
        ),
        BlocProvider<LocalizationsBloc>(
          create: (_) {
            final localizationsBloc = LocalizationsBloc();
            localizationsBloc.add(
              LoadSavedLocalizations(),
            );
            return localizationsBloc;
          },
        ),
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
