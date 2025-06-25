import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/style.dart';

class FirstLogoContainerChat extends StatelessWidget {
  FirstLogoContainerChat({super.key, required this.isVisible});
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: Visibility(
        visible: isVisible,
        replacement: SizedBox.shrink(),
        child: Container(
          width: MediaQuery.of(context).size.width * 2.27,
          height: MediaQuery.of(context).size.height * 0.30,
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
                style: ResponsiveStylingSystem.textStyle18semibold(context),
              ),
              Text(
                'How can i help you today?',
                style:ResponsiveStylingSystem.textStyle14Medium(context).copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
