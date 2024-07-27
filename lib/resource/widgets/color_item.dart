part of '../../index.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.colorCode,
  });

  final Function() onTap;
  final bool isSelected;
  final int colorCode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: AppColors.appPrimaryDark),
        child: Container(
          width: 43,
          height: 43,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(colorCode),
              border: Border.all(color: AppColors.appOnPrimaryDark)),
          child: isSelected
              ? const Icon(
                  Icons.check,
                  color: AppColors.appPrimaryDark,
                )
              : null,
        ),
      ),
    );
  }
}

TaskColor _taskSelectedColor = TaskColor.one;

class TodoColorSelector extends StatefulWidget {
  const TodoColorSelector({super.key});

  @override
  State<TodoColorSelector> createState() => _TodoColorSelectorState();
}

class _TodoColorSelectorState extends State<TodoColorSelector> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ColorItem(
              onTap: () => setState(() => _taskSelectedColor = TaskColor.one),
              isSelected: _taskSelectedColor == TaskColor.one,
              colorCode: TaskColor.one.code),
          ColorItem(
              onTap: () => setState(() => _taskSelectedColor = TaskColor.two),
              isSelected: _taskSelectedColor == TaskColor.two,
              colorCode: TaskColor.two.code),
          ColorItem(
              onTap: () => setState(() => _taskSelectedColor = TaskColor.three),
              isSelected: _taskSelectedColor == TaskColor.three,
              colorCode: TaskColor.three.code),
          ColorItem(
              onTap: () => setState(() => _taskSelectedColor = TaskColor.four),
              isSelected: _taskSelectedColor == TaskColor.four,
              colorCode: TaskColor.four.code),
          ColorItem(
              onTap: () => setState(() => _taskSelectedColor = TaskColor.five),
              isSelected: _taskSelectedColor == TaskColor.five,
              colorCode: TaskColor.five.code),
          ColorItem(
              onTap: () => setState(() => _taskSelectedColor = TaskColor.six),
              isSelected: _taskSelectedColor == TaskColor.six,
              colorCode: TaskColor.six.code),
          ColorItem(
              onTap: () => setState(() => _taskSelectedColor = TaskColor.seven),
              isSelected: _taskSelectedColor == TaskColor.seven,
              colorCode: TaskColor.seven.code),
          ColorItem(
              onTap: () => setState(() => _taskSelectedColor = TaskColor.eight),
              isSelected: _taskSelectedColor == TaskColor.eight,
              colorCode: TaskColor.eight.code),
          ColorItem(
              onTap: () => setState(() => _taskSelectedColor = TaskColor.nine),
              isSelected: _taskSelectedColor == TaskColor.nine,
              colorCode: TaskColor.nine.code),
        ],
      ),
    );
  }
}

NoteColor _noteSelectedColor = NoteColor.one;

class NoteColorSelector extends StatefulWidget {
  const NoteColorSelector({super.key});

  @override
  State<NoteColorSelector> createState() => _NoteColorSelectorState();
}

class _NoteColorSelectorState extends State<NoteColorSelector> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ColorItem(
              onTap: () => setState(() => _noteSelectedColor = NoteColor.one),
              isSelected: _noteSelectedColor == NoteColor.one,
              colorCode: NoteColor.one.code),
          ColorItem(
              onTap: () => setState(() => _noteSelectedColor = NoteColor.two),
              isSelected: _noteSelectedColor == NoteColor.two,
              colorCode: NoteColor.two.code),
          ColorItem(
              onTap: () => setState(() => _noteSelectedColor = NoteColor.three),
              isSelected: _noteSelectedColor == NoteColor.three,
              colorCode: NoteColor.three.code),
          ColorItem(
              onTap: () => setState(() => _noteSelectedColor = NoteColor.four),
              isSelected: _noteSelectedColor == NoteColor.four,
              colorCode: NoteColor.four.code),
          ColorItem(
              onTap: () => setState(() => _noteSelectedColor = NoteColor.five),
              isSelected: _noteSelectedColor == NoteColor.five,
              colorCode: NoteColor.five.code),
          ColorItem(
              onTap: () => setState(() => _noteSelectedColor = NoteColor.six),
              isSelected: _noteSelectedColor == NoteColor.six,
              colorCode: NoteColor.six.code),
          ColorItem(
              onTap: () => setState(() => _noteSelectedColor = NoteColor.seven),
              isSelected: _noteSelectedColor == NoteColor.seven,
              colorCode: NoteColor.seven.code),
          ColorItem(
              onTap: () => setState(() => _noteSelectedColor = NoteColor.eight),
              isSelected: _noteSelectedColor == NoteColor.eight,
              colorCode: NoteColor.eight.code),
          ColorItem(
              onTap: () => setState(() => _noteSelectedColor = NoteColor.nine),
              isSelected: _noteSelectedColor == NoteColor.nine,
              colorCode: NoteColor.nine.code),
        ],
      ),
    );
  }
}
