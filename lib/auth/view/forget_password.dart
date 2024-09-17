import 'package:educationapp/auth/data/repo/home_repo_impl.dart';
import 'package:educationapp/auth/view/widget/form_to_forget_password.dart';
import 'package:educationapp/core/util/service_locator.dart';
import 'package:educationapp/core/widget/custom_app_bar.dart';

import '../manager/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(
        getIt.get<HomeRepoAuthImple>(),
      )..inilize(),
      child: const SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(),
          body: FormToForgetPassword(),
        ),
      ),
    );
  }
}
