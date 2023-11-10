// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../common/asset/image.dart';
import '../../common/asset/svg.dart';
import '../../common/color.dart';

class NetworkImagePreview extends StatelessWidget {
  final String imgUrl;
  const NetworkImagePreview({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width * 0.32,
      width: Get.width * 0.278,
      margin: const EdgeInsets.only(bottom: 11.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: AppColor.colorBlueBottom),
      ),
      child: Stack(children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Image.asset(
                    AssetImageName.logoOnly,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: ClipPath(
            clipper: CornerClipper(),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.colorBlueBottom),
            ),
          ),
        ),
        // Positioned(
        //   top: 1.5,
        //   left: 0,
        //   child: SvgPicture.asset(AssetSVGName.iconCheck, width: 11),
        // )
      ]),
    );
  }
}

class CornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 17);
    path.lineTo(18, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
