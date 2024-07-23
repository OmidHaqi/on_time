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
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(colorCode),
              border: Border.all(color: Theme.of(context).colorScheme.onPrimary)),
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

TodoColor _selectedColor = TodoColor.one;

class TodoColorSelector extends StatefulWidget {
  const TodoColorSelector({super.key});

  @override
  State<TodoColorSelector> createState() => _TodoColorSelectorState();
}

class _TodoColorSelectorState extends State<TodoColorSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ColorItem(
            onTap: () => setState(() => _selectedColor = TodoColor.one),
            isSelected: _selectedColor == TodoColor.one,
            colorCode: TodoColor.one.code),
        ColorItem(
            onTap: () => setState(() => _selectedColor = TodoColor.two),
            isSelected: _selectedColor == TodoColor.two,
            colorCode: TodoColor.two.code),
        ColorItem(
            onTap: () => setState(() => _selectedColor = TodoColor.three),
            isSelected: _selectedColor == TodoColor.three,
            colorCode: TodoColor.three.code),
        ColorItem(
            onTap: () => setState(() => _selectedColor = TodoColor.four),
            isSelected: _selectedColor == TodoColor.four,
            colorCode: TodoColor.four.code),
        ColorItem(
            onTap: () => setState(() => _selectedColor = TodoColor.five),
            isSelected: _selectedColor == TodoColor.five,
            colorCode: TodoColor.five.code),
        ColorItem(
            onTap: () => setState(() => _selectedColor = TodoColor.six),
            isSelected: _selectedColor == TodoColor.six,
            colorCode: TodoColor.six.code),
      ],
    );
  }
}
