import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:educationapp/extract_sertificat/data/repo/home_repo_imple.dart';
import 'package:meta/meta.dart';

part 'certificate_state.dart';

class CertificateCubit extends Cubit<CertificateState> {
  CertificateCubit(this.homeRepoCertificateImple) : super(CertificateInitial());
  final HomeRepoCertificateImple homeRepoCertificateImple;
  String? lang;
  String? departMent;
  File? imagePhoto;
  File? imagePhotoId;
  Future<void> certificate({required Map<String, dynamic> data}) async {
    emit(Loading());
    var result = await homeRepoCertificateImple.certificate(data: data);
    result.fold((l) {
      emit(Failure(errorMessage: l.message));
    }, (r) {
      emit(Success());
    });
  }
}
