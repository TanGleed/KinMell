import 'dart:convert';

import 'package:app/config/config.dart';
import 'package:app/models/auth/login_request_model.dart';
import 'package:app/models/auth/login_response.dart';
import 'package:app/models/auth/signup_response_model.dart';
import 'package:app/utils/shared_service.dart';
import 'package:http/http.dart' as http;

import '../models/categories/category.dart';
import '../models/auth/signup_request_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiService = Provider((ref) => APIService());

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

  Future<List<Category>?> getCategories(page, pageSize) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    Map<String, String> queryString = {
      'page': page.toString(),
      'pageSize': pageSize.toString()
    };

    var url = Uri.http(Config.apiURL, Config.categoryAPI, queryString);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return categoriesFromJson(data["data"]);
    } else {
      return null;
    }
  }
}
