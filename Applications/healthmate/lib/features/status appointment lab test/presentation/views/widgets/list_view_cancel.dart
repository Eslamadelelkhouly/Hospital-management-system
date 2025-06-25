import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/presentation/manager/get_cancel_medical_test/get_cancel_medical_test_cubit.dart';
import 'package:healthmate/features/status%20appointment%20lab%20test/presentation/views/widgets/card_confirm_lab_test.dart';

class ListViewCancelMedicalTest extends StatefulWidget {
  const ListViewCancelMedicalTest({super.key});

  @override
  State<ListViewCancelMedicalTest> createState() =>
      _ListViewCancelMedicalTestState();
}

class _ListViewCancelMedicalTestState extends State<ListViewCancelMedicalTest> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetCancelMedicalTestCubit>().getCancelMedicalTest();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<GetCancelMedicalTestCubit, GetCancelMedicalTestState>(
        listener: (context, state) {},
        builder: (context, state) {
          Widget content;
          if (state is GetCancelMedicalTestLoading) {
            return content = const Center(
              child: CircularProgressIndicator(
                color: ColorSystem.kPrimaryColor,
              ),
            );
          } else if (state is GetCancelMedicalTestError) {
            return content = Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (state is GetCancelMedicalTestSuccess) {
            return content = ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 32),
              padding: const EdgeInsets.all(0),
              itemCount: state.medicalTestState.appointmentDetails.length,
              itemBuilder: (context, index) => CardConfirmLabTest(
                titleCard: 'Cancelled',
                statebutton: false,
                appointmentDetail:
                    state.medicalTestState.appointmentDetails[index],
              ),
            );
          } else {
            return content = const Center(
                child: Text(
              'No cancelled appointments found.',
              style: const TextStyle(color: Colors.red),
            ));
          }
        },
      ),
    );
  }
}
