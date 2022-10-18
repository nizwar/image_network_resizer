# Progressive Cached Network Image CDN
Load image from network and cache them with cached_network_image and resize it with ImageCDN (Server side).

This plugin was extended from [cached_network_image](https://pub.dev/packages/cached_network_image) plugin

## ImageCDN
You can convert your image's url with
```dart
///return String
ImageCDN.convertUrl("IMAGE_URL", {
    int? width, 
    int? height, 
    ImageCDNFit fit = ImageCDNFit.contain, 
    ImageCDNFormat format = ImageCDNFormat.webp
}) 
```

## CachedNetworkImageCDN
This is extended with `CachedNetworkImage`, means you can use all params that related with the widget
```dart
CachedNetworkImageCDN(
    "IMAGE_URL",
    this.resizerFormat = ImageCDNFormat.webp,
    this.resizerFit = ImageCDNFit.contain,
    this.resizerWidth,
    this.resizerHeight,
),
```

## ProgressiveCachedNetworkImage
This is extended with `CachedNetworkImageCDN`, means you can use all params that related with the widget
```dart
ProgressiveCachedNetworkImage(
    "IMAGE_URL", 
    this.progressivePlaceholder,
    this.progressiveBlur = 2,
    this.progressiveErrorPlaceholder,
    this.progressiveResizeHeight,
    this.progressiveResizeWidth,
    this.progressiveResizerFit = ImageCDNFit.contian,
    this.progressiveResizerFormat = ImageCDNFormat.webp,
)
```

## Extensions
You can directly resize your CachedNetworkImage by adding

```dart
///Make sure you already import the plugin
import 'package:progressive_cached_network_image_cdn/progressive_cached_network_image_cdn.dart';

CachedNetworkImage( ... ).resizeImage(
        width: width,
        height: height,
        fit: fit,
        format: format,
    )
```


# Love my work?
I will be so happy if you give a 👍 &nbsp;or maybe a cup of ☕️ 😊

<a href="https://paypal.me/nizwar/"><img src="https://raw.githubusercontent.com/andreostrovsky/donate-with-paypal/master/blue.svg" height="40"></a> 
