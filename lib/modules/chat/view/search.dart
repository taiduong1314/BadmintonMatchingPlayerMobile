part of 'chat_screen.dart';

extension SearchCustom on ChatScreen {
  Widget _search() {
    return _inputForm(
        controllerText: controller.controllerSearch,
        hintText: 'Nhập để tìm kiếm');
  }

  Widget _inputForm(
      {required TextEditingController controllerText,
      required String hintText,
      TextInputType? keyboardType}) {
    return Container(
      width: Get.width,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color(0xFF232323).withOpacity(0.05),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          spaceHorizontal(width: 15),
          Icon(
            Icons.search,
            size: 20,
            color: const Color(0xFF232323).withOpacity(0.5),
          ),
          Expanded(
            child: TextFormField(
              controller: controllerText,
              keyboardType: keyboardType,
              minLines: 1,
              textAlign: TextAlign.left,
              cursorColor: AppColor.colorLogo,
              textAlignVertical: TextAlignVertical.center,
              style: TextAppStyle.bodySmall(),
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(bottom: 15, left: 6, right: 15),
                  hintText: hintText,
                  hintStyle: TextAppStyle.bodySmall()
                      .copyWith(color: AppColor.colorTextGrey100),
                  border: InputBorder.none),
              // onChanged: onChangedTextField,
            ),
          ),
        ],
      ),
    );
  }
}
