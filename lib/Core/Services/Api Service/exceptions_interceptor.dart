import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'dio_exceptions.dart';

class ExceptionInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final AppDioError exceptions = AppDioError.fromDioError(err);
    debugPrint(exceptions.message);
    debugPrint(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    super.onError(err, handler);
  }
}
