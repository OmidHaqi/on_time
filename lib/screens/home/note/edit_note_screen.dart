part of '../../../index.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  @override
  Widget build(BuildContext context) {
    var lang = BlocProvider.of<SettingsBloc>(context).state.locale.languageCode;
    final TextEditingController titleController =
        TextEditingController(text: widget.note.title);
    final TextEditingController descriptionController =
        TextEditingController(text: widget.note.description);
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
                  Stack(children: [
                    TextField(
                      controller: titleController,
                      style: AppTextStyles.noteTitleTextStyle
                          .apply(color: AppColors.appPrimaryDark),
                      decoration: InputDecoration(
                        hintText: S.current.noteTextFieldTitleHint,
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(132, 22, 25, 40)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        counterText: '',
                      ),
                      minLines: 1,
                      maxLines: 8,
                      maxLength: 140,
                    ),
                    Positioned(
                      left: 0,
                      child: IconButton(
                        onPressed: () {
                          customeDialogee(
                            context,
                            content: S.current.deleteNoteDialogContent,
                            primaryBtn: S.current.deleteDialogPrimaryBtn,
                            onTapPrimaryBtn: () {
                              BlocProvider.of<NoteBloc>(context).add(
                                DeleteNoteEvent(
                                  widget.note.id,
                                ),
                              );
                              Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            },
                            onTapSecendaryBtn: () {
                              Navigator.pop(context);
                            },
                            secendaryBtn: S.current.deleteDialogSecendaryBtn,
                          );
                        },
                        icon: const Icon(
                          Icons.delete_rounded,
                          color: AppColors.appPrimaryDark,
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 20),
                  TextField(
                    controller: descriptionController,
                    style: AppTextStyles.noteDecTextStyle
                        .apply(color: AppColors.appPrimaryDark),
                    decoration: InputDecoration(
                      hintText: S.current.noteTextFieldTitleHint,
                      border: InputBorder.none,
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(132, 22, 25, 40),
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                    minLines: 2,
                    maxLines: 100,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.current.createAt,
                        style: AppTextStyles.noteDecTextStyle
                            .apply(color: AppColors.appPrimaryDark),
                      ),
                      Text(
                        widget.note.dateTime,
                        style: AppTextStyles.noteDecTextStyle
                            .apply(color: AppColors.appPrimaryDark),
                      ),
                    ],
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
                              if (state is UpdateNoteState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: const Duration(milliseconds: 500),
                                    content: Text(
                                      S.current.editNoteSnackBar,
                                    ),
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              return TextButton(
                                style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    AppColors.appPrimaryDark,
                                  ),
                                ),
                                onPressed: () {
                                  if (titleController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          S.current.emptyTextFieldError,
                                        ),
                                      ),
                                    );
                                  } else {
                                    if (lang == 'fa') {
                                      String persianDateTime =
                                        '${DateTime.now().hour.toPersianNumberInt()}:${DateTime.now().minute.toPersianNumberInt()} / ${Jalali.now().day.toPersianNumberInt()} - ${Jalali.now().month.toPesianMonth()} ';
                                    BlocProvider.of<NoteBloc>(context).add(
                                      UpdateNoteEvent(
                                          NoteModel(
                                              id: widget.note.id,
                                              title: titleController.text,
                                              description:
                                                  descriptionController.text,
                                              color: _noteSelectedColor,
                                              dateTime: persianDateTime),
                                          widget.note.id),
                                    );
                                    } else {
                                       String gDateTime =
                                        '${DateTime.now().hour}:${DateTime.now().minute} / ${DateTime.now().day} - ${DateTime.now().month.toGregorianMonth()} ';
                                         BlocProvider.of<NoteBloc>(context).add(
                                      UpdateNoteEvent(
                                          NoteModel(
                                              id: widget.note.id,
                                              title: titleController.text,
                                              description:
                                                  descriptionController.text,
                                              color: _noteSelectedColor,
                                              dateTime: gDateTime),
                                          widget.note.id),
                                    );
                                    }
                                    

                                    Navigator.pop(context);
                                  }
                                },
                                child: Text(
                                  S.current.save,
                                  style: const TextStyle(
                                    color: AppColors.appOnPrimaryDark,
                                  ),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
