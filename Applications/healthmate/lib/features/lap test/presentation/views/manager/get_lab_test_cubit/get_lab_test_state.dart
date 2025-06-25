part of 'get_lab_test_cubit.dart';

@immutable
sealed class GetLabTestState {}

final class GetLabTestInitial extends GetLabTestState {}

final class GetLabTestLoading extends GetLabTestState {}

final class GetLabTestError extends GetLabTestState {
  final Map<String, dynamic> errorMap;

  GetLabTestError({required this.errorMap});

}

final class GetLabTestSucess extends GetLabTestState {
  final MedicalTestsResponse medicalTestsResponse;

  GetLabTestSucess({required this.medicalTestsResponse});
}
