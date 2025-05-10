import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/custom_list_tiel_confirm_card.dart';

class BodyCardConfirmation extends StatelessWidget {
  const BodyCardConfirmation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 120,
      decoration: BoxDecoration(
        color: ColorSystem.kPrimaryColorHighLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          CustomListTielConfirmCard(),
        ],
      ),
    );
  }
}
