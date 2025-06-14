import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/helper_function/convert_model_doctor_to_dropdown.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/choose%20Data%20and%20time%20medical%20test/data/models/available_appointment_medical_test_model.dart';
import 'package:healthmate/features/choose%20Data%20and%20time%20medical%20test/presentation/manager/cubit/avaliable_time_medical_test_cubit.dart';
import 'package:healthmate/features/choose%20Data%20and%20time%20medical%20test/presentation/views/widgets/custom_drop_down_doctor.dart';
import 'package:healthmate/features/medical%20test%20information/presentation/manager/cubit/get_medical_info_cubit.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';
import 'package:healthmate/features/search/manager/cubit/show_doctor_cubit.dart';
import 'package:healthmate/features/sechdule%20treatment/presentation/views/widgets/container_time.dart';
import 'package:healthmate/features/sechdule%20treatment/presentation/views/widgets/custom_celender.dart';

class ChooseDataTimeMedicalTestViewBody extends StatefulWidget {
  const ChooseDataTimeMedicalTestViewBody({super.key, required this.id});
  final String id;

  @override
  State<ChooseDataTimeMedicalTestViewBody> createState() =>
      _ChooseDataTimeMedicalTestViewBodyState();
}

class _ChooseDataTimeMedicalTestViewBodyState
    extends State<ChooseDataTimeMedicalTestViewBody> {
  String data = '';
  late SingleValueDropDownController controllerdropdown;
  List<DropDownValueModel> itemsdropdown = [
    DropDownValueModel(name: 'Item 1', value: '1'),
    DropDownValueModel(name: 'Item 2', value: '2'),
    DropDownValueModel(name: 'Item 3', value: '3'),
  ];
  int selectedIndex = -1;
  DoctorsResponse doctorsResponse = DoctorsResponse(
    doctors: [],
    message: 'message',
    status: 1,
  );
  Map<String, dynamic> errorMessageAvalibletime = {};
  AvailableAppointmentsMedicalTest availableAppointmentsMedicalTest =
      AvailableAppointmentsMedicalTest(
    availableAppointments: [],
    date: '',
    message: '',
    status: 0,
  );

  @override
  void initState() {
    super.initState();
    context.read<ShowDoctorCubit>().getDoctors();
    controllerdropdown = SingleValueDropDownController();
    context.read<AvaliableTimeMedicalTestCubit>().getavalibleTimeMedicalTest(
        medicalTestId: widget.id, date: DateTime.now().toString());
  }

  @override
  void dispose() {
    controllerdropdown.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                  context
                      .read<GetMedicalInfoCubit>()
                      .getMedicalinfo(id: widget.id);
                },
                icon: const Icon(Icons.arrow_back_ios, size: 24),
              ),
              const Spacer(),
              Text(
                'Choose Date and Time',
                style: StylingSystem.textStyle24bold,
              ),
              const Spacer(),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          CustomCelender(
            onChanged: (value) {
              setState(() {
                data = value;
              });
              context
                  .read<AvaliableTimeMedicalTestCubit>()
                  .getavalibleTimeMedicalTest(
                      medicalTestId: widget.id, date: data);
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.08),
              Text('Available Time', style: StylingSystem.textStyle20semibold),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          BlocConsumer<AvaliableTimeMedicalTestCubit,
              AvaliableTimeMedicalTestState>(
            listener: (context, state) {
              if (state is AvaliableTimeMedicalTestSucess) {
                availableAppointmentsMedicalTest =
                    state.availableAppointmentsMedicalTest;
              } else if (state is AvaliableTimeMedicalTestError) {
                errorMessageAvalibletime = state.message;
              }
            },
            builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.10,
                child: state is AvaliableTimeMedicalTestSucess
                    ? GridView.builder(
                        itemCount: availableAppointmentsMedicalTest
                            .availableAppointments.length,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 3.0,
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: ContainerTime(
                              isSelected: index == selectedIndex,
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              time: availableAppointmentsMedicalTest
                                  .availableAppointments[index],
                            ),
                          );
                        },
                      )
                    : state is AvaliableTimeMedicalTestError
                        ? Center(
                            child: Text(
                              errorMessageAvalibletime['message'] ??
                                  'Error occurred',
                              style: StylingSystem.textStyle14Medium.copyWith(
                                color: Colors.red,
                              ),
                            ),
                          )
                        : const Center(child: CircularProgressIndicator()),
              );
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          BlocConsumer<ShowDoctorCubit, ShowDoctorState>(
            listener: (context, state) {
              if (state is ShowDoctorSuccess) {
                doctorsResponse = state.doctorsResponseModel;
                itemsdropdown =
                    convertDoctorsToDropdown(doctorsResponse.doctors);
              }
            },
            builder: (context, state) {
              return CustomDropDownDoctor(
                hinttext: 'Select Doctor',
                texterror: '',
                controller: controllerdropdown,
                dropDownList: itemsdropdown,
              );
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          CustomButton(
            onPressed: () {},
            text: 'Make Appointment',
            width: MediaQuery.of(context).size.width * 0.8,
            height: 45,
            textColor: Colors.white,
            backgrounColor: ColorSystem.kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
