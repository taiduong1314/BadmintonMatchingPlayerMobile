part of 'forgot_pass_screen.dart';

extension OTPVerifyCustom on ForgotPasswordScreen {
  Widget _widgetOtpVerify() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _heading('Xác thực tài khoản'),
        spaceVertical(height: 8),
        _subHeading('Vui lòng nhập OTP xác thực'),
        spaceVertical(height: 38),
        _inputOTPNumber(),
        spaceVertical(height: 18),
        _timer(),
        spaceVertical(height: 18),
        _btnConfirm(),
        spaceVertical(height: AppDataGlobal.safeBottom),
      ],
    );
  }

  Widget _btnConfirm() {
    return CustomButton.commonButton(
        title: 'Xác nhận', onTap: controller.onTapOtpVerify);
  }

  Widget _timer() {
    return SizedBox(
      height: 30,
      child: CountDownTimer(
        timeToReSendOTP: 300,
        onTap: controller.onTapResendOTP,
      ),
    );
  }

  Widget _inputOTPNumber() {
    return Pinput(
      autofocus: true,
      closeKeyboardWhenCompleted: true,
      showCursor: false,
      length: 6,
      focusedPinTheme: PinTheme(
        textStyle: TextAppStyle.h3(),
        width: Get.width / 7,
        height: Get.width / 7,
        decoration: BoxDecoration(
          color: AppColor.colorLight,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColor.colorTextGrey100, width: 0.5),
        ),
      ),
      submittedPinTheme: PinTheme(
        textStyle: TextAppStyle.h3(),
        width: Get.width / 7,
        height: Get.width / 7,
        decoration: BoxDecoration(
          color: AppColor.colorLight,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColor.colorLogo, width: 0.5),
        ),
      ),
      followingPinTheme: PinTheme(
        textStyle: TextAppStyle.h3(),
        width: Get.width / 7,
        height: Get.width / 7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.colorLight,
          border: Border.all(color: AppColor.colorTextGrey100, width: 0.5),
        ),
      ),
      onCompleted: (text) {
        controller.txtOTP = text;
        controller.onTapOtpVerify();
      },
      onSubmitted: (text) {
        controller.txtOTP = text;
      },
      onChanged: (text) {
        controller.txtOTP = text;
      },
    );
  }
}
