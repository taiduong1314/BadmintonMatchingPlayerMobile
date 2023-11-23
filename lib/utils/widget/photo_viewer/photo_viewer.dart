// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../common/color.dart';
import '../../common/text_style.dart';
import '../text/montserrat.dart';

class PhotoViewer extends StatefulWidget {
  final List<String> imgUrl;
  final int index;
  final bool isShowIndex;
  const PhotoViewer({
    Key? key,
    required this.imgUrl,
    this.index = 0,
    this.isShowIndex = true,
  }) : super(key: key);

  @override
  State<PhotoViewer> createState() => _PhotoViewerState();
}

class _PhotoViewerState extends State<PhotoViewer> {
  late int _currentIndex;
  late PageController _pageController;

  @override
  void initState() {
    _currentIndex = widget.index;
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(children: [
          PhotoViewGallery.builder(
            pageController: _pageController,
            scrollPhysics: const ClampingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: widget.imgUrl[index].isNotEmpty
                    ? CachedNetworkImageProvider(widget.imgUrl[index])
                    : null,
                initialScale: PhotoViewComputedScale.contained,
                tightMode: true,
              );
            },
            itemCount: widget.imgUrl.length,
            onPageChanged: (index) {
              _currentIndex = index;
              setState(() {});
            },
          ),
          Positioned(
            top: 13,
            left: 18,
            child: GestureDetector(
              onTap: Get.back,
              child: Row(
                children: [
                  Icon(Icons.chevron_left_rounded,
                      size: 30, color: AppColor.colorLight),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0, left: 4.0),
                    child: CustomText.textPlusJakarta(
                        text: 'Quay lại',
                        style: TextAppStyle.h2()
                            .copyWith(color: AppColor.colorLight)),
                  ),
                ],
              ),
            ),
          ),
       if(widget.isShowIndex) Positioned(
            top: 13,
            right: 18,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: CustomText.textPlusJakarta(
                  text: '${_currentIndex + 1} / ${widget.imgUrl.length}',
                  style: TextAppStyle.h2()
                      .copyWith(color: AppColor.colorLight)),
            ),
          )
        ]),
      ),
    );
  }
}
