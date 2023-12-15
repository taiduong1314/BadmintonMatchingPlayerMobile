import 'package:get/get.dart';
import 'package:vbmsports/modules/booking_detail/binding/booking_detail_binding.dart';
import 'package:vbmsports/modules/booking_detail/view/booking_detail_screen.dart';
import 'package:vbmsports/modules/change_password/binding/account_change_password_binding.dart';
import 'package:vbmsports/modules/change_password/view/account_change_password_screen.dart';
import 'package:vbmsports/modules/chat_detail/binding/chat_detail_binding.dart';
import 'package:vbmsports/modules/chat_detail/view/chat_detail_view.dart';
import 'package:vbmsports/modules/confirm_password/binding/confirm_password_binding.dart';
import 'package:vbmsports/modules/confirm_password/view/confirm_password_screen.dart';
import 'package:vbmsports/modules/new_detail/binding/new_detail_binding.dart';
import 'package:vbmsports/modules/new_detail/view/new_detail_screen.dart';
import 'package:vbmsports/modules/news/binding/news_binding.dart';
import 'package:vbmsports/modules/news/view/news_screen.dart';
import 'package:vbmsports/modules/post/all_post/binding/all_post_binding.dart';
import 'package:vbmsports/modules/post/all_post/view/all_post_screen.dart';
import 'package:vbmsports/modules/post/manage_joining_post/binding/manage_joining_post_binding.dart';
import 'package:vbmsports/modules/post/manage_joining_post/view/manage_joining_post_screen.dart';
import 'package:vbmsports/modules/post/manage_posted_post/binding/manage_posted_post_binding.dart';
import 'package:vbmsports/modules/post/manage_posted_post/view/manage_posted_post_screen.dart';
import 'package:vbmsports/modules/profile/binding/profile_binding.dart';
import 'package:vbmsports/modules/profile/view/profile_screen.dart';
import 'package:vbmsports/modules/rating_user/binding/rating_user_binding.dart';
import 'package:vbmsports/modules/rating_user/view/rating_user_screen.dart';
import '../modules/booking/binding/booking_binding.dart';
import '../modules/booking/view/booking_screen.dart';
import '../modules/create_post/binding/create_post_binding.dart';
import '../modules/create_post/view/create_post_screen.dart';
import '../modules/deposit_withdraw/binding/deposit_withdraw_binding.dart';
import '../modules/deposit_withdraw/view/deposit_withdraw_screen.dart';
import '../modules/forgot_password/binding/forgot_pass_binding.dart';
import '../modules/forgot_password/view/forgot_pass_screen.dart';
import '../modules/notification/binding/notification_binding.dart';
import '../modules/notification/view/notification_screen.dart';
import '../modules/steps_register/step1_choose_districts/binding/step1_choose_districts_binding.dart';
import '../modules/steps_register/step1_choose_districts/view/step1_choose_districts_screen.dart';
import '../modules/user_info/binding/user_info_binding.dart';
import '../modules/user_info/view/user_info_screen.dart';
import '../modules/wallet/binding/wallet_binding.dart';
import '../modules/wallet/view/wallet_screen.dart';
import '../modules/account/binding/setting_binding.dart';
import '../modules/account/view/setting_screen.dart';
import '../modules/chat/binding/chat_binding.dart';
import '../modules/chat/view/chat_screen.dart';
import '../modules/home/binding/home_binding.dart';
import '../modules/home/view/home_screen.dart';
import '../modules/login/binding/login_binding.dart';
import '../modules/login/view/login_screen.dart';
import '../modules/main/binding/main_binding.dart';
import '../modules/main/view/main_screen.dart';
import '../modules/post/post_detail/binding/post_detail_binding.dart';
import '../modules/post/post_detail/view/post_detail_screen.dart';
import '../modules/splash/binding/splash_binding.dart';
import '../modules/splash/view/splash_screen.dart';
import '../modules/steps_register/step2_choose_skill/binding/step2_choose_skill_binding.dart';
import '../modules/steps_register/step2_choose_skill/view/step2_choose_skill_screen.dart';
import '../modules/steps_register/step3_choose_style_play/binding/step3_choose_style_play_binding.dart';
import '../modules/steps_register/step3_choose_style_play/view/step3_choose_style_play_screen.dart';
import '../modules/steps_register/step4_recomment_players/binding/step4_recomment_players_binding.dart';
import '../modules/steps_register/step4_recomment_players/view/step4_recomment_players_screen.dart';

part 'app_routes.dart';

final routePages = [
  GetPage(
    name: Routes.SPLASH,
    page: () => SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: Routes.MAIN,
    page: () => const MainScreen(),
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
    page: () => const ForgotPasswordScreen(),
    binding: ForgotPasswordBinding(),
  ),
  GetPage(
    name: Routes.ACCOUNT,
    page: () => AccountScreen(),
    binding: AccountBinding(),
  ),
  GetPage(
    name: Routes.NOTIFICATION,
    page: () => NotificationScreen(),
    binding: NotificationBinding(),
  ),
  GetPage(
    name: Routes.CREATEPOST,
    page: () => CreatePostScreen(),
    binding: CreatePostBinding(),
  ),
  GetPage(
    name: Routes.POSTDETAIL,
    page: () => const PostDetailScreen(),
    binding: PostDetailBinding(),
  ),
  GetPage(
    name: Routes.CHAT,
    page: () => ChatScreen(),
    binding: ChatBinding(),
  ),
  GetPage(
    name: Routes.CHATDETAIL,
    page: () => ChatDetailScreen(),
    binding: ChatDetailBinding(),
  ),
  GetPage(
    name: Routes.CHANGEPASSWORD,
    page: () => AccountChangePasswordScreen(),
    binding: AccountChangePasswordBinding(),
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
  GetPage(
    name: Routes.BOOKING,
    page: () => BookingScreen(),
    binding: BookingBinding(),
  ),
  GetPage(
    name: Routes.BOOKINGDETAIL,
    page: () => BookingDetailScreen(),
    binding: BookingDetailBinding(),
  ),
  GetPage(
    name: Routes.USERINFO,
    page: () => UserInfoScreen(),
    binding: UserInfoBinding(),
  ),
  GetPage(
    name: Routes.WALLET,
    page: () => WalletScreen(),
    binding: WalletBinding(),
  ),
  GetPage(
    name: Routes.DEPOSITVSWITHDRAW,
    page: () => DepositWithdrawScreen(),
    binding: DepositWithdrawBinding(),
  ),
  GetPage(
    name: Routes.POSTS,
    page: () => AllPostScreen(),
    binding: AllPostBinding(),
  ),
  GetPage(
    name: Routes.POSTEDPOST,
    page: () => ManagePostedPostScreen(),
    binding: ManagePostedPostBinding(),
  ),
  GetPage(
    name: Routes.JOININGPOST,
    page: () => ManageJoiningPostScreen(),
    binding: ManageJoiningPostBinding(),
  ),
  GetPage(
    name: Routes.PROFILE,
    page: () => ProfileScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: Routes.NEWS,
    page: () => NewsScreen(),
    binding: NewsBinding(),
  ),
  GetPage(
    name: Routes.NEWDETAIL,
    page: () => NewDetailScreen(),
    binding: NewDetailBinding(),
  ),
  GetPage(
    name: Routes.RATINGUSER,
    page: () => RatingUserScreen(),
    binding: RatingUserBinding(),
  ),
  GetPage(
    name: Routes.CONFIRMPASSWORD,
    page: () => ConfirmPasswordScreen(),
    binding: ConfirmPasswordBinding(),
  ),
];
