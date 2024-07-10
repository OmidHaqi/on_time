import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:on_time/screens/my_app.dart';

void main() {
    SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    statusBarColor: Color(0xff161928),
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Color(0xff161928),
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}
