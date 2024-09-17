import 'package:bloc/bloc.dart';
import 'package:educationapp/core/data/api/api_server.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  Future<void> changePassword({required Map<String, dynamic> data}) async {
    emit(ChangePasswordIsLoading());
    try {
      var response = await ApiService.post(
          endpoint:
              'https://graduation-project.odeh-design.com/api/update-password',
          data: data);
      if (response.data['message'] == 'success') {
        emit(ChangePasswordIsSucees());
      } else {
        emit(ChangePasswordIsFailuer(errorMessage: response.data['message']));
      }
    } catch (e) {
      if (e is DioException) {
        emit(ChangePasswordIsFailuer(errorMessage: 'opps,try later'));

        //   print('i am in in dio1 ');
        //   if (e.response!.statusCode == 401) {
        //     emit(ChangePasswordIsFailuer(errorMessage: 'opps,try later'));
        //   }
        // } else {
        //   print('i am in in dio12');

        //   emit(
        //     ChangePasswordIsFailuer(errorMessage: 'opps,try later'),
        //   );
      }
    }
  }
}
