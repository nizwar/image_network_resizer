import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'image_cdn.dart';

extension ImageCDNExtensions on CachedNetworkImage {
  ///Resize the image to the desired size with [ImageCDN] service.
  ///This will return a new [CachedNetworkImage] with the new url.
  ///
  ///[resizerWidth] and [resizerHeight] are required as pixels size.
  Widget resizeImage(
      {int? width,
      int? height,
      ImageCDNFit fit = ImageCDNFit.contain,
      ImageCDNFormat format = ImageCDNFormat.webp}) {
    return copyWith(
        imageUrl: ImageCDN.convertUrl(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      format: format,
    ));
  }

  Widget copyWith({
    String? imageUrl,
    String? cacheKey,
    ImageWidgetBuilder? imageBuilder,
    PlaceholderWidgetBuilder? placeholder,
    ProgressIndicatorBuilder? progressIndicatorBuilder,
    LoadingErrorWidgetBuilder? errorWidget,
    Duration? placeholderFadeInDuration,
    Duration? fadeOutDuration,
    Curve? fadeOutCurve,
    Duration? fadeInDuration,
    Curve? fadeInCurve,
    double? width,
    double? height,
    BoxFit? fit,
    Alignment? alignment,
    ImageRepeat? repeat,
    bool? matchTextDirection,
    Map<String, String>? httpHeaders,
    bool? useOldImageOnUrlChange,
    Color? color,
    BlendMode? colorBlendMode,
    FilterQuality? filterQuality,
    int? memCacheWidth,
    int? memCacheHeight,
    int? maxWidthDiskCache,
    int? maxHeightDiskCache,
  }) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? this.imageUrl,
      cacheKey: cacheKey ?? this.cacheKey,
      imageBuilder: imageBuilder ?? this.imageBuilder,
      placeholder: placeholder ?? this.placeholder,
      progressIndicatorBuilder:
          progressIndicatorBuilder ?? this.progressIndicatorBuilder,
      errorWidget: errorWidget ?? this.errorWidget,
      placeholderFadeInDuration:
          placeholderFadeInDuration ?? this.placeholderFadeInDuration,
      fadeOutDuration: fadeOutDuration ?? this.fadeOutDuration,
      fadeOutCurve: fadeOutCurve ?? this.fadeOutCurve,
      fadeInDuration: fadeInDuration ?? this.fadeInDuration,
      fadeInCurve: fadeInCurve ?? this.fadeInCurve,
      width: width ?? this.width,
      height: height ?? this.height,
      fit: fit ?? this.fit,
      alignment: alignment ?? this.alignment,
      repeat: repeat ?? this.repeat,
      matchTextDirection: matchTextDirection ?? this.matchTextDirection,
      httpHeaders: httpHeaders ?? this.httpHeaders,
      useOldImageOnUrlChange:
          useOldImageOnUrlChange ?? this.useOldImageOnUrlChange,
      color: color ?? this.color,
      colorBlendMode: colorBlendMode ?? this.colorBlendMode,
      filterQuality: filterQuality ?? this.filterQuality,
      memCacheWidth: memCacheWidth ?? this.memCacheWidth,
      memCacheHeight: memCacheHeight ?? this.memCacheHeight,
      maxWidthDiskCache: maxWidthDiskCache ?? this.maxWidthDiskCache,
      maxHeightDiskCache: maxHeightDiskCache ?? this.maxHeightDiskCache,
    );
  }
}
