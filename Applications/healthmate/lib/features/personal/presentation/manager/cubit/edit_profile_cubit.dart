import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthmate/core/API/api_service.dart';
import 'package:healthmate/features/personal/data/repos/get_personal_info_repo_implement.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  ApiService apiService = ApiService(dio: Dio());
  EditProfileCubit() : super(EditProfileInitial());
  Future<void> EditProfile({  required String name,
    required String address,
    required String gender,
    required String phoneNumber,
    required XFile image,
    required String id,}) async {
      emit(EditProfileLoading());
      final result = await GetPersonalInfoRepoImplement(apiService: apiService)
          .updatePersonalInfo(
        name: name,
        address: address,
        gender: gender,
        phoneNumber: phoneNumber,
        image: image,
        id: id,
      );
      result.fold(
        (failure) => emit(EditProfileError(errorMessage: failure)),
        (response) => emit(EditProfileSuccess(sucessData: response)),
      );
    }
}
