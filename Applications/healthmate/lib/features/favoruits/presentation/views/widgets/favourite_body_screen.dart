import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/favoruits/presentation/views/manager/get_favourite_doctor_cubit/getfavouritedoctor_cubit.dart';
import 'package:healthmate/features/favoruits/presentation/views/widgets/container_list_view_favourite.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_list_view_container_doctor.dart';

class FavouriteBodyScreen extends StatefulWidget {
  const FavouriteBodyScreen({
    super.key,
  });

  @override
  State<FavouriteBodyScreen> createState() => _FavouriteBodyScreenState();
}

class _FavouriteBodyScreenState extends State<FavouriteBodyScreen> {
  @override
  initState() {
    super.initState();
    context.read<GetfavouritedoctorCubit>().getFavouritedoctor();
  }

  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: const Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomAppBar(
              title: 'My favorite list',
              stateicon: false,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ContainerListViewFavourite(),
            ),
          ),
        ],
      ),
    );
  }
}
