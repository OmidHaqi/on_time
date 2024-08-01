import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:on_time/data/models/language_model.dart';
import 'package:on_time/data/models/note_model.dart';
import 'package:on_time/data/models/task_model.dart';
import 'package:on_time/gen/assets.gen.dart';
import 'package:on_time/generated/l10n.dart';
import 'package:on_time/screens/home/bloc/home_bloc.dart';
import 'package:on_time/screens/home/bloc/home_event.dart';
import 'package:on_time/screens/home/bloc/home_state.dart';
import 'package:on_time/screens/home/note/bloc/note_bloc.dart';
import 'package:on_time/screens/home/task/bloc/task_bloc.dart';
import 'package:on_time/screens/settings/bloc/settings_bloc.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_horizontal_date_picker/persian_horizontal_date_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

part 'screens/my_app.dart';
part 'screens/settings/settings_page.dart';
part 'screens/home/task/add_task_screen.dart';
part 'screens/home/home_page.dart';
part 'screens/home/task/tasks.dart';
part 'screens/home/task/task_list.dart';
part 'resource/constants.dart';
part 'resource/app_dimens.dart';
part 'resource/widgets/custom_app_bar.dart';
part 'resource/widgets/input_feild.dart';
part 'resource/utils/extensions.dart';
part 'resource/themes/themes.dart';
part 'resource/components/text_style.dart';
part 'data/repositories/repositories.dart';
part 'data/repositories/local_repo.dart';
part 'data/sources/data_source.dart';
part 'data/sources/local_data_src.dart';
part 'resource/widgets/color_item.dart';
part 'resource/widgets/empty_vc.dart';
part 'resource/widgets/task_card.dart';
part 'screens/home/task/edit_task_screen.dart';
part 'resource/utils/utils.dart';
part 'screens/home/note/notes.dart';
part 'resource/widgets/note_card.dart';
part 'screens/home/note/add_note_screen.dart';
part 'screens/home/note/edit_note_screen.dart';
part 'screens/home/note/note_list.dart';
part 'screens/splash_screen.dart';
part 'screens/intro/intro_screen.dart';
part 'resource/widgets/into_vc.dart';
part 'resource/widgets/dialog.dart';
part 'resource/widgets/restart.dart';
