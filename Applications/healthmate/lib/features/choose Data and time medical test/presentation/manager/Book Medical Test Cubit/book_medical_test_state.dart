part of 'book_medical_test_cubit.dart';

@immutable
sealed class BookMedicalTestState {}

final class BookMedicalTestInitial extends BookMedicalTestState {}

final class BookMedicalTestLoading extends BookMedicalTestState {}

final class BookMedicalTestSuccess extends BookMedicalTestState {
  final Map<String, dynamic> response;

  BookMedicalTestSuccess({required this.response});
}

final class BookMedicalTestError extends BookMedicalTestState {
  final Map<String, dynamic> message;

  BookMedicalTestError({required this.message});
}
