part of 'chat_detail_view.dart';

extension BottomWidget on ChatDetailScreen {
  Widget _bottomWidget() {
    return _textField();
  }

  Widget _textField() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      decoration: BoxDecoration(
        color: AppColor.colorLight,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: controller.doChooseImage,
            child: SvgPicture.asset(AssetSVGName.cameraLens),
          ),
          spaceHorizontal(width: 12),
          Expanded(
            child: TextFormField(
              controller: controller.txtMessage,
              maxLines: 3,
              minLines: 1,
              textAlign: TextAlign.left,
              keyboardType: TextInputType.multiline,
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                // filled: true,
                contentPadding: EdgeInsets.only(bottom: 11),
                hintText: 'Nhập nội dung để trò chuyên...',
                border: InputBorder.none,
              ),
              onTap: () => AppDataGlobal.isKeyboardVisible.value = true,
              onFieldSubmitted: (value) {
                AppDataGlobal.isKeyboardVisible.value = false;
                controller.doSendChat();
              },
            ),
          ),
          GestureDetector(
            onTap: controller.doSendChat,
            child: Icon(
              Icons.send,
              color: AppColor.colorButton.withOpacity(0.7),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
