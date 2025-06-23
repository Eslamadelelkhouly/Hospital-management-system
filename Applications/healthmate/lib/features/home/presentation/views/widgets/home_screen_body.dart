import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_list_tiel.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_list_view_container_doctor.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_row_categories.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_search_text_field.dart';
import 'package:healthmate/features/home/presentation/views/widgets/list_view_result_search.dart';
import 'package:healthmate/features/home/presentation/views/widgets/row_text_home.dart';
import 'package:healthmate/features/search/manager/cubit/get_doctor_by_name_cubit.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  TextEditingController searchController = TextEditingController();
  String error = '';

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocConsumer<GetDoctorByNameCubit, GetDoctorByNameState>(
          listener: (context, state) {},
          builder: (context, state) {
            Widget content;

            if (state is GetDoctorByNameLoading) {
              content = const Center(child: CircularProgressIndicator());
            } else if (state is GetDoctorByNameSuccess) {
              content =
                  ListViewResultSearch(doctorSearch: state.doctorsResponse);
            } else if (state is GetDoctorByNameError) {
              error = state.errorMessage;
              if (error != 'The query field is required.') {
                content = Center(
                  child: Text(
                    error,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              } else {
                content = const CustomListViewContainerDoctor();
              }
            } else {
              content = const CustomListViewContainerDoctor();
            }

            return Column(
              children: [
                const SizedBox(height: 50),
                const CustomListTiel(),
                const SizedBox(height: 16),
                CustomSearchTextField(
                  onChanged: (value) {
                    context
                        .read<GetDoctorByNameCubit>()
                        .getDoctorByName(name: value);
                  },
                  controller: searchController,
                ),
                const SizedBox(height: 16),
                const CustomRowCategories(),
                const SizedBox(height: 16),
                const RowTextHome(),
                const SizedBox(height: 16),
                content,
              ],
            );
          },
        ),
      ),
    );
  }
}
