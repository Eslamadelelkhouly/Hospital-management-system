import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cancel_medical_test_state.dart';

class CancelMedicalTestCubit extends Cubit<CancelMedicalTestState> {
  CancelMedicalTestCubit() : super(CancelMedicalTestInitial());
}
