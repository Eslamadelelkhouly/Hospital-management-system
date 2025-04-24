import 'package:flutter/material.dart';
import 'package:healthmate/core/utils/color_style.dart';

class CustomTextFieldMessage extends StatelessWidget {
  const CustomTextFieldMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Ask any question...',
          hintStyle: TextStyle(color: Color(0xff83818E)),
          filled: true,
          fillColor: ColorSystem.kPrimaryColorHighLight,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.grey,
        maxLines: null,
        keyboardType: TextInputType.multiline,
      ),
    );
  }
}
