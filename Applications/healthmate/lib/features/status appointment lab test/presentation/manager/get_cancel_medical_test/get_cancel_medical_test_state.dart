part of 'get_cancel_medical_test_cubit.dart';

@immutable
sealed class GetCancelMedicalTestState {}

final class GetCancelMedicalTestInitial extends GetCancelMedicalTestState {}

final class GetCancelMedicalTestLoading extends GetCancelMedicalTestState {}

final class GetCancelMedicalTestError extends GetCancelMedicalTestState {
  final String errorMessage;
  GetCancelMedicalTestError({
    required this.errorMessage,
  });
}

final class GetCancelMedicalTestSuccess extends GetCancelMedicalTestState {
    final MedicalTestState medicalTestState;

  GetCancelMedicalTestSuccess({required this.medicalTestState});

}
