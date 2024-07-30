/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/icon
  $AssetsImagesIconGen get icon => const $AssetsImagesIconGen();

  /// Directory path: assets/images/svg
  $AssetsImagesSvgGen get svg => const $AssetsImagesSvgGen();
}

class $AssetsImagesIconGen {
  const $AssetsImagesIconGen();

  /// File path: assets/images/icon/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/images/icon/icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [icon];
}

class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();

  /// File path: assets/images/svg/ic_notification.svg
  String get icNotification => 'assets/images/svg/ic_notification.svg';

  /// File path: assets/images/svg/ic_search.svg
  String get icSearch => 'assets/images/svg/ic_search.svg';

  /// File path: assets/images/svg/ic_setting.svg
  String get icSetting => 'assets/images/svg/ic_setting.svg';

  /// File path: assets/images/svg/vc_empty_dark.svg
  String get vcEmptyDark => 'assets/images/svg/vc_empty_dark.svg';

  /// File path: assets/images/svg/vc_empty_light.svg
  String get vcEmptyLight => 'assets/images/svg/vc_empty_light.svg';

  /// File path: assets/images/svg/vc_intro_one_dark.svg
  String get vcIntroOneDark => 'assets/images/svg/vc_intro_one_dark.svg';

  /// File path: assets/images/svg/vc_intro_one_light.svg
  String get vcIntroOneLight => 'assets/images/svg/vc_intro_one_light.svg';

  /// File path: assets/images/svg/vc_intro_three_dark.svg
  String get vcIntroThreeDark => 'assets/images/svg/vc_intro_three_dark.svg';

  /// File path: assets/images/svg/vc_intro_three_light.svg
  String get vcIntroThreeLight => 'assets/images/svg/vc_intro_three_light.svg';

  /// File path: assets/images/svg/vc_intro_two_dark.svg
  String get vcIntroTwoDark => 'assets/images/svg/vc_intro_two_dark.svg';

  /// File path: assets/images/svg/vc_intro_two_light.svg
  String get vcIntroTwoLight => 'assets/images/svg/vc_intro_two_light.svg';

  /// List of all assets
  List<String> get values => [
        icNotification,
        icSearch,
        icSetting,
        vcEmptyDark,
        vcEmptyLight,
        vcIntroOneDark,
        vcIntroOneLight,
        vcIntroThreeDark,
        vcIntroThreeLight,
        vcIntroTwoDark,
        vcIntroTwoLight
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
