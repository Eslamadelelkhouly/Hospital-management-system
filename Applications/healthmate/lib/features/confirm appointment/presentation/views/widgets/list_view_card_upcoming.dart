import 'package:flutter/material.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/card_confirm.dart';

class ListViewUpComing extends StatelessWidget {
  const ListViewUpComing({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 32,
        ),
        padding: const EdgeInsets.all(0),
        itemCount: 10,
        itemBuilder: (context, index) => CardConfirm(
          showbutton: true,
        ),
      ),
    );
  }
}
