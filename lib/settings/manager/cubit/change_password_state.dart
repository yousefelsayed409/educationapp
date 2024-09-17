part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordIsLoading extends ChangePasswordState {}

final class ChangePasswordIsFailuer extends ChangePasswordState {
  final String errorMessage;

   ChangePasswordIsFailuer({required this.errorMessage});
}

final class ChangePasswordIsSucees extends ChangePasswordState {}
