import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class ContainerDoctor extends StatefulWidget {
  const ContainerDoctor({super.key});

  @override
  State<ContainerDoctor> createState() => _ContainerDoctorState();
}

class _ContainerDoctorState extends State<ContainerDoctor> {
  bool heartlogic = false;
  int rating = 0; // Default rating
  final int maxRating = 5; // Maximum number of stars

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 114,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorSystem.kPrimaryColorHighLight,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(doctorphoto1),
                ),
                title: Text(
                  'Dr.Ali hassan',
                  style: StylingSystem.textStyle16Medium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  'Dermato-Endocrinology',
                  style: StylingSystem.textStyleSign12,
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: 80),
                  for (int i = 1; i <= maxRating; i++)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          rating = i; // Update rating based on selected star
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Image.asset(
                          i <= rating
                              ? stargoldicon
                              : staricon, // Change image based on rating
                          width: 24, // Set appropriate size
                          height: 24,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
          Positioned(
            right: 20,
            top: 15,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      heartlogic = !heartlogic;
                    });
                  },
                  child: Image.asset(heartlogic ? hearticonred : hearticon),
                ),
                const SizedBox(width: 6),
                Image.asset(infoicon),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
