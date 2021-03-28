import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

class ClipImage extends StatelessWidget {
  final String url;
  final double size;

  ClipImage({
    @required this.url,
    this.size = 64,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size,
        width: size,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(size / 2),
            child: CachedNetworkImage(
                cacheManager: GetIt.instance.get<BaseCacheManager>(),
                imageUrl: url,
                placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                    child: Container(color: Colors.white)),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error, key: Key('clip_image_error')))));
  }
}
