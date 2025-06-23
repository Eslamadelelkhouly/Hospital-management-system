import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/doctor/presentation/manager/cubit/get_doctor_by_id_cubit.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_search_text_field.dart';
import 'package:healthmate/features/search/manager/Show%20Doctor%20Cubit/show_doctor_cubit.dart';
import 'package:healthmate/features/search/manager/cubit/get_doctor_by_name_cubit.dart';
import 'package:healthmate/features/search/presentation/views/widgets/custom_grid_view_card_search.dart';
import 'package:healthmate/features/search/presentation/views/widgets/grid_result_search.dart';

class SearchScreenBody extends StatefulWidget {
  const SearchScreenBody({super.key});

  @override
  State<SearchScreenBody> createState() => _SearchScreenBodyState();
}

class _SearchScreenBodyState extends State<SearchScreenBody> {
  late TextEditingController controllerSearch;

  @override
  void initState() {
    super.initState();
    controllerSearch = TextEditingController();
    context.read<ShowDoctorCubit>().getDoctors();
  }

  @override
  void dispose() {
    controllerSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetDoctorByNameCubit, GetDoctorByNameState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).r,
            child: Column(
              children: [
                30.verticalSpace,
                const CustomAppBar(
                  title: 'All doctors',
                  stateicon: true,
                ),
                24.verticalSpace,
                CustomSearchTextField(
                  controller: controllerSearch,
                  onChanged: (value) {
                    log(value.toString());
                    context.read<GetDoctorByNameCubit>().getDoctorByName(
                          name: controllerSearch.text,
                        );
                  },
                ),
                24.verticalSpace,
                if (state is GetDoctorByNameLoading) ...[
                  const Center(child: CircularProgressIndicator()),
                ] else if (state is GetDoctorByNameSuccess) ...[
                  Expanded(
                    child: GridResultSearch(doctorSearch: state.doctorsResponse),
                  ),
                ] else if (state is GetDoctorByNameError) ...[
                  Expanded(
                    child: Center(
                      child: Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ] else ...[
                  Expanded(child: CustomGridViewCardSearch()),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
