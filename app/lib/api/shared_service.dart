import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:app/models/auth/login_response.dart';
import 'package:app/views/auth/screens/login.dart';
import 'package:flutter/cupertino.dart';

class SharedService {
  static const String KEY_NAME = "login_key";

  static Future<bool> isLoggedIn() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist(KEY_NAME);

    return isKeyExist;
  }

  static Future<void> setLoginDetails(
    LoginResponseModel model,
  ) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: KEY_NAME,
      syncData: jsonEncode(
        model.toJson(),
      ),
    );

    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<LoginResponseModel?> loginDetails() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist(KEY_NAME);

    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData(KEY_NAME);

      return loginResponseJson(cacheData.syncData);
    }
    return null;
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache(KEY_NAME);
    Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (route) => false);
  }
}
