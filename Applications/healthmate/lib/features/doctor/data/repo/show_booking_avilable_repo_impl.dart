import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/core/API/backend_endpoint.dart';
import 'package:healthmate/core/errors/failuers.dart';
import 'package:healthmate/features/doctor/data/models/booking_avaliabale_model.dart';
import 'package:healthmate/features/doctor/data/repo/show_booking_avilable_repo.dart';

class ShowBookingAvilableRepoImpl implements ShowBookingAvailableRepo {
  @override
  final ApiService apiService;

  ShowBookingAvilableRepoImpl({required this.apiService});
  Future<Either<Failures, BookingAvaliabaleModel>> showBookingAvailable(
      {required String doctorId}) async {
    try {
      var response = await apiService.GetWithKey(
          endpoint: BackendEndpoint.getavailbletimedoctor, key: doctorId);
      BookingAvaliabaleModel bookingAvaliabaleModel =
          BookingAvaliabaleModel.fromJson(response);
      return right(bookingAvaliabaleModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(
            {"message": "Connection timeout with ApiServer", "errors": {}}));
      }
    }
  }
}
