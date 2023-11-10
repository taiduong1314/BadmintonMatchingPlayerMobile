part of 'chat_screen.dart';

extension BodyCustom on ChatScreen {
  Widget _body() {
    return Container(
      width: Get.width,
      child: _widgetEmpty(),
    );
  }

  Widget _widgetEmpty() {
    return Column(
      children: [
        spaceVertical(height: 40),
        const Image(image: AssetImage(AssetImageName.empty)),
      ],
    );
  }
}
