import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/lap%20test/presentation/data/models/lab_test_model.dart';
import 'package:healthmate/features/medical%20test%20information/data/model/medical_info_model.dart';
import 'package:healthmate/features/medical%20test%20information/presentation/manager/cubit/get_medical_info_cubit.dart';
import 'package:healthmate/features/medical%20test%20information/presentation/views/widgets/container_medical_info.dart';

class MedicalTestInofrmationBody extends StatefulWidget {
  const MedicalTestInofrmationBody({super.key, required this.id});
  final int id;

  @override
  State<MedicalTestInofrmationBody> createState() =>
      _MedicalTestInofrmationBodyState();
}

class _MedicalTestInofrmationBodyState
    extends State<MedicalTestInofrmationBody> {
  @override
  void initState() {
    super.initState();
    context
        .read<GetMedicalInfoCubit>()
        .getMedicalinfo(id: widget.id.toString());
    log('Medical test information id: ${widget.id.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    String errorMessage;
    MedicalInfoModel medicalInfoModel = MedicalInfoModel(
        data: MedicalInfoData(
          id: 0,
          testName: '',
          description: '',
          cost: '',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          schedule: {},
        ),
        message: '',
        status: 0);
    return Stack(
      children: [
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
        Positioned(
          right: 0,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(fotter),
            ],
          ),
        ),
        SizedBox(
          child: BlocConsumer<GetMedicalInfoCubit, GetMedicalInfoState>(
            listener: (context, state) {
              if (state is GetMedicalInfoFailure) {
                errorMessage = state.message['message'] ?? 'An error occurred';
                setState(() {});
                log('Error fetching medical test information: $errorMessage');
              }
              if (state is GetMedicalInfoSuccess) {
                medicalInfoModel = state.medicalInfo;
                log('Medical test information fetched successfully: ${medicalInfoModel.data.testName}');
              }
            },
            builder: (context, state) {
              return state is GetMedicalInfoLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07),
                        const CustomAppBar(
                          title: 'Medical test information',
                          stateicon: true,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        Image.asset(medicalinfo),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        ContainerMedicalInfo(
                          nameTest: medicalInfoModel.data.testName,
                          descrption: medicalInfoModel.data.description,
                          cost: medicalInfoModel.data.cost,
                        ),
                      ],
                    );
            },
          ),
        ),
      ],
    );
  }
}
