part of 'question_cubit.dart';

@immutable
sealed class QuestionState {}

final class QuestionInitial extends QuestionState {}

final class Success extends QuestionState {}

final class Failure extends QuestionState {
  final String errorMessage;

  Failure({required this.errorMessage});
}

final class Loading extends QuestionState {}
