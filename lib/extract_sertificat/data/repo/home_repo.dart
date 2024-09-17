import 'package:educationapp/core/data/api/dio_error.dart';
import 'package:educationapp/extract_sertificat/data/model/certivicate_model/certivicate_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepoCertificate {
  Future<Either<Failure, CertivicateModel>> certificate(
      {required Map<String, dynamic> data});
}
