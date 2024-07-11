import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:on_time/gen/assets.gen.dart';
import 'package:on_time/resource/app_dimens.dart';
import 'package:on_time/resource/utils/extensions.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                AppDimens.small.width,
                AppIcon(
                  icon: context.isLightMode
                      ? SvgPicture.asset(Assets.images.svg.icSettingLight)
                      : SvgPicture.asset(Assets.images.svg.icSettingDark),
                  onTap: () {},
                ),
                AppIcon(
                  icon: context.isLightMode
                      ? SvgPicture.asset(Assets.images.svg.icNotificationLight)
                      : SvgPicture.asset(Assets.images.svg.icNotificationDark),
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
