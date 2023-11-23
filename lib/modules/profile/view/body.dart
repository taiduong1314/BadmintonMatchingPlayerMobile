part of 'profile_screen.dart';

extension BodyCustom on ProfileScreen {
  Widget _body() {
    return Column(children: [
      spaceVertical(height: 20),
      _avatar(imageUrl: AppDataGlobal.user.value.avatar ?? ''),
      spaceVertical(height: 30),
      _inputForm(
          title: 'Biệt danh',
          hintText: 'Nhập biệt danh',
          controllerText: controller.txtNickName),
      spaceVertical(height: 20),
      _inputForm(
          title: 'Họ và tên',
          hintText: 'Nhập họ và tên',
          controllerText: controller.txtFullName),
      spaceVertical(height: 20),
      _inputForm(
          title: 'Điện thoại',
          hintText: 'Nhập số điện thoại',
          controllerText: controller.txtPhone),
      spaceVertical(height: 20),
      _inputFormDescription(
          title: 'Mô tả',
          hintText: 'Nhập mô tả về bạn',
          minLines: 4,
          maxLines: 8,
          controllerText: controller.txtDescription),

      spaceVertical(height: AppDataGlobal.safeBottom + 100),
    ]);
  }

}
