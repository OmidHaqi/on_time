import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:on_time/data/models/note_model.dart';
import 'package:on_time/data/models/task_model.dart';
import 'package:on_time/index.dart';
import 'package:on_time/resource/themes/bloc/theme_bloc.dart';
import 'package:on_time/screens/home/task/bloc/task_bloc.dart';
import 'package:on_time/screens/settings/bloc/localizations_bloc.dart';
import 'package:path_provider/path_provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(TaskModelAdapter())
    ..registerAdapter(TaskColorAdapter())
    ..registerAdapter(NoteModelAdapter())
    ..registerAdapter(NoteColorAdapter());
  await Hive.openBox<TaskModel>(taskBoxName);
  await Hive.openBox<NoteModel>(noteBoxName);

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
            final homeBloc = TaskBloc(taskLocalRepo);
            homeBloc.add(
              TaskInit(),
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
