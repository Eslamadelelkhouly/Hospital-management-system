import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomPasswordTextField extends StatefulWidget {
  CustomPasswordTextField(
      {super.key,
      required this.text,
      this.onSaved,
      required this.controller,
      required this.texterror});

  bool eyepassword = true;
  final String text;
  final String? Function(String?)? onSaved;
  final TextEditingController controller;
  final String texterror;

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
          width: MediaQuery.of(context).size.width * 0.9,
          height: 70,
          child: TextFormField(
            controller: widget.controller,
            validator: (value) {
              if (value!.isEmpty || value == null) {
                return 'Please enter your Password';
              }
            },
            onSaved: widget.onSaved,
            obscuringCharacter: '*',
            cursorColor: ColorSystem.kPrimaryColor,
            obscureText: widget.eyepassword,
            decoration: InputDecoration(
              hintText: '**************',
              hintStyle: StylingSystem.textStyle14Medium.copyWith(
                color: Colors.grey,
              ),
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
        Text(
          widget.texterror,
          style: StylingSystem.textStyleSign12.copyWith(
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
