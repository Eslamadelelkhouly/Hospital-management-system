import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/shared_perfernce_singletone.dart';
import 'package:healthmate/features/heartdisease/endpoints/endpoints_heart_disease.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});
  Future<Map<String, dynamic>> Post(
      {required String endpoint, required dynamic data}) async {
    var response = await dio.post(
      '${EndpointsHeartDisease.endpoint}',
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> Get({required String endpoint}) async {
    try {
      final String? barrertoken =
          await SharedPreferenceSingleton.getString(token);

      if (barrertoken == null || barrertoken.isEmpty) {
        throw DioException(
          requestOptions: RequestOptions(path: endpoint),
          error: 'Authentication token missing',
        );
      }

      final response = await dio.get(
        endpoint,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $barrertoken',
          },
        ),
      );

      if (response.data == null) {
        throw DioException(
          requestOptions: response.requestOptions,
          error: 'Server returned null response',
        );
      }

      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.receiveTimeout) {
        log('Receive timeout occurred');
      } else if (e.type == DioExceptionType.connectionError) {
        log('Connection error occurred');
      } else if (e.type == DioExceptionType.connectionTimeout) {
        log('Connection timeout occurred');
      }

      final errorMsg = e.response?.data?['message'] ??
          e.message ??
          e.error?.toString() ??
          'Request failed with no error message';

      log('Dio Error Details:');
      log('- URL: ${e.requestOptions.uri}');
      log('- Status: ${e.response?.statusCode}');
      log('- Error: $errorMsg');
      log('- Response: ${e.response?.data}');
      log('- DioErrorType: ${e.type}');

      rethrow;
    } catch (e) {
      log('Non-Dio Error: $e');
      throw DioException(
        requestOptions: RequestOptions(path: endpoint),
        error: 'Unexpected error: $e',
      );
    }
  }

  Future<void> Delete({required String endpoint}) async {
    await dio.delete(endpoint);
  }

  Future<void> Put({required String endpoint, required dynamic data}) async {
    await dio.put(endpoint, data: data);
  }
}
