import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:progressive_cached_network_image_cdn/progressive_cached_network_image_cdn.dart';

main() {
  runApp(const MaterialApp(
    title: "Example of ProgressiveCachedNetworkImageCDN",
    home: Example(),
  ));
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Network Resizer')),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Text(
              "All this image url was 1024x1024, we load it as progressive image with 10x10 pixels",
              style: Theme.of(context).textTheme.headline6),
          const Divider(),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.spaceBetween,
            children: List.generate(
              10,
              (index) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade100),
                width: MediaQuery.of(context).size.width / 2 - 20,
                height: 200,
                child: ProgressiveCachedNetworkImage(
                  "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj4EsXijhrg5-qcNei4DmxwpfifVpYX_nTTYWvrJmcFOkBZhZbyf5noPM3YKeGNPJEnC6YJksq7w_ZJbRJrC7JvtYi5ytdcwpCARY-MfoMX43uSifDaP9Jglq-rHt1pKylz86qTVjzEUXKOtfYjYKd7JujTc9Szqy_-R4xXYs_odsg2bh5zOJc0N5pw/w1024/IMG_3044.jpeg?timestamp=${DateTime.now().millisecondsSinceEpoch}$index",
                  fit: BoxFit.cover,
                  progressiveResizeHeight: 10,
                  progressiveResizeWidth: 10,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),

          ///This image is 2048x2048, converted to 512x512
          Text("All this image url was 1024x1024, but we convert it to 512x512",
              style: Theme.of(context).textTheme.headline6),
          const Divider(),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.spaceBetween,
            children: List.generate(
              10,
              (index) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade100),
                width: MediaQuery.of(context).size.width / 2 - 20,
                height: 200,
                child: CachedNetworkImageCDN(
                  "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj4EsXijhrg5-qcNei4DmxwpfifVpYX_nTTYWvrJmcFOkBZhZbyf5noPM3YKeGNPJEnC6YJksq7w_ZJbRJrC7JvtYi5ytdcwpCARY-MfoMX43uSifDaP9Jglq-rHt1pKylz86qTVjzEUXKOtfYjYKd7JujTc9Szqy_-R4xXYs_odsg2bh5zOJc0N5pw/w1024/IMG_3044.jpeg?timestamp=${DateTime.now().millisecondsSinceEpoch}",
                  resizerHeight: 512,
                  resizerWidth: 512,
                ),
              ),
            ),
          ),

          ///Resize image with CacheNetworkImage extensions
          CachedNetworkImage(
            imageUrl:
                "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj4EsXijhrg5-qcNei4DmxwpfifVpYX_nTTYWvrJmcFOkBZhZbyf5noPM3YKeGNPJEnC6YJksq7w_ZJbRJrC7JvtYi5ytdcwpCARY-MfoMX43uSifDaP9Jglq-rHt1pKylz86qTVjzEUXKOtfYjYKd7JujTc9Szqy_-R4xXYs_odsg2bh5zOJc0N5pw/w1024/IMG_3044.jpeg?timestamp=${DateTime.now().millisecondsSinceEpoch}",
          ).resizeImage(
            width: 120,
          ),

          const SizedBox(height: 50),
          Text(
              "All credits belong to the owner of [CachedNetworkImage] and [ImageCDN]",
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center),
          Text("Made with love by @nizwar",
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
