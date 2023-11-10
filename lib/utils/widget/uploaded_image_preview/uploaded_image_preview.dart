// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../common/asset/svg.dart';
import '../../common/color.dart';

class UploadImagePreview extends StatelessWidget {
  final String filePath;
  final double? widthImage;

  final double? heightImage;

  const UploadImagePreview({
    Key? key,
    required this.filePath,
    this.widthImage,
    this.heightImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightImage ?? Get.width * 0.32,
      width: widthImage ?? Get.width * 0.289,
      margin: const EdgeInsets.only(bottom: 11.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: AppColor.colorBlueBottom),
          image: DecorationImage(
            image: FileImage(File(filePath)),
            fit: BoxFit.cover,
          )),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(55),
                    color: AppColor.colorErrorText),
                child: Icon(
                  Icons.close_sharp,
                  size: 20,
                  color: AppColor.colorAppBar,
                )),
          ),
        ),
        // Positioned.fill(
        //   child: ClipPath(
        //     clipper: CornerClipper(),
        //     child: Container(
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(8),
        //           color: AppColor.colorBlueBottom),
        //     ),
        //   ),
        // ),
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
