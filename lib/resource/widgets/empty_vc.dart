part of '../../index.dart';

class EmptyVC extends StatelessWidget {
  const EmptyVC({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                state.themeMode == ThemeMode.dark
                    ? Assets.images.svg.vcEmptyDark
                    : Assets.images.svg.vcEmptyLight,
                height: 200,
              ),
              AppDimens.medium.height,
              Text(
                text,
                style: AppTextStyles.emptyTextStyle.copyWith(
                    background: Paint()
                      ..strokeJoin = StrokeJoin.round
                      ..style = PaintingStyle.stroke
                      ..color = Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.1)
                      ..strokeWidth = 25),
              )
            ],
          ),
        );
      },
    );
  }
}
