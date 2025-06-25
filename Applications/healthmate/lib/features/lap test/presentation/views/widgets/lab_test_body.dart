import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_search_text_field.dart';
import 'package:healthmate/features/lap%20test/presentation/views/manager/cubit/get_medical_test_by_name_cubit.dart';
import 'package:healthmate/features/lap%20test/presentation/views/manager/get_lab_test_cubit/get_lab_test_cubit.dart';
import 'package:healthmate/features/lap%20test/presentation/views/widgets/list_view_card_lab_test.dart';
import 'package:healthmate/features/lap%20test/presentation/views/widgets/list_view_lab_test_search.dart';

class LabTestBody extends StatefulWidget {
  const LabTestBody({super.key});

  @override
  State<LabTestBody> createState() => _LabTestBodyState();
}

class _LabTestBodyState extends State<LabTestBody> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    context.read<GetLabTestCubit>().getLabTest();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            // Header
            Positioned(
              top: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(header),
                ],
              ),
            ),

            LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 30, 
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
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
                            onChanged: (value) {
                              context
                                  .read<GetMedicalTestByNameCubit>()
                                  .getMedicalTestByName(
                                    query: searchController.text,
                                  );
                            },
                            controller: searchController,
                          ),
                          16.verticalSpace,
                          Row(
                            children: [
                              13.horizontalSpace,
                              Text(
                                'Book Lab Tests',
                                style:
                                    ResponsiveStylingSystem.textStyle20semibold(
                                        context),
                              ),
                            ],
                          ),
                          8.verticalSpace,
                          BlocConsumer<GetMedicalTestByNameCubit,
                              GetMedicalTestByNameState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              if (state is GetMedicalTestByNameLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: ColorSystem.kPrimaryColor,
                                  ),
                                );
                              } else if (state is GetMedicalTestByNameSuccess) {
                                return SizedBox(
                                  height: 400.h,
                                  child: ListViewLabTestSearch(
                                    medicalTestSearch: state.medicalTestSearch,
                                  ),
                                );
                              } else if (state is GetMedicalTestByNameError) {
                                return SizedBox(
                                  height: 400.h,
                                  child: Center(
                                    child: Text(
                                      '${state.errorMessage}',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              } else {
                                return SizedBox(
                                  height: 400.h,
                                  child: ListViewCardLabTest(),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
