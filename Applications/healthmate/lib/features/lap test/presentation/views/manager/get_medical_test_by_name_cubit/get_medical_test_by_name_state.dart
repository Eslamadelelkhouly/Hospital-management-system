part of 'get_medical_test_by_name_cubit.dart';

@immutable
sealed class GetMedicalTestByNameState {}

final class GetMedicalTestByNameInitial extends GetMedicalTestByNameState {}

final class GetMedicalTestByNameLoading extends GetMedicalTestByNameState {}

final class GetMedicalTestByNameSuccess extends GetMedicalTestByNameState {
  final MedicalTestSearch medicalTestSearch;
  GetMedicalTestByNameSuccess({required this.medicalTestSearch});
}

final class GetMedicalTestByNameError extends GetMedicalTestByNameState {
  final String errorMessage;
  GetMedicalTestByNameError({required this.errorMessage});
}
