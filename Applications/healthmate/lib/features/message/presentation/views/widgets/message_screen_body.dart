import 'package:flutter/material.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/message/presentation/views/widgets/container_field_message.dart';
import 'package:healthmate/features/message/presentation/views/widgets/custom_text_field_message.dart';
import 'package:healthmate/features/message/presentation/views/widgets/first_logo_container_chat.dart';

class MessageScreenBody extends StatelessWidget {
  const MessageScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        CustomAppBar(
          title: 'Messages',
          stateicon: true,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.24,
        ),
        FirstLogoContainerChat(),
        Spacer(),
        ContainerFieldMessage(),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
