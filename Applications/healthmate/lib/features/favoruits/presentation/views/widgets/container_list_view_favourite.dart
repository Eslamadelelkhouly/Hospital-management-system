import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/favoruits/presentation/data/models/favoutite_list_model.dart';
import 'package:healthmate/features/favoruits/presentation/data/repos/get_favourite_doctor_repo.dart';
import 'package:healthmate/features/favoruits/presentation/views/manager/get_favourite_doctor_cubit/getfavouritedoctor_cubit.dart';
import 'package:healthmate/features/home/presentation/views/widgets/container_doctor.dart';

class ContainerListViewFavourite extends StatefulWidget {
  const ContainerListViewFavourite({super.key});

  @override
  State<ContainerListViewFavourite> createState() =>
      _ContainerListViewFavouriteState();
}

class _ContainerListViewFavouriteState
    extends State<ContainerListViewFavourite> {
  FavoriteDoctorsResponse favoriteDoctorsResponse = FavoriteDoctorsResponse(
    favoriteDoctors: [],
    message: '',
    status: 0,
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetfavouritedoctorCubit, GetfavouritedoctorState>(
      listener: (context, state) {
        if (state is GetfavouritedoctorSuccess) {
          favoriteDoctorsResponse = state.favouriteDoctorsResponse;
          setState(() {});
        }
      },
      builder: (context, state) {
        return state is GetfavouritedoctorSuccess
            ? ListView.builder(
                padding: const EdgeInsets.all(0),
                scrollDirection: Axis.vertical,
                itemCount: favoriteDoctorsResponse.favoriteDoctors.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ContainerDoctor(
                      doctorName: favoriteDoctorsResponse
                          .favoriteDoctors[index].firstName,
                      id: favoriteDoctorsResponse.favoriteDoctors[index].id,
                      image: favoriteDoctorsResponse
                          .favoriteDoctors[index].image.imageName,
                      rating: double.parse(favoriteDoctorsResponse
                          .favoriteDoctors[index].rating),
                    ),
                  );
                },
              )
            : state is GetfavouritedoctorError
                ? Center(
                    child: Text(
                      state.error['message'],
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
                : SizedBox();
      },
    );
  }
}
