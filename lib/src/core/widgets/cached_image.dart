import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:isd_tms/src/core/extensions/ui_extension.dart';

import 'image_shimmer.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.url,
    this.isSvg = false,
    this.child,
    this.width,
    this.height,
    this.memCacheHeight,
    this.maxWidthDiskCache,
    this.maxHeightDiskCache,
    this.memCacheWidth,
    this.radius = 10,
    this.shape,
    this.fit,
    this.errorWidget,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
  });

  final String url;
  final bool isSvg;
  final double? width;
  final double? height;
  final int? memCacheHeight;
  final int? maxWidthDiskCache;
  final int? maxHeightDiskCache;
  final int? memCacheWidth;
  final double radius;
  final BoxShape? shape;
  final BoxFit? fit;
  final Color? shimmerBaseColor;
  final Color? shimmerHighlightColor;
  final Widget? errorWidget;
  final Widget Function(ImageProvider)? child;

  @override
  Widget build(BuildContext context) {
    if (isSvg) {
      return FutureBuilder<File>(
        future: DefaultCacheManager().getSingleFile(url),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ImageShimmer(width: width, height: height);
          } else if (snapshot.hasError) {
            return Image.asset(
              'Assets.icons.appIcon.path',
              height: height,
              width: width,
              fit: BoxFit.cover,
            );
          } else if (!snapshot.hasData) {
            return const Center(child: Icon(Icons.image_not_supported));
          } else {
            return SvgPicture.file(
              snapshot.data!,
              width: width,
              height: height,
              fit: fit ?? BoxFit.cover,
              placeholderBuilder: (context) =>
                  errorWidget ??
                  ImageShimmer(
                    width: width,
                    height: height,
                    baseColor: shimmerBaseColor,
                    highlightColor: shimmerHighlightColor,
                  ),
            );
          }
        },
      );
    } else {
      return CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        memCacheWidth: memCacheWidth,
        memCacheHeight: memCacheHeight,
        maxWidthDiskCache: maxWidthDiskCache,
        maxHeightDiskCache: maxHeightDiskCache,
        imageBuilder: child != null
            ? (_, image) => child!.call(image)
            : (_, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: shape == null ? radius.br : null,
                  shape: shape ?? BoxShape.rectangle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: fit ?? BoxFit.cover,
                  ),
                ),
              ),
        placeholder: (_, __) => ImageShimmer(width: width, height: height),
        errorWidget: (_, url, __) {
          return errorWidget ??
              Container(
                decoration: BoxDecoration(
                  borderRadius: shape == null ? radius.br : null,
                  shape: shape ?? BoxShape.rectangle,
                  image: DecorationImage(
                    image: const AssetImage("Assets.icons.appIcon.path"),
                    fit: fit ?? BoxFit.cover,
                  ),
                ),
              );
        },
      );
    }
  }
}
