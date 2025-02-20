import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomPasswordTextField extends StatefulWidget {
  CustomPasswordTextField({super.key});

  bool eyepassword = true;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: StylingSystem.textStyle15bold,
        ),
        const SizedBox(
          height: 2,
        ),
        Container(
          width: 362,
          height: 48,
          child: TextField(
            obscureText: widget.eyepassword,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    if (widget.eyepassword) {
                      setState(() {
                        widget.eyepassword = false;
                      });
                    } else {
                      setState(() {
                        widget.eyepassword = true;
                      });
                    }
                  },
                  icon: const Icon(Icons.visibility_off)),
              prefixIcon: const ImageIcon(
                AssetImage(lockicon),
              ),
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
