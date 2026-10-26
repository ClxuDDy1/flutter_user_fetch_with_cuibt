import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint(
      "REQUEST: ${options.method} - ${options.path} - ${options.queryParameters}",
    );
    debugPrint('REQUEST OPTIONS: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    debugPrint('RESPONSE: ${response.data}');
    debugPrint('STATUS CODE: ${response.statusCode}');
    debugPrint('PATH: ${response.requestOptions.path}');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('STATUS CODE: ${err.response?.statusCode}');
    debugPrint('ERROR TYPE: ${err.type}');
    debugPrint('ERROR: ${err.message}');
    debugPrint('UNDERLYING: ${err.error}');
    super.onError(err, handler);
  }
}
