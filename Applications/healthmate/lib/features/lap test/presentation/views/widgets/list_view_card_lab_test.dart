import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/features/lap%20test/presentation/data/models/lab_test_model.dart';
import 'package:healthmate/features/lap%20test/presentation/views/manager/cubit/get_lab_test_cubit.dart';
import 'package:healthmate/features/lap%20test/presentation/views/widgets/custom_list_tiel_lab_test.dart';

class ListViewCardLabTest extends StatefulWidget {
  const ListViewCardLabTest({super.key});

  @override
  State<ListViewCardLabTest> createState() => _ListViewCardLabTestState();
}

class _ListViewCardLabTestState extends State<ListViewCardLabTest> {
  MedicalTestsResponse medicalTestsResponse = MedicalTestsResponse(
    data: [],
    message: '',
    status: 0,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400.r,
      child: BlocConsumer<GetLabTestCubit, GetLabTestState>(
        listener: (context, state) {
          if (state is GetLabTestSucess) {
            medicalTestsResponse = state.medicalTestsResponse;
            setState(() {});
          }
        },
        builder: (context, state) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: medicalTestsResponse.data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    Routing.kmedicaltestinformation,
                    extra: medicalTestsResponse.data[index].id,
                  );
                },
                child: CustomListTielLabTest(
                  text: medicalTestsResponse.data[index].testName,
                  price: medicalTestsResponse.data[index].cost,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
