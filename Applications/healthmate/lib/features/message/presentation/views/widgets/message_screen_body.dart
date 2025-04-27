import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/message/presentation/manager/cubit/chatbot_cubit.dart';
import 'package:healthmate/features/message/presentation/views/widgets/container_field_message.dart';
import 'package:healthmate/features/message/presentation/views/widgets/first_logo_container_chat.dart';

class MessageScreenBody extends StatefulWidget {
  const MessageScreenBody({super.key});

  @override
  State<MessageScreenBody> createState() => _MessageScreenBodyState();
}

class _MessageScreenBodyState extends State<MessageScreenBody> {
  List<Map<String, String>> messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      messages.add({'sender': 'user', 'text': _controller.text.trim()});
    });
    context.read<ChatbotCubit>().sendMessage(_controller.text..trim());
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CustomAppBar(title: 'ChatMate', stateicon: true),
          Expanded(
            child: BlocListener<ChatbotCubit, ChatbotState>(
              listener: (context, state) {
                if (state is ChatbotSuccess) {
                  setState(() {
                    messages.add({'sender': 'bot', 'text': state.message});
                  });
                } else if (state is ChatbotFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errormessage)),
                  );
                }
              },
              child: messages.isEmpty
                  ? Center(child: FirstLogoContainerChat(isVisible: true))
                  : ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.only(bottom: 20),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[messages.length - 1 - index];
                        final isUser = message['sender'] == 'user';
                        return ContainerChatBot(
                          isUser: isUser,
                          message: message,
                        );
                      },
                    ),
            ),
          ),
          ContainerFieldMessage(
            controller: _controller,
            onTap: _sendMessage,
          ),
        ],
      ),
    );
  }
}

class ContainerChatBot extends StatelessWidget {
  const ContainerChatBot({
    super.key,
    required this.isUser,
    required this.message,
  });

  final bool isUser;
  final Map<String, String> message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser ? Colors.blueAccent : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message['text']!,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
