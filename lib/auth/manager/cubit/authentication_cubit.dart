import 'package:bloc/bloc.dart';
import 'package:educationapp/auth/data/model/user_model.dart';
import 'package:educationapp/auth/data/repo/home_repo_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this.homeRepoAuthImple) : super(AuthenticationInitial());
  final HomeRepoAuthImple homeRepoAuthImple;
  GlobalKey<FormState> formkey = GlobalKey();
  late TextEditingController userName;
  late TextEditingController email;
  late TextEditingController nationalId;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  void inilize() {
    print('i ama in ');
    userName = TextEditingController();
    email = TextEditingController();
    confirmPassword = TextEditingController();
    nationalId = TextEditingController();
    password = TextEditingController();
  }

  void dispos() {
    confirmPassword.clear();
    userName.clear();
    email.clear();
    nationalId.clear();
    password.clear();
  }

  Future<void> auth(
      {required String endpoint, required Map<String, dynamic> data}) async {
    emit(AuthenticationIsLoading());
    var result = await homeRepoAuthImple.auth(endpoint: endpoint, data: data);
    result.fold(
      (l) => emit(AuthenticationIsFailuer(errorMessage: l.message)),
      (r) => emit(
        AuthenticationIsSuccess(userModel: r),
      ),
    );
  }

  Future<void> forgetPassword({required String email}) async {
    emit(AuthenticationIsLoading());
    var result = await homeRepoAuthImple.forgetPassword(email: email);
    result.fold((l) => emit(AuthenticationIsFailuer(errorMessage: l.message)),
        (r) => emit(AuthenticationIsSuccess()));
  }

  Future<void> checkCode({required Map<String, dynamic> data}) async {
    emit(AuthenticationIsLoading());
    var result = await homeRepoAuthImple.checkCode(data: data);
    result.fold(
      (l) => emit(AuthenticationIsFailuer(errorMessage: l.message)),
      (r) => emit(
        AuthenticationIsSuccess(),
      ),
    );
  }
}
