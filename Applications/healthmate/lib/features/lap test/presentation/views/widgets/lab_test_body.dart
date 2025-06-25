import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/Auth/presentation/views/sign_in_screen.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_search_text_field.dart';
import 'package:healthmate/features/lap%20test/presentation/views/manager/get_lab_test_cubit/get_lab_test_cubit.dart';
import 'package:healthmate/features/lap%20test/presentation/views/widgets/list_view_card_lab_test.dart';

class LabTestBody extends StatefulWidget {
  const LabTestBody({super.key});

  @override
  State<LabTestBody> createState() => _LabTestBodyState();
}

class _LabTestBodyState extends State<LabTestBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetLabTestCubit>().getLabTest();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                header,
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                fotter,
              ),
            ],
          ),
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.verticalSpace,
                CustomAppBar(
                  title: 'Choose Medical Test',
                  stateicon: true,
                ),
                30.verticalSpace,
                CustomSearchTextField(
                  onTap: () {},
                  controller: TextEditingController(),
                ),
                16.verticalSpace,
                Row(
                  children: [
                    13.horizontalSpace,
                    Text(
                      'Book Lab Tests',
                      style:ResponsiveStylingSystem.textStyle20semibold(context),
                    ),
                  ],
                ),
                8.verticalSpace,
                ListViewCardLabTest(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
