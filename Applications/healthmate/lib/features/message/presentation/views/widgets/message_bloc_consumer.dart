import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/message/presentation/manager/cubit/chatbot_cubit.dart';
import 'package:healthmate/features/message/presentation/views/widgets/message_screen_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class MessageBlocConsumer extends StatelessWidget {
  const MessageBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatbotCubit, ChatbotState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ChatbotLoading,
          child: MessageScreenBody(),
        );
      },
    );
  }
}
