import 'package:educationapp/core/util/app_image.dart';
import 'package:educationapp/grades_question/data/repo/home_repo_imple.dart';
import 'package:educationapp/grades_question/manager/cubit/question_cubit.dart';
import 'package:educationapp/grades_question/view/widget/form_to_enter_grade_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GradesQuestion extends StatelessWidget {
  const GradesQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionCubit(HomeRepoquestionImple()),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: InkWell(
              onTap: () => Navigator.pop(context),
              child: Image.asset(AppImageAssets.iamgeBackBottom)),
        ),
        body: const FortmToEnterGradeQuestion(),
      ),
    );
  }
}
