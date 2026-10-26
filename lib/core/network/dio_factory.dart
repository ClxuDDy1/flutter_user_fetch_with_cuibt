import 'package:dio/dio.dart';
import 'package:user_fetch_with_cubit/core/constants/api_constants.dart';
import 'package:user_fetch_with_cubit/core/network/dio_interceptor.dart';

class DioFactory {
  DioFactory._();

  static Dio create() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: Duration(seconds: 30),
        sendTimeout: Duration(seconds: 30),
        responseType: .json,
      ),
    );
    dio.interceptors.add(DioInterceptor());
    return dio;
  }
}
