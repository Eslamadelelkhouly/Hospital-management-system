import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/message/presentation/views/widgets/custom_text_field_message.dart';

class ContainerFieldMessage extends StatelessWidget {
  const ContainerFieldMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomTextFieldMessage()),
        SizedBox(
          width: 5,
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: ColorSystem.kPrimaryColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.send_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
