


Map<String, String> urlConnectAPI = {
  "dev": "https://badminton-matching-24832d1c4b03.herokuapp.com/",
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
}
