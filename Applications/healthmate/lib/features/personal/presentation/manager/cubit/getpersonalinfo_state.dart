part of 'getpersonalinfo_cubit.dart';

@immutable
sealed class GetpersonalinfoState {}

final class GetpersonalinfoInitial extends GetpersonalinfoState {}

final class GetpersonalinfoLoading extends GetpersonalinfoState {}

final class GetpersonalinfoSuccess extends GetpersonalinfoState {
  final PersonalInfoModel personalInfoModel;

  GetpersonalinfoSuccess({required this.personalInfoModel});
}

final class GetpersonalinfoError extends GetpersonalinfoState {
  final Map<String, dynamic> erorMessage;

  GetpersonalinfoError({required this.erorMessage});
}
