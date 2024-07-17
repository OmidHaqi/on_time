import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_time/data/sources/task_local_data_src.dart';
import 'package:on_time/resource/themes/bloc/theme_bloc.dart';
import 'package:on_time/screens/my_app.dart';
import 'package:on_time/screens/settings/bloc/localizations_bloc.dart';

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
        BlocProvider<LocalizationsBloc>(
          create: (context) => LocalizationsBloc()
            ..add(
              LoadSavedLocalizations(),
            ),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
