import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changeslidercontainer_state.dart';

class ChangeslidercontainerCubit extends Cubit<ChangeslidercontainerState> {
  ChangeslidercontainerCubit() : super(ChangeslidercontainerInitial());

  void getmanagestat() {
    emit(ChangeslidercontainerInitial());
    emit(SecondState());
    emit(ThirdState());
  }
}
