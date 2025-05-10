import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/body_card_confirmation.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/container_state_booking.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/custom_list_tiel_confirm_card.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/title_card_confirm.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_list_tiel.dart';

class CardConfirm extends StatelessWidget {
  const CardConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          TitleCardConfirm(),
          SizedBox(
            height: 16,
          ),
          Stack(
            children: [
              BodyCardConfirmation(),
              Positioned(
                right: 12,
                top: 16,
                child: Containerstatebooking(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
