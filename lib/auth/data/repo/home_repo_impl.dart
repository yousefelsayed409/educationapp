import 'package:educationapp/auth/data/model/user_model.dart';
import 'package:educationapp/auth/data/repo/home_repo.dart';
import 'package:educationapp/core/data/api/api_const.dart';
import 'package:educationapp/core/data/api/api_server.dart';
import 'package:educationapp/core/data/api/dio_error.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoAuthImple implements HomeRepoAuth {
  const HomeRepoAuthImple();
  @override
  Future<Either<Failure, UserModel>> auth(
      {required String endpoint, required Map<String, dynamic> data}) async {
    try {
      var response = await ApiService.post(endpoint: endpoint, data: data);
      if (response.data['key'] == 'success') {
        return right(UserModel.fromJson(json: response.data['data']['user']));
      } else {
        return left(ServerFailure(response.data['msg']));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure('opps,try later'));
      }
    }
  }

  @override
  Future<Either<Failure, Response>> forgetPassword(
      {required String email}) async {
    try {
      var response = await ApiService.post(
          endpoint: ApiConsr.forgetPassword, data: {'email': email});
      if (response.data['key'] == 'success') {
        return right(response);
      } else {
        return left(ServerFailure(response.data['msg']));
      }
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure('opps,try later'));
      }
    }
  }

  @override
  Future<Either<Failure, Response>> checkCode(
      {required Map<String, dynamic> data}) async {
    try {
      var response =
          await ApiService.post(endpoint: ApiConsr.checkCode, data: data);
      if (response.data['key'] == 'success') {
        return right(response);
      } else {
        return left(ServerFailure(response.data['msg']));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure('opps,try later'));
      }
    }
  }
}
