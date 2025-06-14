import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/features/choose%20Data%20and%20time%20medical%20test/data/repos/book_medical_test_repo.dart';

class BookMedicalTestRepoImplementation extends BookMedicalTestRepo {
  final ApiService apiService;
  BookMedicalTestRepoImplementation({required this.apiService});
  @override
  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> bookMedicalTest(
      {required String medicalTestId,
      required String doctorId,
      required String date,
      required String time,}) async {
    try {
      var response = await apiService.Post(
          endpoint: BackendEndpoint.bookmedicaltest,
          data: {
            'test_id': medicalTestId,
            'doc_id': doctorId,
            'appoint_date': date,
            'appoint_time': time,
          });
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data != null) {
          return left(Map<String, dynamic>.from(e.response!.data));
        } else {
          return left(
              {"message": "Connection timeout with ApiServer", "errors": {}});
        }
      } else {
        return left({"message": "Unexpected Error", "errors": {}});
      }
    }
  }
}
