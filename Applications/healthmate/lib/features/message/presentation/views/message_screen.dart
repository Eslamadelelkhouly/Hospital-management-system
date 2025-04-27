import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/message/presentation/manager/cubit/chatbot_cubit.dart';
import 'package:healthmate/features/message/presentation/views/widgets/message_bloc_consumer.dart';
import 'package:healthmate/features/message/presentation/views/widgets/message_screen_body.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatbotCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: MessageBlocConsumer(),
      ),
    );
  }
}
