import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class ContainerDoctor extends StatefulWidget {
  final double rating;
  final String doctorName;
  final String specialty;

  const ContainerDoctor({
    super.key,
    required this.rating,
    this.doctorName = 'Dr. Ali Hassan',
    this.specialty = 'Dermato-Endocrinology',
  });

  @override
  State<ContainerDoctor> createState() => _ContainerDoctorState();
}

class _ContainerDoctorState extends State<ContainerDoctor> {
  bool isFavorite = false;

  final int maxRating = 5;

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
                  widget.doctorName,
                  style: StylingSystem.textStyle16Medium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  widget.specialty,
                  style: StylingSystem.textStyleSign12,
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: 80),
                  for (int i = 1; i <= maxRating; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Image.asset(
                        i <= widget.rating ? stargoldicon : staricon,
                        width: 24,
                        height: 24,
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
                  child: Image.asset(
                      isFavorite == true ? hearticonred : hearticon),
                  onTap: () {
                    if (isFavorite) {
                      // Remove from favorites
                      isFavorite = false;
                      setState(() {});
                    } else {
                      // Add to favorites
                      isFavorite = true;
                      setState(() {});
                    }
                  },
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
