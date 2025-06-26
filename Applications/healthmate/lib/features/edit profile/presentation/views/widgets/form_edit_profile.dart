import 'dart:developer';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_text_field.dart';
import 'package:healthmate/features/edit%20profile/presentation/manager/edit%20profile%20cubit/edit_profile_cubit.dart';
import 'package:healthmate/features/edit%20profile/presentation/views/widgets/circle_image_container.dart';
import 'package:healthmate/features/edit%20profile/presentation/views/widgets/drop_down_add_gender.dart';
import 'package:image_picker/image_picker.dart';

class FormEditProfile extends StatefulWidget {
  const FormEditProfile({super.key, required this.id});
  final String id;

  @override
  State<FormEditProfile> createState() => _FormEditProfileState();
}

class _FormEditProfileState extends State<FormEditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController controllername;
  late TextEditingController controlleraddress;
  late TextEditingController controllerphoneNumber;
  late SingleValueDropDownController controllergender;

  XFile imageuplode = XFile('');
  String name = '';
  String address = '';
  String gender = '';
  String phoneNumber = '';

  @override
  void initState() {
    super.initState();
    controllername = TextEditingController();
    controlleraddress = TextEditingController();
    controllerphoneNumber = TextEditingController();
    controllergender = SingleValueDropDownController();
  }

  @override
  void dispose() {
    controllername.dispose();
    controlleraddress.dispose();
    controllerphoneNumber.dispose();
    controllergender.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CircleImageContainer(
              onImagePicked: (image) {
                setState(() {
                  imageuplode = image;
                });
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            CustomTextField(
              text: 'Full name',
              iconField: usericon,
              hinttext: 'Mohamed Mahmoud',
              onSaved: (value) => name = value!,
              controller: controllername,
              texterror: '',
            ),
            CustomTextField(
              text: 'Mobile number',
              iconField: mobileicon,
              hinttext: '+20 1046985236',
              onSaved: (value) => phoneNumber = value!,
              controller: controllerphoneNumber,
              texterror: '',
            ),
            CustomTextField(
              text: 'Address',
              iconField: locationicon,
              hinttext: 'Mansoura / Ahmed Maher Street',
              onSaved: (value) => address = value!,
              controller: controlleraddress,
              texterror: '',
            ),
            DropDownAddGender(
              hinttext: 'Gender',
              dropdowntext1: 'Male',
              dropdowntext2: 'Female',
              text: 'female',
              texterror: '',
              controller: controllergender,
            ),
            CustomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save(); // مهم جداً لتفعيل onSaved

                  log(imageuplode.path);
                  log(name);
                  log(address);
                  log(controllergender.dropDownValue?.value ?? 'no gender');
                  log(phoneNumber);

                  context.read<EditProfileCubit>().EditProfile(
                        name: name,
                        address: address,
                        gender: controllergender.dropDownValue?.value ?? '',
                        phoneNumber: phoneNumber,
                        image: imageuplode,
                        id: widget.id,
                      );
                }
              },
              text: 'Save',
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              textColor: Colors.white,
              backgrounColor: ColorSystem.kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
