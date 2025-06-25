import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomTextFieldCelender extends StatefulWidget {
  const CustomTextFieldCelender({
    super.key,
    required this.onDateSelected,
    required this.controller,
    required this.texterror,
  });
  final Function(DateTime) onDateSelected; // Callback for date selection
  final TextEditingController controller;
  final String texterror;

  @override
  State<CustomTextFieldCelender> createState() =>
      _CustomTextFieldCelenderState();
}

class _CustomTextFieldCelenderState extends State<CustomTextFieldCelender> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date of Birth',
          style: ResponsiveStylingSystem.textStyle14bold(context),
        ),
        const SizedBox(
          height: 2,
        ),
        Container(
          width: 350,
          height: 70,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty || value == null) {
                return 'Please enter your Date of Birth';
              }
            },
            controller: widget.controller,
            cursorColor: ColorSystem.kPrimaryColor,
            readOnly: true, // Make the field read-only
            decoration: InputDecoration(
              hintText: '07 November, 1986',
              hintStyle: ResponsiveStylingSystem.textStyle14Medium(context).copyWith(
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
                    initialDate: DateTime.now(),
                    context: context,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
                  if (datePick != null) {
                    widget.onDateSelected(
                        datePick); // Notify parent of date selection
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
        Text(
          widget.texterror,
          style: ResponsiveStylingSystem.textStyleSign12(context).copyWith(
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
