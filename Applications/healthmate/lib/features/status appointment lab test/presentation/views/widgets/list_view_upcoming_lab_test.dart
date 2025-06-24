import 'package:flutter/material.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/presentation/views/widgets/card_confirm_lab_test.dart';

class ListViewUpcomingLabTest extends StatefulWidget {
  const ListViewUpcomingLabTest({super.key});

  @override
  State<ListViewUpcomingLabTest> createState() => _ListViewUpcomingLabTestState();
}

class _ListViewUpcomingLabTestState extends State<ListViewUpcomingLabTest> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 32),
        padding: const EdgeInsets.all(0),
        itemCount: 4,
        itemBuilder: (context, index) => CardConfirmLabTest(),
      ),
    );
    ;
  }
}
