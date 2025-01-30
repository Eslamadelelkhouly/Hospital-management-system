import 'package:flutter/widgets.dart';
import 'package:healthmate/features/Auth/presentation/widgets/custom_password_text_field.dart';
import 'package:healthmate/features/Auth/presentation/widgets/custom_text_field.dart';

class CustomFormSignIn extends StatelessWidget {
  const CustomFormSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextField(),
          SizedBox(
            height: 20,
          ),
          CustomPasswordTextField(),
        ],
      ),
    );
  }
}