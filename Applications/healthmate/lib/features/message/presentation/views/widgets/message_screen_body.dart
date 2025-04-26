import 'package:flutter/material.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/message/presentation/views/widgets/container_field_message.dart';
import 'package:healthmate/features/message/presentation/views/widgets/first_logo_container_chat.dart';

class MessageScreenBody extends StatefulWidget {
  MessageScreenBody({super.key});

  @override
  State<MessageScreenBody> createState() => _MessageScreenBodyState();
}

class _MessageScreenBodyState extends State<MessageScreenBody> {
  List<Map<String, String>> messages = []; // لستة الرسائل
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      messages.add({'sender': 'user', 'text': _controller.text.trim()});
      messages.add({'sender': 'bot', 'text': 'Hi, how can I help you? 🤖'});
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          CustomAppBar(
            title: 'ChatMate',
            stateicon: true,
          ),
          Expanded(
            child: messages.isEmpty
                ? Center(
                    child: FirstLogoContainerChat(isVisible: true),
                  )
                : ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.only(bottom: 20),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[messages.length - 1 - index];
                      final isUser = message['sender'] == 'user';
                      return Align(
                        alignment: isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color:
                                isUser ? Colors.blueAccent : Colors.grey[300],
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
                    },
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
