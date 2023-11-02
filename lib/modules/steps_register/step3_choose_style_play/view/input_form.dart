part of 'step3_choose_style_play_screen.dart';

extension InputCustom on Step3RegisterScreen{
  Widget _inputForm(){
    return Container(
      color: AppColor.colorGrey200,
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        controller: controller.txtStylePlay,
        keyboardType: TextInputType.text,
        minLines: 4,
        maxLines: 10,
        decoration: const InputDecoration(
          hintText: "Nhập lối chơi của bạn đi nào ^-^",
          border: InputBorder.none,
        ),
      ),
    );
  }
}