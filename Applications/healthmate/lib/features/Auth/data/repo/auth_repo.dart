import 'package:healthmate/features/Auth/data/model/patient_model.dart';

abstract class AuthRepo {
  Future<void> register(PatientModel patient) async {}
}
