import "package:flutter/material.dart";

import "../api_base/directus_assets_url.dart";
import "../theme/colors.dart";
import "my_cached_image.dart";
import "optimized_directus_image.dart";

extension ShowFullscreenImageX on BuildContext {
  Future<void> showFullScreenImage(
    String? imageUrl, {
    bool shouldHaveRectBackground = false,
  }) async {
    if (imageUrl == null) {
      return;
    }
    await showDialog(
      context: this,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: InteractiveViewer(
            minScale: 1,
            maxScale: 3,
            child: shouldHaveRectBackground
                ? _ImageWithWhiteBackground(imageUrl: imageUrl)
                : _ImageWithoutBackground(imageUrl: imageUrl),
          ),
        );
      },
    );
  }
}

class _ImageWithoutBackground extends StatelessWidget {
  const _ImageWithoutBackground({
    required this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MyCachedImage(
        imageUrl?.directusUrlWithoutParams,
        boxFit: BoxFit.scaleDown,
        noShimmeringLoading: true,
      ),
    );
  }
}

class _ImageWithWhiteBackground extends StatelessWidget {
  const _ImageWithWhiteBackground({
    required this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            color: ColorsConsts.greyLight,
            borderRadius: BorderRadius.circular(30),
          ),
          width: MediaQuery.sizeOf(context).shortestSide,
          height: MediaQuery.sizeOf(context).shortestSide,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: MyCachedImage(
              imageUrl?.directusUrlWithoutParams,
              boxFit: BoxFit.scaleDown,
              noShimmeringLoading: true,
            ),
          ),
        ),
      ),
    );
  }
}

class ZoomableOptimizedDirectusImage extends StatelessWidget {
  const ZoomableOptimizedDirectusImage(
    this.imageUrl, {
    super.key,
    this.noShimmeringLoading = false,
    this.boxFit = BoxFit.cover,
    this.shouldHaveRectBackground = false,
  });

  final String? imageUrl;
  final bool noShimmeringLoading;
  final BoxFit boxFit;
  final bool shouldHaveRectBackground;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context.showFullScreenImage(
          imageUrl,
          shouldHaveRectBackground: shouldHaveRectBackground,
        );
      },
      child: OptimizedDirectusImage(
        imageUrl,
        boxFit: boxFit,
        noShimmeringLoading: noShimmeringLoading,
      ),
    );
  }
}

class ZoomableCachedImage extends StatelessWidget {
  const ZoomableCachedImage(
    this.imageUrl, {
    super.key,
    this.noShimmeringLoading = false,
    this.boxFit = BoxFit.cover,
    this.shouldHaveRectBackground = false,
  });

  final String? imageUrl;
  final bool noShimmeringLoading;
  final BoxFit boxFit;
  final bool shouldHaveRectBackground;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context.showFullScreenImage(
          imageUrl,
          shouldHaveRectBackground: shouldHaveRectBackground,
        );
      },
      child: MyCachedImage(
        imageUrl,
        boxFit: boxFit,
        noShimmeringLoading: noShimmeringLoading,
      ),
    );
  }
}
