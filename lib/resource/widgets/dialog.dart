part of '../../index.dart';

customeDialogee(
  BuildContext context, {
  required final String content,
  required final String primaryBtn,
  required final Function() onTapPrimaryBtn,
  required final Function() onTapSecendaryBtn,
  required final String secendaryBtn,
  final GestureTapCallback? onTap,
  final List<Widget>? actions,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          scrollable: true,
          actions: [
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Theme.of(context).colorScheme.error),
              ),
              onPressed: onTapPrimaryBtn,
              child: Text(
                primaryBtn,
                style: TextStyle(color: Theme.of(context).colorScheme.surface),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.onSurface),
              ),
              onPressed: onTapSecendaryBtn,
              child: Text(
                secendaryBtn,
                style: TextStyle(color: Theme.of(context).colorScheme.surface),
              ),
            ),
          ],
          content: FittedBox(
            child: Column(
              children: [
                const SizedBox(height: 15),
                Text(content),
              ],
            ),
          ),
        );
      });
}
