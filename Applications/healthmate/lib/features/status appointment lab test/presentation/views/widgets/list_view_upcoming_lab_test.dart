import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/data/models/medical_test_state.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/presentation/manager/upcoming_medical_test_cubit/upcoming_medical_test_cubit.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/presentation/views/widgets/card_confirm_lab_test.dart';

class ListViewUpcomingLabTest extends StatefulWidget {
  const ListViewUpcomingLabTest({super.key});

  @override
  State<ListViewUpcomingLabTest> createState() =>
      _ListViewUpcomingLabTestState();
}

class _ListViewUpcomingLabTestState extends State<ListViewUpcomingLabTest> {
  MedicalTestState medicalTestState = MedicalTestState(
    appointmentDetails: [],
    message: '',
    status: 0,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UpcomingMedicalTestCubit>().getUpcomingMedicalTest();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpcomingMedicalTestCubit, UpcomingMedicalTestState>(
      listener: (context, state) {
        if (state is UpcomingMedicalTestSuccess) {
          medicalTestState = state.medicalTestState;
        }
      },
      builder: (context, state) {
        Widget content;
        if (state is UpcomingMedicalTestLoading) {
          return content = const Center(
            child: CircularProgressIndicator(
              color: ColorSystem.kPrimaryColor,
            ),
          );
        } else if (state is UpcomingMedicalTestSuccess) {
          return content = Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 32),
              padding: const EdgeInsets.all(0),
              itemCount: state.medicalTestState.appointmentDetails.length,
              itemBuilder: (context, index) => CardConfirmLabTest(
                statebutton: true,
                appointmentDetail:
                    state.medicalTestState.appointmentDetails[index],
              ),
            ),
          );
        } else if (state is UpcomingMedicalTestError) {
          return content = Center(
            child: Text(
              state.errorMessage,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else {
          return content = Container();
        }
      },
    );
  }
}
