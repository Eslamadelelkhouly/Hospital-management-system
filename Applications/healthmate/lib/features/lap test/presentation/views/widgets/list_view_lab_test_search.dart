import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/features/lap%20test/presentation/data/models/medical_test_serch_model.dart';
import 'package:healthmate/features/lap%20test/presentation/views/widgets/custom_list_tiel_lab_test.dart';

class ListViewLabTestSearch extends StatelessWidget {
  const ListViewLabTestSearch({super.key, required this.medicalTestSearch});
  final MedicalTestSearch medicalTestSearch;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: medicalTestSearch.tests.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                Routing.kmedicaltestinformation,
                extra: medicalTestSearch.tests[index].id,
              );
            },
            child: CustomListTielLabTest(
              text: medicalTestSearch.tests[index].testName,
              price: medicalTestSearch.tests[index].cost,
            ),
          );
        });
  }
}
