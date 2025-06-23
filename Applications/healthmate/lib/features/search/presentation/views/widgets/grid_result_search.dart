import 'package:flutter/material.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';
import 'package:healthmate/features/search/data/models/doctor_model_get_by_name.dart';
import 'package:healthmate/features/search/presentation/views/widgets/container_result.dart';
import 'package:healthmate/features/search/presentation/views/widgets/container_search.dart';

class GridResultSearch extends StatelessWidget {
  const GridResultSearch({super.key, required this.doctorSearch});
  final DoctorSearch doctorSearch;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(0),
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 200,
      ),
      itemCount: doctorSearch.doctors.length,
      itemBuilder: (context, index) {
        return ContainerResult(
          doctorSearch: doctorSearch.doctors[index],
        );
      },
    );
  }
}
