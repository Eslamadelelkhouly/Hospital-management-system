import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthmate/core/class/color_style.dart';
import 'package:healthmate/core/class/style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: StylingSystem.textStyleSign,
        ),
        const SizedBox(
          height: 2,
        ),
        Container(
          width: 362,
          height: 48,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(FontAwesomeIcons.envelope),
              filled: true,
              fillColor: ColorSystem.kbtnColorblue,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorSystem.kbtnColorblue),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ColorSystem.kbtnColorblue),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorSystem.kbtnColorblue,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
