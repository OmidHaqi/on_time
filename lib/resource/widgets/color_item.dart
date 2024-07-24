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
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.primary),
        child: Container(
          width: 43,
          height: 43,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(colorCode),
              border:
                  Border.all(color: Theme.of(context).colorScheme.onPrimary)),
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

TaskColor _selectedColor = TaskColor.one;

class TodoColorSelector extends StatefulWidget {
  const TodoColorSelector({super.key});

  @override
  State<TodoColorSelector> createState() => _TodoColorSelectorState();
}

class _TodoColorSelectorState extends State<TodoColorSelector> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ColorItem(
              onTap: () => setState(() => _selectedColor = TaskColor.one),
              isSelected: _selectedColor == TaskColor.one,
              colorCode: TaskColor.one.code),
          ColorItem(
              onTap: () => setState(() => _selectedColor = TaskColor.two),
              isSelected: _selectedColor == TaskColor.two,
              colorCode: TaskColor.two.code),
          ColorItem(
              onTap: () => setState(() => _selectedColor = TaskColor.three),
              isSelected: _selectedColor == TaskColor.three,
              colorCode: TaskColor.three.code),
          ColorItem(
              onTap: () => setState(() => _selectedColor = TaskColor.four),
              isSelected: _selectedColor == TaskColor.four,
              colorCode: TaskColor.four.code),
          ColorItem(
              onTap: () => setState(() => _selectedColor = TaskColor.five),
              isSelected: _selectedColor == TaskColor.five,
              colorCode: TaskColor.five.code),
          ColorItem(
              onTap: () => setState(() => _selectedColor = TaskColor.six),
              isSelected: _selectedColor == TaskColor.six,
              colorCode: TaskColor.six.code),
          ColorItem(
              onTap: () => setState(() => _selectedColor = TaskColor.seven),
              isSelected: _selectedColor == TaskColor.seven,
              colorCode: TaskColor.seven.code),
          ColorItem(
              onTap: () => setState(() => _selectedColor = TaskColor.eight),
              isSelected: _selectedColor == TaskColor.eight,
              colorCode: TaskColor.eight.code),
          ColorItem(
              onTap: () => setState(() => _selectedColor = TaskColor.nine),
              isSelected: _selectedColor == TaskColor.nine,
              colorCode: TaskColor.nine.code),
        ],
      ),
    );
  }
}
