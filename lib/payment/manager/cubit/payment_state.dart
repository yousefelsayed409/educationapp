part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentIsLoading extends PaymentState {}

final class PaymentIsSuccess extends PaymentState {

}

final class PaymentIsFailuer extends PaymentState {
  final String errorMessage;

   PaymentIsFailuer({required this.errorMessage});
}
