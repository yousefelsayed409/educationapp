import 'package:bloc/bloc.dart';
import 'package:educationapp/payment/data/home_repo_imple.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  String paymentKey = '';
  Future<void> paymentbyCard(
      {required String amount, required int idCard}) async {
    emit(PaymentIsLoading());
    var result = await HomeRepoPaymentImple()
        .getPaymentKey(idCard: idCard, amount: amount);
    result.fold((l) => emit(PaymentIsFailuer(errorMessage: l.message)), (r) {
      paymentKey = r;
      emit(PaymentIsSuccess());
    });
  }
}
