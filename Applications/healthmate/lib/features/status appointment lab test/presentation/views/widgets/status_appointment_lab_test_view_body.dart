import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/container_title_list.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/list_view_cancel.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/list_view_card_upcoming.dart';
import 'package:healthmate/features/confirm%20appointment/presentation/views/widgets/list_view_completed.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_search_text_field.dart';

class StatusAppointmentLabTestViewBody extends StatefulWidget {
  const StatusAppointmentLabTestViewBody({super.key});

  @override
  State<StatusAppointmentLabTestViewBody> createState() => _StatusAppointmentLabTestViewBodyState();
}

class _StatusAppointmentLabTestViewBodyState extends State<StatusAppointmentLabTestViewBody> {
  List<String> listTitle = ['Upcoming', 'Completed', 'Canceled'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 50),
          const CustomAppBar(
            title: 'Confirm Appointment',
            stateicon: true,
          ),
          const SizedBox(height: 32),
          CustomSearchTextField(
            onTap: () {},
            controller: TextEditingController(),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 40,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemCount: listTitle.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final isSelected = index == selectedIndex;
                  final backgroundColor = isSelected
                      ? ColorSystem.kPrimaryColor
                      : ColorSystem.kPrimaryColorHighLight;
                  final textColor = isSelected ? Colors.white : Colors.black;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: ContainerTitleList(
                      text: listTitle[index],
                      backgrouncolor: backgroundColor,
                      textColor: textColor,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          if (selectedIndex == 0) const ListViewUpComing(),
          if (selectedIndex == 1) ListViewCompleted(),
          if (selectedIndex == 2) const ListViewCancel(),
        ],
      ),
    );
  }
}
