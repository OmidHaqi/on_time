part of '../../../index.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({
    super.key,
  });
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    Stack(
                      children: [
                        TextField(
                          controller: _titleController,
                          style: AppTextStyles.noteTitleTextStyle.apply(color: AppColors.appPrimaryDark),
                          decoration: const InputDecoration(
                            hintText: 'عنوان',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                             hintStyle:
                            TextStyle(color: Color.fromARGB(132, 22, 25, 40)),
                            counterText: '',
                          ),
                          minLines: 1,
                          maxLines: 8,
                          maxLength: 140,
                          onChanged: (v) {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Stack(
                      children: [
                        TextField(
                          controller: _descriptionController,
                          style: AppTextStyles.noteDecTextStyle.apply(color:AppColors.appPrimaryDark ),
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
                                    if (state is SaveNoteState) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          duration: Duration(milliseconds: 500),
                                          content: Text(
                                            'Add Note',
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  builder: (context, state) {
                                    return TextButton(
                                      style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                          AppColors.appPrimaryDark
                                        ),
                                      ),
                                      onPressed: () {
                                        if (_titleController.text.isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  "please complete all the fields"),
                                            ),
                                          );
                                        } else {
                                          String dateTime =
                                              '${DateTime.now().hour.toPersianNumberInt()}:${DateTime.now().minute.toPersianNumberInt()} / ${Jalali.now().day.toPersianNumberInt()} - ${Jalali.now().month.toPesianMonth()} ';
                                          BlocProvider.of<NoteBloc>(context)
                                              .add(
                                            SaveNoteEvent(
                                              NoteModel(
                                                  id: '',
                                                  title: _titleController.text,
                                                  description:
                                                      _descriptionController
                                                          .text,
                                                  color: _noteSelectedColor,
                                                  dateTime: dateTime),
                                            ),
                                          );

                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Text(
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
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      AppColors.appPrimaryDark,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'بیخیال',
                                    style: TextStyle(
                                        color: AppColors.appOnPrimaryDark),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
