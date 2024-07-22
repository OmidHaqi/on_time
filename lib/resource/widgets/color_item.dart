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
        width: 30,
        height: 30,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.all(3),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(colorCode)),
        child: isSelected
            ? const Icon(
                Icons.check,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}