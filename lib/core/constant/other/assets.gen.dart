/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Poppins-Regular.ttf
  String get poppinsRegular => 'assets/fonts/Poppins-Regular.ttf';

  /// List of all assets
  List<String> get values => [poppinsRegular];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/bag.png
  AssetGenImage get bag => const AssetGenImage('assets/icons/bag.png');

  /// File path: assets/icons/card.png
  AssetGenImage get card => const AssetGenImage('assets/icons/card.png');

  /// File path: assets/icons/cart.png
  AssetGenImage get cart => const AssetGenImage('assets/icons/cart.png');

  /// File path: assets/icons/food.png
  AssetGenImage get food => const AssetGenImage('assets/icons/food.png');

  /// File path: assets/icons/help-circle.png
  AssetGenImage get helpCircle =>
      const AssetGenImage('assets/icons/help-circle.png');

  /// File path: assets/icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/icons/home.png');

  /// File path: assets/icons/language.png
  AssetGenImage get language =>
      const AssetGenImage('assets/icons/language.png');

  /// File path: assets/icons/more.png
  AssetGenImage get more => const AssetGenImage('assets/icons/more.png');

  /// File path: assets/icons/newspaper.png
  AssetGenImage get newspaper =>
      const AssetGenImage('assets/icons/newspaper.png');

  /// File path: assets/icons/notification.png
  AssetGenImage get notification =>
      const AssetGenImage('assets/icons/notification.png');

  /// File path: assets/icons/payment.png
  AssetGenImage get payment => const AssetGenImage('assets/icons/payment.png');

  /// File path: assets/icons/person.png
  AssetGenImage get person => const AssetGenImage('assets/icons/person.png');

  /// File path: assets/icons/refresh-circle.png
  AssetGenImage get refreshCircle =>
      const AssetGenImage('assets/icons/refresh-circle.png');

  /// File path: assets/icons/restaurant .png
  AssetGenImage get restaurant =>
      const AssetGenImage('assets/icons/restaurant .png');

  /// File path: assets/icons/search.png
  AssetGenImage get search => const AssetGenImage('assets/icons/search.png');

  /// File path: assets/icons/shield.png
  AssetGenImage get shield => const AssetGenImage('assets/icons/shield.png');

  /// File path: assets/icons/star.png
  AssetGenImage get star => const AssetGenImage('assets/icons/star.png');

  /// File path: assets/icons/success.png
  AssetGenImage get success => const AssetGenImage('assets/icons/success.png');

  /// File path: assets/icons/table.png
  AssetGenImage get table => const AssetGenImage('assets/icons/table.png');

  /// File path: assets/icons/vector.png
  AssetGenImage get vector => const AssetGenImage('assets/icons/vector.png');

  /// File path: assets/icons/vector1.png
  AssetGenImage get vector1 => const AssetGenImage('assets/icons/vector1.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bag,
        card,
        cart,
        food,
        helpCircle,
        home,
        language,
        more,
        newspaper,
        notification,
        payment,
        person,
        refreshCircle,
        restaurant,
        search,
        shield,
        star,
        success,
        table,
        vector,
        vector1
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/banner.png
  AssetGenImage get banner => const AssetGenImage('assets/images/banner.png');

  /// File path: assets/images/banner2.jpg
  AssetGenImage get banner2 => const AssetGenImage('assets/images/banner2.jpg');

  /// File path: assets/images/foto.png
  AssetGenImage get foto => const AssetGenImage('assets/images/foto.png');

  /// File path: assets/images/menus.png
  AssetGenImage get menus => const AssetGenImage('assets/images/menus.png');

  /// File path: assets/images/resto.png
  AssetGenImage get resto => const AssetGenImage('assets/images/resto.png');

  /// List of all assets
  List<AssetGenImage> get values => [banner, banner2, foto, menus, resto];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
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
    bool gaplessPlayback = true,
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
