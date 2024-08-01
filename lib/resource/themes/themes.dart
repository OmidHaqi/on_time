part of '../../index.dart';

class AppTheme {
  static ThemeData darkTheme(BuildContext context) {
    var lang = BlocProvider.of<SettingsBloc>(context).state.locale.languageCode;
    return ThemeData(
      fontFamily: lang == 'fa' ? 'YekanBakhNumFa' : 'Ubuntu',
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xffDAE5EB),
        onPrimary: Color(0xff161928),
        secondary: Color(0xff161928),
        onSecondary: Color(0xffDAE5EB),
        error: Color(0xffFF636C),
        onError: Color(0xffDAE5EB),
        surface: Color(0xff161928),
        onSurface: Color(0xffDAE5EB),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: Color(0xffDAE5EB),
          ),
        ),
      ),
    );
  }

  static ThemeData lightTheme(BuildContext context) {
    var lang = BlocProvider.of<SettingsBloc>(context).state.locale.languageCode;
    return ThemeData(
      fontFamily: lang == 'fa' ? 'YekanBakhNumFa': 'Ubuntu',
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xff161928),
        onPrimary: Color(0xffDAE5EB),
        secondary: Color(0xffDAE5EB),
        onSecondary: Color(0xff161928),
        error: Color(0xffFF636C),
        onError: Color(0xffDAE5EB),
        surface: Color(0xffDAE5EB),
        onSurface: Color(0xff161928),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: Color(0xff161928),
            )),
      ),
    );
  }
}
