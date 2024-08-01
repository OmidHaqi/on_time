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

class TaskColorSelector extends StatelessWidget {
  final TaskColor selectedColor;
  final ValueChanged<TaskColor> onColorSelected;

  const TaskColorSelector({
    super.key,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: TaskColor.values.map((noteColor) {
          return ColorItem(
            onTap: () => onColorSelected(noteColor),
            isSelected: selectedColor == noteColor,
            colorCode: noteColor.code,
          );
        }).toList(),
      ),
    );
  }
}

NoteColor _noteSelectedColor = NoteColor.one;

class NoteColorSelector extends StatelessWidget {
  final NoteColor selectedColor;
  final ValueChanged<NoteColor> onColorSelected;

  const NoteColorSelector({
    super.key,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: NoteColor.values.map((noteColor) {
          return ColorItem(
            onTap: () => onColorSelected(noteColor),
            isSelected: selectedColor == noteColor,
            colorCode: noteColor.code,
          );
        }).toList(),
      ),
    );
  }
}
