part of 'get_medical_info_cubit.dart';

@immutable
sealed class GetMedicalInfoState {}

final class GetMedicalInfoInitial extends GetMedicalInfoState {}

final class GetMedicalInfoLoading extends GetMedicalInfoState {}
final class GetMedicalInfoSuccess extends GetMedicalInfoState {
  final MedicalInfoModel medicalInfo;

  GetMedicalInfoSuccess({required this.medicalInfo});
}
final class GetMedicalInfoFailure extends GetMedicalInfoState {
  final Map<String,dynamic> message;

  GetMedicalInfoFailure({required this.message});

}
