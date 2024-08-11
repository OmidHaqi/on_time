part of '../../../index.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({
    super.key,
  });

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var lang = BlocProvider.of<SettingsBloc>(context).state.locale.languageCode;
        var uuid = const Uuid();
    String uuidString = uuid.v4();
    List<int> bytes = utf8.encode(uuidString);
    int noteId = bytes.fold(0, (previousValue, element) {
      return previousValue + element;
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(_noteSelectedColor.code),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                children: [
                  TextField(
                    controller: _titleController,
                    style: AppTextStyles.noteTitleTextStyle
                        .apply(color: AppColors.appPrimaryDark),
                    decoration: InputDecoration(
                      hintText: S.current.noteTextFieldTitleHint,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(132, 22, 25, 40)),
                      counterText: '',
                    ),
                    minLines: 1,
                    maxLines: 8,
                    maxLength: 140,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _descriptionController,
                    style: AppTextStyles.noteDecTextStyle
                        .apply(color: AppColors.appPrimaryDark),
                    decoration: InputDecoration(
                      hintText: S.current.noteTextFieldNoteHint,
                      border: InputBorder.none,
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(132, 22, 25, 40)),
                      contentPadding: EdgeInsets.zero,
                    ),
                    minLines: 2,
                    maxLines: 100,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: AppDimens.small),
                  child: NoteColorSelector(
                    selectedColor: _noteSelectedColor,
                    onColorSelected: (color) {
                      setState(() {
                        _noteSelectedColor = color;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppDimens.small),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: BlocConsumer<NoteBloc, NoteState>(
                            listener: (context, state) {
                              if (state is SaveNoteState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: const Duration(milliseconds: 500),
                                    content: Text(
                                      S.current.addNoteSnackBar,
                                    ),
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              return TextButton(
                                style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      AppColors.appPrimaryDark),
                                ),
                                onPressed: () {
                                  if (_titleController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          S.current.emptyTextFieldError,
                                        ),
                                      ),
                                    );
                                  } else {
                                    if (lang == 'fa') {
                                      String dateTime =
                                          '${DateTime.now().hour.toPersianNumberInt()}:${DateTime.now().minute.toPersianNumberInt()} / ${Jalali.now().day.toPersianNumberInt()} - ${Jalali.now().month.toPesianMonth()} ';
                                      BlocProvider.of<NoteBloc>(context).add(
                                        SaveNoteEvent(
                                          NoteModel(
                                              id: noteId,
                                              title: _titleController.text,
                                              description:
                                                  _descriptionController.text,
                                              color: _noteSelectedColor,
                                              dateTime: dateTime),
                                        ),
                                      );
                                    } else {
                                      String gDateTime =
                                          '${DateTime.now().hour}:${DateTime.now().minute} / ${DateTime.now().day} - ${DateTime.now().month.toGregorianMonth()} ';

                                      BlocProvider.of<NoteBloc>(context).add(
                                        SaveNoteEvent(
                                          NoteModel(
                                              id: noteId,
                                              title: _titleController.text,
                                              description:
                                                  _descriptionController.text,
                                              color: _noteSelectedColor,
                                              dateTime: gDateTime),
                                        ),
                                      );
                                    }

                                    Navigator.pop(context);
                                  }
                                },
                                child: Text(
                                  S.current.save,
                                  style: const TextStyle(
                                      color: AppColors.appOnPrimaryDark),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      AppDimens.small.width,
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: TextButton(
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                AppColors.appPrimaryDark,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              S.current.discard,
                              style: const TextStyle(
                                  color: AppColors.appOnPrimaryDark),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
