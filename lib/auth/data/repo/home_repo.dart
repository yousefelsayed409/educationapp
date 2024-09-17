import 'package:educationapp/auth/data/model/user_model.dart';
import 'package:educationapp/core/data/api/dio_error.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class HomeRepoAuth {
  Future<Either<Failure, UserModel>> auth(
      {required String endpoint, required Map<String, dynamic> data});
  Future<Either<Failure, Response>> forgetPassword({required String email});
  Future<Either<Failure, Response>> checkCode(
      {required Map<String, dynamic> data});
}
