import 'package:dio/dio.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});
  Future<Map<String, dynamic>> Post(
      {required String endpoint, required dynamic data}) async {
    var response = await dio.post(
      '${BackendEndpoint.baseUrl}$endpoint',
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
    var response = await dio.get(endpoint);
    return response.data;
  }

  Future<void> Delete({required String endpoint}) async {
    await dio.delete(endpoint);
  }

  Future<void> Put({required String endpoint, required dynamic data}) async {
    await dio.put(endpoint, data: data);
  }
}
