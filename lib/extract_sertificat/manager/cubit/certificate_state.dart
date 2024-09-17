part of 'certificate_cubit.dart';

@immutable
sealed class CertificateState {}

final class CertificateInitial extends CertificateState {}

final class Loading extends CertificateState {}

final class Failure extends CertificateState {
  final String errorMessage;

  Failure({required this.errorMessage});
}

final class Success extends CertificateState {}
