part of '../../../index.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController =
        TextEditingController(text: note.title);
    final TextEditingController descriptionController =
        TextEditingController(text: note.description);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(_noteSelectedColor.code),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
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
                        decoration: const InputDecoration(
                          hintText: 'عنوان',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(132, 22, 25, 40)),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          counterText: '',
                        ),
                        minLines: 1,
                        maxLines: 8,
                        maxLength: 140,
                        onChanged: (v) {},
                      ),
                      Positioned(
                        left: 0,
                        child: IconButton(
                          onPressed: () {
                            customeDialogee(
                              context,
                              content: 'مطمئنی میخوای این یادداشت رو حذف کنی؟',
                              primaryBtn: 'حذفش کن',
                              onTapPrimaryBtn: () {
                                BlocProvider.of<NoteBloc>(context).add(
                                  DeleteNoteEvent(
                                    note.id,
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
                              secendaryBtn: 'دستم خورد',
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
                      decoration: const InputDecoration(
                        hintText: 'یادداشت خودتو اینجا بنویس...',
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(color: Color.fromARGB(132, 22, 25, 40)),
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
                          'ایجاد شده در :',
                          style: AppTextStyles.noteDecTextStyle
                              .apply(color: AppColors.appPrimaryDark),
                        ),
                        Text(
                          note.dateTime,
                          style: AppTextStyles.noteDecTextStyle
                              .apply(color: AppColors.appPrimaryDark),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: AppDimens.small),
                      child: NoteColorSelector(),
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
                                      const SnackBar(
                                        duration: Duration(milliseconds: 500),
                                        content: Text(
                                          'یادداشت با موفقیت ویرایش شد',
                                          textDirection: TextDirection.rtl,
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
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              "حداقل عنوان رو پر کن",
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ),
                                        );
                                      } else {
                                        String dateTime =
                                            '${DateTime.now().hour.toPersianNumberInt()}:${DateTime.now().minute.toPersianNumberInt()} / ${Jalali.now().day.toPersianNumberInt()} - ${Jalali.now().month.toPesianMonth()} ';
                                        BlocProvider.of<NoteBloc>(context).add(
                                          UpdateNoteEvent(
                                              NoteModel(
                                                  id: note.id,
                                                  title: titleController.text,
                                                  description:
                                                      descriptionController
                                                          .text,
                                                  color: _noteSelectedColor,
                                                  dateTime: dateTime),
                                              note.id),
                                        );

                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text(
                                      'ثبت',
                                      style: TextStyle(
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
                                      AppColors.appPrimaryDark),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'بیخیال',
                                  style: TextStyle(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
