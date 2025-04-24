import 'package:flutter/material.dart';
import 'package:healthmate/features/message/presentation/views/widgets/message_screen_body.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MessageScreenBody(),
    );
  }
}
