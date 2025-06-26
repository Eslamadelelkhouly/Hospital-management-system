import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/widgets/custom_button.dart';
import 'package:healthmate/features/Auth/presentation/views/widgets/custom_text_field.dart';
import 'package:healthmate/features/edit%20profile/presentation/views/circle_image_container.dart';
import 'package:healthmate/features/edit%20profile/presentation/views/drop_down_add_gender.dart';
import 'package:healthmate/features/heartdisease/presentation/views/widgets/custom_drop_down.dart';
import 'package:healthmate/features/personal/presentation/views/widgets/circule_perosnal_photo.dart';

class FormEditProfile extends StatelessWidget {
  const FormEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          children: [
            CircleImageContainer(
              onImagePicked: (image) {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            CustomTextField(
              text: 'Full name',
              iconField: usericon,
              hinttext: 'Mohamed Mahmoud',
              onSaved: (value) {},
              controller: TextEditingController(),
              texterror: '',
            ),
            CustomTextField(
              text: 'Mobile number',
              iconField: mobileicon,
              hinttext: '+20 1046985236',
              onSaved: (value) {},
              controller: TextEditingController(),
              texterror: '',
            ),
            CustomTextField(
              text: 'Address',
              iconField: locationicon,
              hinttext: 'Mansoura / Ahmed Maher Street',
              onSaved: (value) {},
              controller: TextEditingController(),
              texterror: '',
            ),
            DropDownAddGender(
              hinttext: 'Gender',
              dropdowntext1: 'Male',
              dropdowntext2: 'Female',
              text: 'female',
              texterror: '',
              controller: SingleValueDropDownController(),
            ),
            CustomButton(
              onPressed: () {},
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
