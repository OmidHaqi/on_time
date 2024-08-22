import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:on_time/data/models/note_model.dart';
import 'package:on_time/data/models/task_model.dart';
import 'package:on_time/index.dart';
import 'package:on_time/resource/utils/notification_helper.dart';
import 'package:on_time/screens/home/bloc/home_bloc.dart';
import 'package:on_time/screens/home/note/bloc/note_bloc.dart';
import 'package:on_time/screens/home/task/bloc/task_bloc.dart';
import 'package:on_time/screens/settings/bloc/settings_bloc.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationHelper.initialize();

  Hive
    ..initFlutter()
    ..registerAdapter(TaskModelAdapter())
    ..registerAdapter(TaskColorAdapter())
    ..registerAdapter(NoteModelAdapter())
    ..registerAdapter(NoteColorAdapter());
  await Hive.openBox<TaskModel>(taskBoxName);
  await Hive.openBox<NoteModel>(noteBoxName);

  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Color(0xff161928),
  //     statusBarIconBrightness: Brightness.light,
  //     systemNavigationBarColor: Color(0xff161928),
  //     systemNavigationBarIconBrightness: Brightness.light,
  //   ),
  // );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            final taskBloc = TaskBloc(taskLocalRepo);
            taskBloc.add(TaskInit());
            return taskBloc;
          },
        ),
        BlocProvider(create: (_) {
          final noteBloc = NoteBloc(noteLocalRepo);
          noteBloc.add(NoteInit());
          return noteBloc;
        }),
        BlocProvider(
          create: (_) {
            final settingsBloc = SettingsBloc();
            settingsBloc.add(LoadSavedLocalizations());
            return settingsBloc;
          },
        ),
        BlocProvider(create: (_) => HomeBloc())
      ],
      child: DevicePreview(
        enabled: !kReleaseMode,
        availableLocales: const [
          Locale('fa_IR'),
          Locale('en_US'),
        ],
        data: DevicePreviewData(
          deviceIdentifier: Devices.ios.iPhone12ProMax.toString(),
          locale: 'fa_IR',
        ),
        builder: (context) {
          return const MyApp();
        },
      ),
    ),
  );
}
