export 'image_cdn_extension.dart';

enum ImageCDNFormat { jpg, png, webp }

enum ImageCDNFit { cover, contain, fill, inside, outside }

///URL Manipulator for Image CDN
class ImageCDN {
  ///[url]
  ///A URL-Encoded link to the image you wish to cache and apply transformations to.
  ///
  ///Note: The image must be reachable by the image service (contact [ImageCDN] for whitelisting options).
  ///
  ///[height]
  ///Height of the desired image, in pixels.
  ///
  ///[width]
  ///Width of the desired image, in pixels.
  ///
  ///[format]
  ///Override the format output by the service.
  ///Options are: `webp`, `jpg`, `png`.
  ///Defaults to : `webp`.
  ///
  ///[fit]
  ///How to fill the space provided by height/width.
  ///Options are: `cover`, `contain`, `fill`, `inside` or `outside`.
  ///Defaults to: `cover`.
  static String convertUrl(String url,
      {int? width,
      int? height,
      ImageCDNFit fit = ImageCDNFit.contain,
      ImageCDNFormat format = ImageCDNFormat.webp}) {
    Map<String, String> params = {};
    if (width != null) params["width"] = "$width";
    if (height != null) params["height"] = "$height";

    params["fit"] = fit.name;
    params["format"] = format.name;

    if (params.isEmpty) return url;

    String paramsString =
        params.entries.map((e) => "${e.key}=${e.value}").join("&");

    String encodedUrl = Uri.encodeQueryComponent(url);
    return "https://imagecdn.app/v2/image/$encodedUrl?$paramsString}";
  }
}
