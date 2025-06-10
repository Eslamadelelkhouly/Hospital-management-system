import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/features/lap%20test/presentation/views/manager/cubit/get_lab_test_cubit.dart';
import 'package:healthmate/features/lap%20test/presentation/views/widgets/lab_test_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LabTestBodyBlocConsumer extends StatelessWidget {
  const LabTestBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetLabTestCubit, GetLabTestState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is GetLabTestLoading,
          child: LabTestBody(),
        );
      },
    );
  }
}
