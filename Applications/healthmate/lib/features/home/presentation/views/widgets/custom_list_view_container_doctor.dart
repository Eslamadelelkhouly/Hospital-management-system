import 'package:flutter/material.dart';
import 'package:healthmate/features/home/data/model/top_doctor_model.dart';
import 'package:healthmate/features/home/presentation/views/widgets/container_doctor.dart';

class CustomListViewContainerDoctor extends StatelessWidget {
  const CustomListViewContainerDoctor(
      {super.key, required this.topDoctorsResponse});
  final TopDoctorsResponse topDoctorsResponse;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      scrollDirection: Axis.vertical,
      itemCount: topDoctorsResponse.doctors.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ContainerDoctor(
            image: topDoctorsResponse.doctors[index].image.imageName,
            id: topDoctorsResponse.doctors[index].id,
            rating: double.parse(topDoctorsResponse.doctors[index].rating),
            doctorName: topDoctorsResponse.doctors[index].firstName,
            specialty: topDoctorsResponse.doctors[index].specializationName,
          ),
        );
      },
    );
  }
}
