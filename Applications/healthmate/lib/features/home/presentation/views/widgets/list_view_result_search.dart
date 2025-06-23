import 'package:flutter/material.dart';
import 'package:healthmate/features/home/presentation/views/widgets/container_doctor.dart';
import 'package:healthmate/features/search/data/models/doctor_model_get_by_name.dart';

class ListViewResultSearch extends StatelessWidget {
  const ListViewResultSearch({super.key, required this.doctorSearch});
  final DoctorSearch doctorSearch;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        scrollDirection: Axis.vertical,
        itemCount: doctorSearch.doctors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ContainerDoctor(
              image:
                  'http://10.0.2.2:8000/storage/${doctorSearch.doctors[index].imageName}',
              id: doctorSearch.doctors[index].id,
              rating: double.parse(doctorSearch.doctors[index].rating),
              doctorName: doctorSearch.doctors[index].firstName,
              specialty: doctorSearch.doctors[index].specialization,
            ),
          );
        },
      ),
    );
  }
}
