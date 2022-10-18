import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'image_cdn.dart';

/// Widget that extends [CachedNetworkImage] with [ImageCDN] support.
/// Allow you to resize images from network, and reduce the size of the image.
class CachedNetworkImageCDN extends CachedNetworkImage {
  ///Override the format output by the service.
  ///Options are: `webp`, `jpg`, `png`.
  ///
  ///Defaults to : webp
  final ImageCDNFormat resizerFormat;

  ///How to fill the space provided by height/width.
  ///Options are: `cover`, `contain`, `fill`, `inside` or `outside`.
  ///
  ///Defaults to: `contain`.
  final ImageCDNFit resizerFit;

  ///Height of the desired image, in pixels.
  final int? resizerHeight;

  ///Width of the desired image, in pixels.
  final int? resizerWidth;

  CachedNetworkImageCDN(
    String imageUrl, {
    super.key,
    this.resizerFormat = ImageCDNFormat.webp,
    this.resizerFit = ImageCDNFit.contain,
    this.resizerWidth,
    this.resizerHeight,
    // CachedNetworkImage params
    super.httpHeaders,
    super.imageBuilder,
    super.placeholder,
    super.progressIndicatorBuilder,
    super.errorWidget,
    super.fadeOutDuration,
    super.fadeOutCurve,
    super.fadeInDuration,
    super.fadeInCurve,
    super.width,
    super.height,
    super.fit,
    super.alignment,
    super.repeat,
    super.matchTextDirection,
    super.cacheManager,
    super.useOldImageOnUrlChange,
    super.color,
    super.filterQuality,
    super.colorBlendMode,
    super.placeholderFadeInDuration,
    super.memCacheWidth,
    super.memCacheHeight,
    super.cacheKey,
    super.maxWidthDiskCache,
    super.maxHeightDiskCache,
    super.imageRenderMethodForWeb,
  }) : super(
            imageUrl: ImageCDN.convertUrl(
          imageUrl,
          width: resizerWidth,
          height: resizerHeight,
          fit: resizerFit,
          format: resizerFormat,
        ));
}

///Show progressive image while loading with [CachedNetworkImageCDN]
class ProgressiveCachedNetworkImage extends CachedNetworkImageCDN {
  final String url;

  ///Blur density of the progressive image.
  final double progressiveBlur;

  ///Will shown when image is loading and small placeholder is not provided yet
  final Widget Function(BuildContext conetxt, String url)?
      progressivePlaceholder;

  ///Will shown when fail to load the image;
  final Widget Function(BuildContext context, String url, dynamic error)?
      progressiveErrorPlaceholder;

  ///Width of the desired progressive image, in pixels.
  final int? progressiveResizeWidth;

  ///Height of the desired progressive image, in pixels.
  final int? progressiveResizeHeight;

  ///Override the format output by the service.
  ///Options are: `webp`, `jpg`, `png`.
  ///
  ///Defaults to : webp
  final ImageCDNFormat progressiveResizerFormat;

  ///How to fill the space provided by height/width.
  ///Options are: `cover`, `contain`, `fill`, `inside` or `outside`.
  ///
  ///Defaults to: `cover`.
  final ImageCDNFit progressiveResizerFit;

  ProgressiveCachedNetworkImage(
    this.url, {
    super.key,
    Alignment alignment = Alignment.center,
    this.progressivePlaceholder,
    this.progressiveBlur = 2,
    this.progressiveErrorPlaceholder,
    this.progressiveResizeHeight,
    this.progressiveResizeWidth,
    this.progressiveResizerFit = ImageCDNFit.contain,
    this.progressiveResizerFormat = ImageCDNFormat.webp,

    // CachedNetworkImage params
    super.resizerFit,
    super.resizerFormat,
    super.resizerHeight,
    super.resizerWidth,
    super.httpHeaders,
    super.imageBuilder,
    super.progressIndicatorBuilder,
    super.fadeOutDuration,
    super.fadeOutCurve,
    super.fadeInDuration,
    super.fadeInCurve,
    super.width,
    super.height,
    super.fit,
    super.repeat,
    super.matchTextDirection,
    super.cacheManager,
    super.useOldImageOnUrlChange,
    super.color,
    super.filterQuality,
    super.colorBlendMode,
    super.placeholderFadeInDuration,
    super.memCacheWidth,
    super.memCacheHeight,
    super.cacheKey,
    super.maxWidthDiskCache,
    super.maxHeightDiskCache,
    super.imageRenderMethodForWeb,
  }) : super(
          url,
          placeholder: (context, urlPlaceholder) => _smallPlaceholder(
            url,
            fit: fit,
            alignment: alignment,
            progressiveErrorPlaceholder: progressiveErrorPlaceholder,
            progressivePlaceholder: progressivePlaceholder,
            broken: false,
            resizeHeight: progressiveResizeWidth,
            resizeWidth: progressiveResizeHeight,
            blurDensity: progressiveBlur,
            resizerFormat: progressiveResizerFormat,
            resizerFit: progressiveResizerFit,
          ),
          errorWidget: progressiveErrorPlaceholder,
        );

  static Widget _smallPlaceholder(
    String url, {
    BoxFit? fit = BoxFit.cover,
    bool broken = false,
    double blurDensity = 2,
    int? resizeWidth = 128,
    int? resizeHeight = 128,
    Alignment? alignment,
    ImageCDNFormat resizerFormat = ImageCDNFormat.webp,
    ImageCDNFit resizerFit = ImageCDNFit.cover,
    Widget Function(BuildContext context, String url)? progressivePlaceholder,
    Widget Function(BuildContext context, String url, dynamic error)?
        progressiveErrorPlaceholder,
  }) {
    return CachedNetworkImageCDN(
      url,
      fit: fit,
      resizerWidth: resizeWidth,
      resizerHeight: resizeHeight,
      resizerFit: resizerFit,
      alignment: alignment ?? Alignment.center,
      fadeInDuration: Duration.zero,
      imageBuilder: (context, imageProvider) => Material(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurDensity, sigmaY: blurDensity),
          child: Image(image: imageProvider, fit: fit),
        ),
      ),
      placeholderFadeInDuration: Duration.zero,
      placeholder: progressivePlaceholder,
      errorWidget: progressiveErrorPlaceholder,
    );
  }
}
