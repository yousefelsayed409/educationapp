part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationIsLoading extends AuthenticationState {}

final class AuthenticationIsFailuer extends AuthenticationState {
  final String errorMessage;

  AuthenticationIsFailuer({required this.errorMessage});
}

final class AuthenticationIsSuccess extends AuthenticationState {
  final UserModel? userModel;

  AuthenticationIsSuccess({this.userModel});
}
