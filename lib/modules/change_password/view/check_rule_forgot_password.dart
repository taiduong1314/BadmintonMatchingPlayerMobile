// part of 'account_change_password_screen.dart';
//
// /// If type = 2 (Forgot password), this extension will use
// extension CheckRuleForgotPassword on AccountChangePasswordScreen {
//   Widget _checkRuleForgotPassword() {
//     return Obx(
//       () => Column(
//         children: [
//           _item(
//               status: controller.isContainUpperCase.value,
//               isSubmitted: controller.isSubmitted.value,
//               text: '1 chữ viết hoa ',
//               subText: '(ví dụ: M)'),
//           spaceVertical(height: 10),
//           _item(
//               status: controller.isMinLength.value,
//               isSubmitted: controller.isSubmitted.value,
//               text: 'ít nhất 8 ký tự ',
//               subText: '(ví dụ: Matkhaucuaban)'),
//           spaceVertical(height: 10),
//           _item(
//               status: controller.isContainSpecialCharacter.value,
//               isSubmitted: controller.isSubmitted.value,
//               text: '1 ký tự đặc biệt ',
//               subText: '(ví dụ: Matkhaucuaban!)'),
//         ],
//       ),
//     );
//   }
//
//   Widget _item(
//       {required bool status,
//       required String text,
//       required subText,
//       required isSubmitted}) {
//     return Row(
//       children: [
//         SvgPicture.asset(status
//             ? AssetSVGName.rulePasswordSuccessTick
//             : !status && isSubmitted
//                 ? AssetSVGName.rulePasswordErrorTick
//                 : AssetSVGName.rulePasswordTick),
//         spaceHorizontal(width: 8),
//         CustomText.textPlusJakarta(
//             text: text,
//             style: TextAppStyle.smallBodyContent().copyWith(
//                 color: !status && isSubmitted
//                     ? AppColor.colorErrorText
//                     : AppColor.greyScale900)),
//         CustomText.textPlusJakarta(
//             text: subText,
//             style: TextAppStyle.smallBodyContent().copyWith(
//                 color: !status && isSubmitted
//                     ? AppColor.colorErrorText
//                     : AppColor.colorTextGrey)),
//       ],
//     );
//   }
// }
