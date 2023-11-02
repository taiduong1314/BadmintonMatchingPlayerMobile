import 'package:get/get.dart';
import 'package:vbmsports/modules/forgot_password/binding/forgot_pass_binding.dart';
import 'package:vbmsports/modules/forgot_password/view/forgot_pass_screen.dart';
import 'package:vbmsports/modules/steps_register/step1_choose_districts/binding/step1_choose_districts_binding.dart';
import 'package:vbmsports/modules/steps_register/step1_choose_districts/view/step1_choose_districts_screen.dart';

import '../modules/account/binding/setting_binding.dart';
import '../modules/account/view/setting_screen.dart';
import '../modules/change_password/binding/change_password_binding.dart';
import '../modules/change_password/view/change_password_screen.dart';
import '../modules/home/binding/home_binding.dart';
import '../modules/home/view/home_screen.dart';
import '../modules/list_chat/binding/list_chat_binding.dart';
import '../modules/list_chat/view/list_chat_screen.dart';
import '../modules/login/binding/login_binding.dart';
import '../modules/login/view/login_screen.dart';
import '../modules/main/binding/main_binding.dart';
import '../modules/main/view/main_screen.dart';
import '../modules/splash/binding/splash_binding.dart';
import '../modules/splash/view/splash_screen.dart';
import '../modules/steps_register/step2_choose_skill/binding/step2_choose_skill_binding.dart';
import '../modules/steps_register/step2_choose_skill/view/step2_choose_skill_screen.dart';
import '../modules/steps_register/step3_choose_style_play/binding/step3_choose_style_play_binding.dart';
import '../modules/steps_register/step3_choose_style_play/view/step3_choose_style_play_screen.dart';
import '../modules/steps_register/step4_recomment_players/binding/step4_recomment_players_binding.dart';
import '../modules/steps_register/step4_recomment_players/view/step4_recomment_players_screen.dart';
import '../modules/verifyOTP/binding/verify_otp_binding.dart';
import '../modules/verifyOTP/view/verify_otp_screen.dart';

part 'app_routes.dart';

final routePages = [
  GetPage(
    name: Routes.SPLASH,
    page: () => SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: Routes.MAIN,
    page: () => MainScreen(),
    binding: MainBinding(),
  ),
  GetPage(
    name: Routes.HOME,
    page: () => HomeScreen(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: Routes.LOGIN,
    page: () => LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: Routes.FORGOTPASSWORD,
    page: () => ForgotPasswordScreen(),
    binding: ForgotPasswordBinding(),
  ),
  GetPage(
    name: Routes.VERIFYOTP,
    page: () => VerifyOTPScreen(),
    binding: VerifyOTPBinding(),
  ),
  GetPage(
    name: Routes.ACCOUNT,
    page: () => AccountScreen(),
    binding: AccountBinding(),
  ),
  GetPage(
    name: Routes.LISTCHAT,
    page: () => ListChatScreen(),
    binding: ListChatBinding(),
  ),
  GetPage(
    name: Routes.CHANGEPASSWORD,
    page: () => ChangePasswordScreen(),
    binding: ChangePasswordBinding(),
  ),
  GetPage(
    name: Routes.STEP1REGISTER,
    page: () => const Step1RegisterScreen(),
    binding: Step1RegisterBinding(),
  ),
  GetPage(
    name: Routes.STEP2REGISTER,
    page: () => const Step2RegisterScreen(),
    binding: Step2RegisterBinding(),
  ),
  GetPage(
    name: Routes.STEP3REGISTER,
    page: () => const Step3RegisterScreen(),
    binding: Step3RegisterBinding(),
  ),
  GetPage(
    name: Routes.STEP4REGISTER,
    page: () => const Step4RegisterScreen(),
    binding: Step4RegisterBinding(),
  ),
];
