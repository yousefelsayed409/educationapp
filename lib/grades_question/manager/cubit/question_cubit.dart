import 'package:bloc/bloc.dart';
import 'package:educationapp/grades_question/data/repo/home_repo_imple.dart';
import 'package:meta/meta.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit(this.homeRepoquestionImple) : super(QuestionInitial());
  final HomeRepoquestionImple homeRepoquestionImple;
  String? lang;
  String? departMent;
  Future<void> question({required Map<String, dynamic> data}) async {
    emit(Loading());
    var result = await homeRepoquestionImple.question(data: data);
    result.fold((l) {
      emit(Failure(errorMessage: l.message));
    }, (r) {
      emit(Success());
    });
  }
}
