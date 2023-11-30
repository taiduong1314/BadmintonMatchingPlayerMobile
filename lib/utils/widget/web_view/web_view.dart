import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vbmsports/utils/common/asset/animation.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../common/color.dart';
import '../../common/data.dart';
import '../../utils.dart';
import '../space/space.dart';

class WebViewCustom extends StatefulWidget {
  String url;

  WebViewCustom({required this.url});

  @override
  State<WebViewCustom> createState() => _WebViewCustomState();
}

class _WebViewCustomState extends State<WebViewCustom> {
  late WebViewController controller;

  double progressPercent = 0;

  bool isMomo = false;

  @override
  void initState() {
    handleInit();
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    if (!mounted) return;
    super.setState(fn);
  }

  void handleInit() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            progressPercent = progress.toDouble();
            setState(() {});
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            if (kDebugMode) {
              print(
                  '********* ERROR WebResourceError: ${error.url} --- ${error.description}');
            }
          },
          onNavigationRequest: (NavigationRequest request) async {
            if (request.url.contains('TransactionStatus')) {
              bool isSuccess = (request.url.substring(
                      request.url.indexOf('TransactionStatus=') + 18,
                      request.url.indexOf('TransactionStatus=') + 20)) ==
                  '00';
              Navigator.of(context).pop(isSuccess);
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: AppColor.colorLight,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          spaceVertical(height: AppDataGlobal.safeTop),
          // if (isMomo) _appBar(context, title: 'Quay về'),
          Expanded(
            child: progressPercent == 100
                ? WebViewWidget(
                    controller: controller,
                  )
                : Center(
                    child:
                        Lottie.asset(AssetAnimationCustom.loading, width: 200),
                  ),
          ),
        ],
      ),
    );
  }

// Widget _appBar(BuildContext context, {required String title}) {
//   return Padding(
//     padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
//     child: Row(
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         GestureDetector(
//             onTap: () => Navigator.of(context).pop(),
//             child: SvgPicture.asset(AssetSVGName.arrowLeft)),
//         spaceHorizontal(width: 12),
//         CustomText.textPlusJakarta(
//             text: title,
//             style: TextAppStyle.h4()
//                 .copyWith(color: AppColor.colorDark)),
//       ],
//     ),
//   );
// }
}
