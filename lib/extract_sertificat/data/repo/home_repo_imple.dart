import 'package:educationapp/core/data/api/api_const.dart';
import 'package:educationapp/core/data/api/api_server.dart';
import 'package:educationapp/core/data/api/dio_error.dart';
import 'package:educationapp/extract_sertificat/data/model/certivicate_model/certivicate_model.dart';
import 'package:educationapp/extract_sertificat/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoCertificateImple implements HomeRepoCertificate {
  @override
  Future<Either<Failure, CertivicateModel>> certificate(
      {required Map<String, dynamic> data}) async {
    try {
      var response =
          await ApiService.post(endpoint: ApiConsr.certificate, data: data);
      if (response.data['key'] == 'fail') {
        return left(ServerFailure(response.data['msg']));
      } else {
        return right(CertivicateModel.fromJson(response.data));
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
}
