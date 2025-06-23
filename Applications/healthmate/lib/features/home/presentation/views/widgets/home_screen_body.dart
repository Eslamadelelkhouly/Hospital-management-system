import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/home/data/model/top_doctor_model.dart';
import 'package:healthmate/features/home/presentation/manager/get_doctor_cubit/gettopdoctor_cubit.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_list_tiel.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_list_view_container_doctor.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_row_categories.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_search_text_field.dart';
import 'package:healthmate/features/home/presentation/views/widgets/row_text_home.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CustomListTiel(),
            SizedBox(
              height: 16,
            ),
            CustomSearchTextField(
              onTap: () {},
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 16,
            ),
            CustomRowCategories(),
            SizedBox(
              height: 16,
            ),
            RowTextHome(),
            Expanded(
              child: CustomListViewContainerDoctor(),
            ),
          ],
        ),
      ),
    );
  }
}
