import 'dart:convert';

import 'package:app/api/shared_service.dart';
import 'package:app/config/config.dart';
import 'package:app/models/auth/login_request_model.dart';
import 'package:app/models/auth/login_response.dart';
import 'package:app/models/auth/signup_request_model.dart';
import 'package:http/http.dart' as http;

import '../../../models/auth/signup_response_model.dart';

class AuthServices {
  static var client = http.Client();

//Login
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

//Signup
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
