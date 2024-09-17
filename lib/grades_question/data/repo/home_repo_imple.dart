import 'package:educationapp/core/data/api/api_const.dart';
import 'package:educationapp/core/data/api/api_server.dart';
import 'package:educationapp/core/data/api/dio_error.dart';
import 'package:educationapp/grades_question/data/model/question_model/question_model.dart';
import 'package:educationapp/grades_question/data/repo/hopme_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoquestionImple implements HopmeRepoQuestion {
  @override
  Future<Either<Failure, QuestionModel>> question(
      {required Map<String, dynamic> data}) async {
    try {
      var response =
          await ApiService.post(endpoint: ApiConsr.question, data: data);
      if (response.data['key'] == 'fail') {
        return left(ServerFailure(response.data['msg']));
      } else {
        return right(QuestionModel.fromJson(response.data));
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
