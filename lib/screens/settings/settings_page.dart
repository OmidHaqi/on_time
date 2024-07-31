part of '../../index.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var groupValue = context.read<SettingsBloc>().state.locale.languageCode;
    return SafeArea(
      child: BlocConsumer<SettingsBloc, SettingsState>(
        listener: (context, state) {
          groupValue = state.locale.languageCode;
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text(
                S.current.settings,
                style: AppTextStyles.appBarTitle,
              ),
            ),
            body: Directionality(
              textDirection: TextDirection.ltr,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: AppDimens.medium),
                    child: Text(S.current.language),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppDimens.small),
                    child: Divider(),
                  ),
                  AbsorbPointer(
                    absorbing: true,
                    child: SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: ListView.builder(
                          itemCount: languageModel.length,
                          itemBuilder: (context, index) {
                            var item = languageModel[index];
                            return RadioListTile(
                              value: item.languageCode,
                              groupValue: groupValue,
                              onChanged: (value) {
                                BlocProvider.of<SettingsBloc>(context).add(
                                  LoadLocalizations(
                                    Locale(
                                      item.languageCode,
                                    ),
                                  ),
                                );
                              },
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(item.language),
                                ],
                              ),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(item.subLanguage),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: AppDimens.medium),
                    child: Text(S.current.theme),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppDimens.small),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.medium),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppDimens.medium),
                            child: Text(S.current.darkMode),
                          ),
                          Switch(
                            value: state.themeMode == ThemeMode.dark,
                            onChanged: (value) {
                              context
                                  .read<SettingsBloc>()
                                  .add(ThemeChanged(isDark: value));
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
