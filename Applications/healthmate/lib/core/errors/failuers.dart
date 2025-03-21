import 'package:dio/dio.dart';

class Failuers {
  final String errorMessage;
  Failuers({required this.errorMessage});
}

class ServerFailure extends Failuers {
  ServerFailure(String errorMessage) : super(errorMessage: errorMessage);

  factory ServerFailure.fromDioException(DioException dioexception) {
    switch (dioexception.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioexception.response!.statusCode!, dioexception.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      default:
        if (dioexception.message?.contains('SocketException') ?? false) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, please try Again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['message'] ?? 'Bad Request');
    } else if (statusCode == 404) {
      return ServerFailure(
          'Your request was not found, please try again later');
    } else if (statusCode == 422) {
      final errors = response['errors'] as Map<String, dynamic>;
      final errorMessages = errors.entries
          .map((entry) => '${entry.key}: ${entry.value.join(', ')}')
          .join('\n');
      return ServerFailure(errorMessages);
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, please try again later');
    } else {
      return ServerFailure('Oops, there was an error, please try again');
    }
  }
}
