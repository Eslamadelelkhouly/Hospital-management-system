import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/home/data/model/top_doctor_model.dart';
import 'package:healthmate/features/home/presentation/manager/get_doctor_cubit/gettopdoctor_cubit.dart';
import 'package:healthmate/features/home/presentation/views/widgets/container_doctor.dart';

class CustomListViewContainerDoctor extends StatefulWidget {
  const CustomListViewContainerDoctor({super.key});

  @override
  State<CustomListViewContainerDoctor> createState() =>
      _CustomListViewContainerDoctorState();
}

class _CustomListViewContainerDoctorState
    extends State<CustomListViewContainerDoctor> {
  late TopDoctorsResponse topDoctorsResponse = TopDoctorsResponse(
    doctors: [],
    message: "",
    status: 0,
  );
  String errorMessage = '';
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GettopdoctorCubit>().getTopDoctor();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GettopdoctorCubit, GettopdoctorState>(
      listener: (context, state) {
        if (state is GettopdoctorSuccess) {
          topDoctorsResponse = state.topDoctorsResponse;
        }
        if (state is GettopdoctorError) {
          errorMessage = state.error.errorData['message'];
        }
      },
      builder: (context, state) {
        return state is GettopdoctorSuccess
            ? Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  scrollDirection: Axis.vertical,
                  itemCount: topDoctorsResponse.doctors.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ContainerDoctor(
                        image:
                            topDoctorsResponse.doctors[index].image.imageName,
                        id: topDoctorsResponse.doctors[index].id,
                        rating: double.parse(
                            topDoctorsResponse.doctors[index].rating),
                        doctorName: topDoctorsResponse.doctors[index].firstName,
                        specialty: topDoctorsResponse
                            .doctors[index].specializationName,
                      ),
                    );
                  },
                ),
              )
            : state is GettopdoctorError
                ? Center(
                    child: Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  )
                : const Center(child: SizedBox());
      },
    );
  }
}
