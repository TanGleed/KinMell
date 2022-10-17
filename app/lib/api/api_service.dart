import 'dart:convert';

import 'package:app/config/config.dart';
import 'package:app/models/login_request_model.dart';
import 'package:app/models/login_response.dart';
import 'package:app/models/signup_response_model.dart';
import 'package:app/utils/shared_service.dart';
import 'package:http/http.dart' as http;

import '../models/signup_request_model.dart';

class APIService {
  static var client = http.Client();

  static Future<bool?> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        model.toJson(),
      ),
    );

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      return true;
    } else {
      false;
    }
    return null;
  }

  static Future<SignupResponseModel> signup(
    SignupRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.signupAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        model.toJson(),
      ),
    );
    return signupResponseJson(response.body);
  }
}


// import 'dart:convert';

// import 'package:app/config/config.dart';
// import 'package:http/http.dart' as http;
// import 'package:riverpod/riverpod.dart';

// final apiService = Provider((ref) => APIService());

// class APIService {
//   static var client = http.Client();

//   static Future<bool> registerUser(
//     String name,
//     String email,
//     String password,
//   ) async {
//     Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

//     var url = Uri.http(Config.apiURL, Config.signupAPI);
//     var response = await client.post(
//       url,
//       headers: requestHeaders,
//       body: jsonEncode(
//         {
//           "name": name,
//           "email": email,
//           "password": password,
//         },
//       ),
//     );

//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   static Future<bool> loginUser(
//     String email,
//     String password,
//   ) async {
//     Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
//     var url = Uri.http(Config.apiURL, Config.loginAPI);

//     var response = await client.post(
//       url,
//       headers: requestHeaders,
//       body: jsonEncode({
//         "email": email,
//         "password": password,
//       }),
//     );

//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
