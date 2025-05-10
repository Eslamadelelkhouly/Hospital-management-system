import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/custom_button_confirmation.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/custom_list_tiel_confirm_card.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/date_and_time_row_card_confirm.dart';

class BodyCardConfirmation extends StatelessWidget {
  const BodyCardConfirmation({
    super.key,
    required this.showbutton,
  });

  final bool showbutton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: ColorSystem.kPrimaryColorHighLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomListTielConfirmCard(),
          const SizedBox(height: 8),
          Container(
            width: MediaQuery.of(context).size.width * 0.77,
            height: 40,
            decoration: BoxDecoration(
              color: ColorSystem.kPrimaryColorLight,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: DateAndTimeRowCardConfirm(),
            ),
          ),
          const SizedBox(height: 8),
          if (showbutton)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonConfirmation(
                    onPressed: () {},
                    text: 'Cancel',
                    background: ColorSystem.kPrimaryColorHighLight,
                    textColor: ColorSystem.kPrimaryColor,
                    borderColor: ColorSystem.kPrimaryColor,
                  ),
                  CustomButtonConfirmation(
                    onPressed: () {},
                    text: 'Payement',
                    background: ColorSystem.kPrimaryColor,
                    textColor: Colors.white,
                    borderColor: ColorSystem.kPrimaryColor,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
