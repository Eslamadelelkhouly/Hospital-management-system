import 'package:flutter/material.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/show_search_result/presentation/views/widgets/search_doctor_result_body.dart';

class SearchDoctorResultView extends StatelessWidget {
  const SearchDoctorResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SearchDoctorResultBody(),
    );
  }
}
