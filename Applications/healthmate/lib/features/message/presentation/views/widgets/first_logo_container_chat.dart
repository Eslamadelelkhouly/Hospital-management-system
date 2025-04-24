import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/style.dart';

class FirstLogoContainerChat extends StatelessWidget {
  const FirstLogoContainerChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 2.27,
        height: MediaQuery.of(context).size.height * 0.56,
        child: Column(
          children: [
            Image.asset(
              logo2,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Hi, I’m ChatMate',
              style: StylingSystem.textStyle18semibold,
            ),
            Text(
              'How can i help you today?',
              style: StylingSystem.textStyle14Medium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
