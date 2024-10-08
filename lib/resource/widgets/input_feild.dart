part of '../../index.dart';

class InputField extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final String hint;
  final Widget? widget;
  final Function()? onTap;
  final bool readOnly;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;

  const InputField({
    super.key,
    this.title,
    this.controller,
    required this.hint,
    this.widget,
    this.onTap,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon, this.maxLines, this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: TextFormField(
         textAlignVertical: TextAlignVertical.top,
        maxLines: maxLines,
        minLines: minLines,
        style: const TextStyle(color: AppColors.appPrimaryDark),
        autofocus: false,
        
        onTap: onTap,
        readOnly: readOnly,
        controller: controller,
        decoration: InputDecoration(
            counterText: '',
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.appPrimaryDark)),
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.appPrimaryDark)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.appPrimaryDark)),
            hintStyle: const TextStyle(color: AppColors.appPrimaryDark),
            labelStyle: const TextStyle(color: AppColors.appPrimaryDark),
            labelText: title,
            alignLabelWithHint: true,
            
            hintText: hint,
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.appPrimaryDark)),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon),
      ),
    );
  }
}
