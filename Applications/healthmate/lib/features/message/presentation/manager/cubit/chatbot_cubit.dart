import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:healthmate/core/API/gemini_services.dart';
import 'package:meta/meta.dart';

part 'chatbot_state.dart';

class ChatbotCubit extends Cubit<ChatbotState> {
  ChatbotCubit() : super(ChatbotInitial());

  Future<void> sendMessage(String message) async {
    emit(ChatbotLoading());
    GeminiServices geminiServices = GeminiServices();
    var response = await geminiServices.getResponse(message);
    log('Response in cubit: $response');
    response.fold(
      (failure) => emit(ChatbotFailed(errormessage: failure)),
      (message) => emit(ChatbotSuccess(message: message)),
    );
  }
}
