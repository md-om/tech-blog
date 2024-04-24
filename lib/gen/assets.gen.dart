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

  $AssetsImagesIconsGen get icons => const $AssetsImagesIconsGen();
  $AssetsImagesPodcastGen get podcast => const $AssetsImagesPodcastGen();
  $AssetsImagesPublicGen get public => const $AssetsImagesPublicGen();
}

class $AssetsImagesIconsGen {
  const $AssetsImagesIconsGen();

  /// File path: assets/images/icons/hash.png
  AssetGenImage get hash => const AssetGenImage('assets/images/icons/hash.png');

  /// File path: assets/images/icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/images/icons/home.png');

  /// File path: assets/images/icons/mic.png
  AssetGenImage get mic => const AssetGenImage('assets/images/icons/mic.png');

  /// File path: assets/images/icons/pen.png
  AssetGenImage get pen => const AssetGenImage('assets/images/icons/pen.png');

  /// File path: assets/images/icons/user.png
  AssetGenImage get user => const AssetGenImage('assets/images/icons/user.png');

  /// File path: assets/images/icons/write.png
  AssetGenImage get write =>
      const AssetGenImage('assets/images/icons/write.png');

  /// List of all assets
  List<AssetGenImage> get values => [hash, home, mic, pen, user, write];
}

class $AssetsImagesPodcastGen {
  const $AssetsImagesPodcastGen();

  /// File path: assets/images/podcast/crypto.jpg
  AssetGenImage get crypto =>
      const AssetGenImage('assets/images/podcast/crypto.jpg');

  /// File path: assets/images/podcast/porsan.jpg
  AssetGenImage get porsan =>
      const AssetGenImage('assets/images/podcast/porsan.jpg');

  /// File path: assets/images/podcast/raftar.jpg
  AssetGenImage get raftar =>
      const AssetGenImage('assets/images/podcast/raftar.jpg');

  /// File path: assets/images/podcast/robo.jpg
  AssetGenImage get robo =>
      const AssetGenImage('assets/images/podcast/robo.jpg');

  /// File path: assets/images/podcast/siket.jpg
  AssetGenImage get siket =>
      const AssetGenImage('assets/images/podcast/siket.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [crypto, porsan, raftar, robo, siket];
}

class $AssetsImagesPublicGen {
  const $AssetsImagesPublicGen();

  /// File path: assets/images/public/cover.png
  AssetGenImage get cover =>
      const AssetGenImage('assets/images/public/cover.png');

  /// File path: assets/images/public/defaultAvatar.png
  AssetGenImage get defaultAvatar =>
      const AssetGenImage('assets/images/public/defaultAvatar.png');

  /// File path: assets/images/public/logo.png
  AssetGenImage get logo =>
      const AssetGenImage('assets/images/public/logo.png');

  /// File path: assets/images/public/techbot.svg
  String get techbot => 'assets/images/public/techbot.svg';

  /// List of all assets
  List<dynamic> get values => [cover, defaultAvatar, logo, techbot];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
