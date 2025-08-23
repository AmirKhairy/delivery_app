import 'dart:developer';

import 'package:delivery_app/Core/Services/Shared%20Prefs/shared_pref_keys.dart';
import 'package:delivery_app/Core/Services/Shared%20Prefs/shared_preferences_manager.dart';
import 'package:dio/dio.dart';

class RequestInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    log('REQUEST[${options.method}] => PATH: ${options.path}');
    final token = PrefsManager.getData(key: SharedPrefKeys.token);
    final languge = PrefsManager.getData(key: SharedPrefKeys.lang);
    // options.headers["Authorization"] =
    //     'Bearer ${PrefsManager.getData(key: "token")}';
    options.headers["Authorization"] = 'Bearer $token';
    options.headers["Accept-Language"] = '$languge';
    // options.headers["Authorization"] = 'Bearer ${accessToken}';
    log('testMada [${options.headers}]');

    // options.headers["Accept-language"] = lang;
    super.onRequest(options, handler);
  }
}
