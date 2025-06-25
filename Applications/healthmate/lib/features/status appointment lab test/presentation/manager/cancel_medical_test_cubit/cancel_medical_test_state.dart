part of 'cancel_medical_test_cubit.dart';

@immutable
sealed class CancelMedicalTestState {}

final class CancelMedicalTestInitial extends CancelMedicalTestState {}

final class CancelMedicalTestLoading extends CancelMedicalTestState {}

final class CancelMedicalError extends CancelMedicalTestState {
  final String errorMessage;

  CancelMedicalError({required this.errorMessage});
}

final class CancelMedicalTestSuccess extends CancelMedicalTestState {
  final String message;
  CancelMedicalTestSuccess({required this.message});
}
