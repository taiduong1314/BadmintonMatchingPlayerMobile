part of 'profile_screen.dart';

extension Avatar on ProfileScreen {
  Widget _avatar({required String imageUrl}) {
    return GestureDetector(
      onTap: doChangeAvatar,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.colorGrey300),
                borderRadius: BorderRadius.circular(100),
              ),
              child: NetworkImageCustom.load(
                  imageUrl: imageUrl,
                  borderRadius: BorderRadius.circular(100),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  hideProgressIndicator: false,
                  widthErrorImage: 60)),
        ],
      ),
    );
  }

  Future<void> doChangeAvatar() async {
    await CommonModalBottomSheet.showUploadImage(
        context: Get.context!,
        onTapLeftButton: () {
          controller.doActionChangeAvatar(type: 0);
        },
        onTapRightButton: () {
          controller.doActionChangeAvatar(type: 1);
        });
  }
}
