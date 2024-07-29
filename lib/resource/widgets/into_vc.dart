part of '../../index.dart';

class IntoVC extends StatelessWidget {
  final String text;
  final String darkVC;
  final String lightVC;
  const IntoVC({
    super.key,
    required this.text,
    required this.darkVC,
    required this.lightVC,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Column(
          children: [
            SvgPicture.asset(
              state.themeMode == ThemeMode.dark ? darkVC : lightVC,
            ),
            AppDimens.large.height,
            Text(
              text,
              style: AppTextStyles.introScreenDesTextStyle.apply(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            )
          ],
        );
      },
    );
  }
}
