/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/icon_arrow_back.svg
  SvgGenImage get iconArrowBack =>
      const SvgGenImage('assets/icons/icon_arrow_back.svg');

  /// File path: assets/icons/icon_arrow_up.svg
  SvgGenImage get iconArrowUp =>
      const SvgGenImage('assets/icons/icon_arrow_up.svg');

  /// File path: assets/icons/icon_bell.svg
  SvgGenImage get iconBell => const SvgGenImage('assets/icons/icon_bell.svg');

  /// File path: assets/icons/icon_hide_password.svg
  SvgGenImage get iconHidePassword =>
      const SvgGenImage('assets/icons/icon_hide_password.svg');

  /// File path: assets/icons/icon_lock.svg
  SvgGenImage get iconLock => const SvgGenImage('assets/icons/icon_lock.svg');

  /// File path: assets/icons/icon_mail.svg
  SvgGenImage get iconMail => const SvgGenImage('assets/icons/icon_mail.svg');

  /// File path: assets/icons/icon_person.svg
  SvgGenImage get iconPerson =>
      const SvgGenImage('assets/icons/icon_person.svg');

  /// File path: assets/icons/icon_plus.svg
  SvgGenImage get iconPlus => const SvgGenImage('assets/icons/icon_plus.svg');

  /// File path: assets/icons/icon_search_small.svg
  SvgGenImage get iconSearchSmall =>
      const SvgGenImage('assets/icons/icon_search_small.svg');

  /// File path: assets/icons/icon_show_password.svg
  SvgGenImage get iconShowPassword =>
      const SvgGenImage('assets/icons/icon_show_password.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        iconArrowBack,
        iconArrowUp,
        iconBell,
        iconHidePassword,
        iconLock,
        iconMail,
        iconPerson,
        iconPlus,
        iconSearchSmall,
        iconShowPassword
      ];
}

class $AssetsLangGen {
  const $AssetsLangGen();

  /// File path: assets/lang/en_US.json
  String get enUS => 'assets/lang/en_US.json';

  /// List of all assets
  List<String> get values => [enUS];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/coin_switch_animation.json
  LottieGenImage get coinSwitchAnimation =>
      const LottieGenImage('assets/lottie/coin_switch_animation.json');

  /// List of all assets
  List<LottieGenImage> get values => [coinSwitchAnimation];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsLangGen lang = $AssetsLangGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(this._assetName);

  final String _assetName;

  LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    LottieDelegates? delegates,
    LottieOptions? options,
    void Function(LottieComposition)? onLoaded,
    LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
