import 'package:dio/dio.dart';
import 'package:user_fetch_with_cubit/core/constants/api_constants.dart';
import 'package:user_fetch_with_cubit/core/network/api_result.dart';
import 'package:user_fetch_with_cubit/features/home/data/models/users_model.dart';

class HomeRepo {
  final Dio _dio;
  HomeRepo(this._dio);

  Future<ApiResult<List<UserModel>>> fetchUsers() async {
    try {
      final response = await _dio.get(ApiConstants.users);
      final List rawData = response.data;
      final users = rawData.map((e) => UserModel.fromJson(e)).toList();
      return ApiSuccess(users);
    } on DioException catch (e) {
      return ApiFailure(e.message ?? "Something went wrong");
    }
  }
}
