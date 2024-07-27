part of '../../index.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.note,
    required this.onTap,
    required this.onLongPress,
  });

  final NoteModel note;
  final Function() onTap;
  final Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(AppDimens.small),
      color: Color(note.color.code),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 300,
            minHeight: 100,
          ),
          decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).colorScheme.onSurface),
              borderRadius: BorderRadius.circular(AppDimens.small)),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.medium,
            vertical: AppDimens.medium,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: AutoSizeText(
                  note.title,
                  presetFontSizes: const [16, 14, 12, 10, 8],
                  textScaleFactor: 1.3,
                  softWrap: true,
                  style: AppTextStyles.noteTitleTextStyle
                      .apply(color: AppColors.appPrimaryDark),
                  group: AutoSizeGroup(),
                  overflow: TextOverflow.fade,
                ),
              ),
              if (note.description.isNotEmpty)
                Flexible(
                  child: Text(
                    note.description,
                    overflow: TextOverflow.clip,
                    style: AppTextStyles.noteDecTextStyle.copyWith(
                      color: AppColors.appPrimaryDark,
                    ),
                  ),
                ),
              AppDimens.medium.height,
              Text(
                note.dateTime,
                style: AppTextStyles.noteDecTextStyle
                    .copyWith(color: AppColors.appPrimaryDark),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
