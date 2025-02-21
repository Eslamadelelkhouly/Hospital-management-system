import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';

class CustomOtp extends StatefulWidget {
  const CustomOtp({super.key});

  @override
  State<CustomOtp> createState() => _CustomOtpState();
}

class _CustomOtpState extends State<CustomOtp> {
  Color backgroundColor = Colors.white;
  Color textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 47,
      height: 50,
      child: TextFormField(
        cursorColor: Colors.black,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, color: textColor), // Dynamic text color
        onChanged: (value) {
          setState(() {
            if (value.isNotEmpty) {
              backgroundColor = ColorSystem.kPrimaryColor;
              textColor =
                  Colors.white; // Change text color to contrast background
            } else {
              backgroundColor = Colors.white;
              textColor = Colors.black; // Reset text color when empty
            }
          });
        },
        decoration: InputDecoration(
          fillColor: backgroundColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          hintText: '0',
          hintStyle: const TextStyle(
            fontSize: 20,
            color: Colors.grey, // Hint text color
          ),
        ),
      ),
    );
  }
}
