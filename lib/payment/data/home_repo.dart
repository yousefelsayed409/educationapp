import 'package:educationapp/core/data/api/dio_error.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepoPayment {
  Future<Either<Failure, String>> getPaymentKey(
      {required String amount, required int idCard});
}
