import 'package:flutter/material.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_otp.dart';

class RowOtp extends StatefulWidget {
  const RowOtp({super.key, required this.onOtpSaved});

  final Function(String) onOtpSaved;

  @override
  State<RowOtp> createState() => RowOtpState();
}

class RowOtpState extends State<RowOtp> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _otpValues = List.filled(6, '');

  void saveForm() {
    _formKey.currentState?.save();
    final otp = _otpValues.join();
    widget.onOtpSaved(otp); // رجّع الكود لـ Form
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(6, (index) {
          return CustomOtp(
            onSaved: (value) {
              _otpValues[index] = value ?? '';
            },
          );
        }),
      ),
    );
  }
}
