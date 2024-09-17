import 'package:educationapp/core/data/api/dio_error.dart';
import 'package:educationapp/grades_question/data/model/question_model/question_model.dart';
import 'package:dartz/dartz.dart';

abstract class HopmeRepoQuestion {
  Future<Either<Failure, QuestionModel>> question(
      {required Map<String, dynamic> data});
}
