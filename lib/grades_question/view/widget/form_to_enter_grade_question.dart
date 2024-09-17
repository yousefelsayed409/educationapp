import 'package:educationapp/core/extention/extention.dart';
import 'package:educationapp/core/style/app_color.dart';
import 'package:educationapp/core/widget/custom_bottom.dart';
import 'package:educationapp/core/widget/flutter_toaster.dart';
import 'package:educationapp/core/widget/show_loading.dart';
import 'package:educationapp/core/widget/text_form_field/email_form_field.dart';
import 'package:educationapp/core/widget/text_form_field/nation_id_form.dart';
import 'package:educationapp/core/widget/text_form_field/phone_number_filed.dart';
import 'package:educationapp/core/widget/text_form_field/user_name_formd_fiekd.dart';
import 'package:educationapp/grades_question/manager/cubit/question_cubit.dart';
import 'package:educationapp/grades_question/view/widget/cuustom_dop_down.dart';
import 'package:educationapp/grades_question/view/widget/enter_lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FortmToEnterGradeQuestion extends StatefulWidget {
  const FortmToEnterGradeQuestion({super.key});

  @override
  State<FortmToEnterGradeQuestion> createState() =>
      _FortmToEnterGradeQuestionState();
}

class _FortmToEnterGradeQuestionState extends State<FortmToEnterGradeQuestion> {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController nationalId;
  late TextEditingController phoneNumber;
  @override
  void initState() {
    name = TextEditingController();
    email = TextEditingController();
    nationalId = TextEditingController();
    phoneNumber = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    nationalId.dispose();
    phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<QuestionCubit>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            50.hs,
            UserNameField(controller: name, isShowText: 'Name'),
            EmailFormField(controller: email, isShowText: 'E_mail'),
            NationalIdForm(controller: nationalId, isShowText: 'National id'),
            PhoneNumberFiled(controllre: phoneNumber),
            const EnterLang(),
            const CustomDropDown(),
            50.hs,
            BlocConsumer<QuestionCubit, QuestionState>(
                listener: (context, state) {
              if (state is Failure) {
                flutterToast(message: state.errorMessage);
              } else if (state is Success) {
                flutterToast(message: 'Successfully documented');
              }
            }, builder: (context, state) {
              if (state is Loading) {
                return const ShowLoadingWidget();
              }
              return CustomBottom(
                  title: 'Send',
                  height: 55,
                  width: double.infinity,
                  ontap: () async {
                    await _onTap(cubit);
                  },
                  color: AppColor.kPeimeryColor);
            }),
            20.hs,
          ],
        ),
      ),
    );
  }

  Future _onTap(QuestionCubit cubit) async {
    if (name.text.isEmpty ||
        email.text.isEmpty ||
        nationalId.text.isEmpty ||
        phoneNumber.text.isEmpty ||
        cubit.lang == null ||
        cubit.departMent == null) {
      flutterToast(message: 'enter data correctly ');
    } else {
      await cubit.question(data: {
        "name": name.text,
        "email": email.text,
        "phone": phoneNumber.text,
        "national_id": nationalId.text,
        "lang": cubit.lang,
        "department": cubit.departMent,
        "type": "1"
      });
    }
  }
}
