import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/features/search/manager/Show%20Doctor%20Cubit/show_doctor_cubit.dart';
import 'package:healthmate/features/sechdule%20treatment/data/manager/show_avliable_time/showavailabletime_cubit.dart';
import 'package:healthmate/features/sechdule%20treatment/data/models/booking_avaliabale_model.dart';
import 'package:healthmate/features/sechdule%20treatment/presentation/views/widgets/container_time.dart';

class RowContainerTime extends StatefulWidget {
  const RowContainerTime({super.key, required this.onChanged});
  final ValueChanged<String> onChanged;

  @override
  State<RowContainerTime> createState() => _RowContainerTimeState();
}

class _RowContainerTimeState extends State<RowContainerTime> {
  int? selectedIndex;
  late BookingAvaliabalTimeeModel bookingAvaliabalTimeeModel =
      BookingAvaliabalTimeeModel(
    availableAppointments: [],
    date: '',
    message: '',
    status: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      child: BlocConsumer<ShowavailabletimeCubit, ShowavailabletimeState>(
        listener: (context, state) {
          if (state is showavailabletimeSucess) {
            bookingAvaliabalTimeeModel = state.bookingAvaliabalTimeeModel;
          }
        },
        builder: (context, state) {
          return state is showavailabletimeSucess
              ? ListView.builder(
                  itemCount:
                      bookingAvaliabalTimeeModel.availableAppointments.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: ContainerTime(
                        time: bookingAvaliabalTimeeModel
                            .availableAppointments[index],
                        isSelected: selectedIndex == index,
                        onTap: () {
                          setState(() {
                            if (selectedIndex == index) {
                              selectedIndex = null;
                            } else {
                              selectedIndex = index;
                              setState(() {
                                widget.onChanged(bookingAvaliabalTimeeModel
                                    .availableAppointments[index]);
                              });
                            }
                          });
                        },
                      ),
                    );
                  },
                )
              : state is showavailabletimeError
                  ? Center(
                      child: Text(
                        state.error['message'],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                    )
                  : const Center(child: SizedBox());
        },
      ),
    );
  }
}
