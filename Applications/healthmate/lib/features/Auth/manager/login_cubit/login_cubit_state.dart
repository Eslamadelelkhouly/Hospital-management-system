part of 'login_cubit_cubit.dart';

@immutable
sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}

final class LoginCubitLoading extends LoginCubitState {}

final class LoginCubitSuccess extends LoginCubitState {
  final Map<String, dynamic> data;
  LoginCubitSuccess({required this.data});
}

final class LoginCubitFailure extends LoginCubitState {
  final Map<String, dynamic> erorMessage;
  LoginCubitFailure({required this.erorMessage});
}
