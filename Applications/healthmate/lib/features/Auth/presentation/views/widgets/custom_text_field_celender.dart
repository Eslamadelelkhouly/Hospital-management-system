import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:intl/intl.dart';

class CustomTextFieldCelender extends StatefulWidget {
  const CustomTextFieldCelender(
      {super.key, this.onSaved, required this.controller});
  final String? Function(String?)? onSaved;
  final TextEditingController controller;
  @override
  State<CustomTextFieldCelender> createState() =>
      _CustomTextFieldCelenderState();
}

class _CustomTextFieldCelenderState extends State<CustomTextFieldCelender> {
  String initialValue = "Select your Birth Date";
  bool isDateSelected = false;
  late String birthDateInString = '';
  late DateTime birthDate = DateTime.now();
  TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date of Birth',
          style: StylingSystem.textStyle15bold,
        ),
        const SizedBox(
          height: 2,
        ),
        Container(
          width: 362,
          height: 70,
          child: TextFormField(
            onSaved: widget.onSaved,
            validator: (value) {
              if (value!.isEmpty || value == null) {
                return 'Please enter your Date of Birth';
              }
            },
            controller: text,
            cursorColor: ColorSystem.kPrimaryColor,
            decoration: InputDecoration(
              hintText: '07 November, 1986',
              hintStyle: StylingSystem.textStyle14Medium.copyWith(
                color: Colors.grey,
              ),
              prefixIcon: ImageIcon(AssetImage(celendericon)),
              suffixIcon: GestureDetector(
                onTap: () async {
                  final datePick = await showDatePicker(
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: ColorSystem.kPrimaryColor,
                          ),
                        ),
                        child: child!,
                      );
                    },
                    initialDate: new DateTime.now(),
                    context: context,
                    firstDate: new DateTime(1900),
                    lastDate: new DateTime(2100),
                  );
                  if (datePick != null && datePick != birthDate) {
                    setState(() {
                      birthDate = datePick;
                      isDateSelected = true;
                      birthDateInString =
                          DateFormat("dd MMMM , yyyy").format(birthDate);
                      text.text = birthDateInString;
                    });
                  }
                },
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: 24,
                ),
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
