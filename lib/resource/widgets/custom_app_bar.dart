part of '../../index.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  @override
  final Widget child;

  final double appBarHeight;

  const CustomAppBar(
      {super.key, required this.child, required this.appBarHeight});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: SizedBox(
        height: 100,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  AppDimens.small.width,
                  AppIcon(
                    icon: SvgPicture.asset(
                      Assets.images.svg.icSetting,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.onSurface,
                        BlendMode.srcIn,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const SettingsPage()));
                    },
                  ),
                  AppIcon(
                    icon: SvgPicture.asset(
                      Assets.images.svg.icNotification,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.onSurface,
                        BlendMode.srcIn,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: AppDimens.medium),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

class AppIcon extends StatelessWidget {
  final void Function() onTap;
  final Widget icon;
  const AppIcon({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.small),
        child: SizedBox(
          height: 30,
          width: 30,
          child: icon,
        ),
      ),
    );
  }
}
