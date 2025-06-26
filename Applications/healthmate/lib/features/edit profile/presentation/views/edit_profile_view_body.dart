import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/features/edit%20profile/presentation/views/body_edit_body.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Header
        Positioned(
          top: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(header),
            ],
          ),
        ),
        // Fotter
        Positioned(
          right: 0,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(fotter),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const BodyEditBody(),
        ),
      ],
    );
  }
}
