import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vbmsports/utils/common/asset/image.dart';

import '../../common/color.dart';

class NetworkImageCustom {
  static load({
    String imageUrl = '',
    double? width,
    double? height,
    Color? backgroundColor,
    BoxFit? fit,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    bool hideErrorWidget = false,
    bool hideProgressIndicator = true,
    BoxBorder? border,
    double? widthErrorImage,
    double? heightErrorImage,
  }) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Container(
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.zero,
          color: backgroundColor ?? Colors.transparent,
          border: border,
        ),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              hideProgressIndicator
                  ? const SizedBox()
                  : Center(
                      child: SizedBox(
                          width: width == null ? 20 : 20,
                          height: height == null ? 20 : 20,
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: AppColor.colorLight))),
          errorWidget: (context, url, error) => hideErrorWidget
              ? const SizedBox()
              : Center(
                  child: ClipRRect(
                    borderRadius: borderRadius ?? BorderRadius.zero,
                    child: Image(
                      image: const AssetImage(AssetImageName.logoOnly),
                      width: widthErrorImage ?? 80,
                      height: heightErrorImage ?? 80,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
