import 'package:educationapp/core/data/api/dio_error.dart';
import 'package:educationapp/core/util/app_const.dart';
import 'package:educationapp/payment/data/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoPaymentImple implements HomeRepoPayment {
  @override
  Future<Either<Failure, String>> getPaymentKey(
      {required String amount, required int idCard}) async {
    try {
      String authenTicationToken = await _getAuthentTicationToken();
      int orderId = await _getorderId(
          authenTicationToken: authenTicationToken, amount: amount);
      String paymentKey = await _paymentKey(
          idCard: idCard,
          authenTicationToken: authenTicationToken,
          amount: amount,
          id: orderId);
      return right(paymentKey);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure('Opps There was an Error, Please try again'));
      }
    }
  }

  Future<String> _paymentKey(
      {required String authenTicationToken,
      required String amount,
      required int idCard,
      required int id}) async {
    Response response = await _apiService(
        baseUrl: 'https://accept.paymob.com/api/acceptance/payment_keys',
        data: {
          "auth_token": authenTicationToken,
          "amount_cents": amount,
          "expiration": 300,
          "order_id": id,
          "billing_data": {
            "first_name": "Clifford",
            "last_name": "Nicolas",
            "email": "claudette09@exa.com",
            "phone_number": "+86(8)9135210487",

            //Can Set "NA"
            "apartment": "NA",
            "floor": "NA",
            "street": "NA",
            "building": "NA",
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "state": "NA"
          },
          "currency": "EGP",
          "integration_id": idCard
        });
    return response.data['token'];
  }

  Future<int> _getorderId(
      {required String authenTicationToken, required String amount}) async {
    Response response = await _apiService(
        baseUrl: 'https://accept.paymob.com/api/ecommerce/orders',
        data: {
          "auth_token": authenTicationToken,
          "delivery_needed": "false",
          "amount_cents": amount,
          "currency": "EGP",
          'items': []
          // "merchant_order_id": 5,
        });
    return response.data['id'];
  }

  Future<String> _getAuthentTicationToken() async {
    var response = await _apiService(
        baseUrl: 'https://accept.paymob.com/api/auth/tokens',
        data: {'api_key': AppConst.apiKey});
    return response.data['token'];
  }

  Future<Response> _apiService(
      {required String baseUrl, required Map<String, dynamic>? data}) async {
    return await Dio().post(baseUrl, data: data ?? {});
  }
}
