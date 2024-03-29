import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:app/models/auth/login_response.dart';

class SharedService {
  static const String KEY_NAME = "login_key";

  static Future<bool> isLoggedIn() async {
    var isCacheKeyExist = await APICacheManager().isAPICacheKeyExist(KEY_NAME);

    return isCacheKeyExist;
  }

  static Future<void> setLoginDetails(LoginResponseModel model) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: KEY_NAME,
      syncData: jsonEncode(
        model.toJson(),
      ),
    );

    await APICacheManager().addCacheData(cacheDBModel);
  }

  // static Future<LoginResponseModel> loginDetails() async {
  //   var isCacheKeyExist = await APICacheManager().isAPICacheKeyExist(KEY_NAME);

  //   if (isCacheKeyExist) {
  //     var cacheData = await APICacheManager().getCacheData(KEY_NAME);

  //     return loginResponseJson(cacheData.syncData);
  //   } else {
  //     return null;
  //   }
  // }
}
