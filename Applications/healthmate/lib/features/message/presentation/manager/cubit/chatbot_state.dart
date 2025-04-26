part of 'chatbot_cubit.dart';

@immutable
sealed class ChatbotState {}

final class ChatbotInitial extends ChatbotState {}

final class ChatbotLoading extends ChatbotState {}

final class ChatbotSucess extends ChatbotState {
  final String message;

  ChatbotSucess({required this.message});

}

final class ChatbotFailed extends ChatbotState {
  final String errormessage;

  ChatbotFailed({required this.errormessage});


}

