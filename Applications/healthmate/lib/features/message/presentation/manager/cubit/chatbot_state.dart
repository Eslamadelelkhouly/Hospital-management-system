part of 'chatbot_cubit.dart';

@immutable
abstract class ChatbotState {}

class ChatbotInitial extends ChatbotState {}

class ChatbotLoading extends ChatbotState {}

class ChatbotSuccess extends ChatbotState {
  final String message;
  ChatbotSuccess({required this.message});
}

class ChatbotFailed extends ChatbotState {
  final String errormessage;
  ChatbotFailed({required this.errormessage});
}
