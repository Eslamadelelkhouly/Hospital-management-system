import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_search_text_field.dart';
import 'package:healthmate/features/search/manager/cubit/show_doctor_cubit.dart';
import 'package:healthmate/features/search/presentation/views/widgets/custom_grid_view_card_search.dart';

class SearchScreenBody extends StatefulWidget {
  const SearchScreenBody({super.key});

  @override
  State<SearchScreenBody> createState() => _SearchScreenBodyState();
}

class _SearchScreenBodyState extends State<SearchScreenBody> {

  @override
  TextEditingController controllerSearch = TextEditingController();

  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ShowDoctorCubit>().getDoctors();
    controllerSearch = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllerSearch.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              onTap: () {},
              controller: TextEditingController(),
            ),
            24.verticalSpace,
            Expanded(child: CustomGridViewCardSearch())
          ],
        ),
      ),
    );
  }
}
