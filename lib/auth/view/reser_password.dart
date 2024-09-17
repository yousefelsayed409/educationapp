import 'package:educationapp/auth/data/repo/home_repo_impl.dart';
import 'package:educationapp/auth/manager/cubit/authentication_cubit.dart';
import 'package:educationapp/auth/view/widget/form_rest_password.dart';
import 'package:educationapp/core/util/service_locator.dart';
import 'package:educationapp/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.restPasswordModel});
  final RestPasswordModel restPasswordModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(
        getIt.get<HomeRepoAuthImple>(),
      )..inilize(),
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: FormResetPassword(
                restPasswordModel: restPasswordModel,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RestPasswordModel {
  final String email;
  final String code;

  RestPasswordModel({required this.email, required this.code});
}
