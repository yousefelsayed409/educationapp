import 'package:educationapp/core/data/api/api_const.dart';
import 'package:educationapp/core/data/local_data/get_data_of_user.dart';
import 'package:educationapp/core/data/local_data/shared_prefrance.dart';
import 'package:educationapp/core/util/app_const.dart';
import 'package:dio/dio.dart';

class ApiService {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        receiveDataWhenStatusError: true,
        receiveTimeout: const Duration(seconds: 15),
        baseUrl: ApiConsr.baseURL));
  }

  static Future<Response> post({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    dio.interceptors.add(
        LogInterceptor(error: true, requestBody: true, responseBody: true));
    var response = await dio.post(
      endpoint,
      data: FormData.fromMap(data!),
      queryParameters: queryParameters,
      options: Options(
        headers: {
          'Accept': "application/json",
          "Authorization":
              'Bearer ${MySharedPrefrence.get(AppConst.token) ?? ""}'
        },
      ),
    );
    return response;
  }

  static Future<Response> get({
    required String endpoint,
  }) async {
    return await dio.get(
      endpoint,
      options: Options(
        headers: {
          'Accept': "application/json",
          "Authorization": 'Bearer ${GetUserFromLockel.userModel?.token ?? ""}'
        },
      ),
    );
    //   return response;
  }
}
