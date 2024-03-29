Map<String, String> urlConnectAPI = {
  "dev": "https://vbmsport.name.vn/",
  "prod": "",
  "uat": "",
};

// Main API
String mainURL = '';

// Sub API

class SubAPI {
  static const String province = 'api/cities';

  static const String districts = 'api/districts/city';

  static const String register = 'api/users/register';

  static const String user = 'api/users';

  static const String loginEmail = 'api/users/email_login';

  static const String post = 'api/posts';

  static const String wallet = 'api/wallet';

  static const String verifyToken = 'api/users/verify_token';

  static const String booking = 'api/slots/booking';

  static const String transaction = 'api/transactions';

  static const String chat = 'api/chat/user';

  static const String chatDetail = 'api/chat';

  static const String vnpay = 'api/wallet/create-vnpay';

  static const String uploadImage = 'api/image/images';

  static const String playGround = 'api/posts/play_ground';

  static const String ratingUser = 'api/users/rating_to';

  static const String setting = 'api/Settings/';

  static const String blog = 'api/blogs/';
}
