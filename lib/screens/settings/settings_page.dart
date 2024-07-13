import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_time/data/model/language_model.dart';
import 'package:on_time/resource/app_dimens.dart';
import 'package:on_time/resource/components/text_style.dart';
import 'package:on_time/screens/settings/bloc/localizations_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var groupValue =
        context.read<LocalizationsBloc>().state.locale.languageCode;
    return SafeArea(
      child: BlocConsumer<LocalizationsBloc, LocalizationsState>(
        listener: (context, state) {
          groupValue = state.locale.languageCode;
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: const Text(
                
                'تنظیمات',
                style: AppTextStyles.appBarTitle,
              ),
            ),
            body: Directionality(
              textDirection: TextDirection.ltr,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: AppDimens.medium),
                    child: Text('زبان'),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppDimens.small),
                    child: Divider(),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: languageModel.length,
                        itemBuilder: (context, index) {
                          var item = languageModel[index];
              
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: RadioListTile(
                              value: item.languageCode,
                              groupValue: groupValue,
                              onChanged: (value) {
                                BlocProvider.of<LocalizationsBloc>(context).add(
                                  LoadLocalizations(
                                    Locale(
                                      item.languageCode,
                                    ),
                                  ),
                                );
                              },
                              title: Text(item.language),
                              subtitle: Text(item.subLanguage),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
