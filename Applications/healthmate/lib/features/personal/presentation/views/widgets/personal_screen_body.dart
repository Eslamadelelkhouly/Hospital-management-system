import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/personal/data/models/personal_info_model.dart';
import 'package:healthmate/features/personal/presentation/manager/get_presonal_info_cubit/getpersonalinfo_cubit.dart';
import 'package:healthmate/features/personal/presentation/views/widgets/circule_perosnal_photo.dart';
import 'package:healthmate/features/personal/presentation/views/widgets/custom_app_bar_settings.dart';
import 'package:healthmate/features/personal/presentation/views/widgets/personal_field.dart';
import 'package:healthmate/features/personal/presentation/views/widgets/row_container_info_personal.dart';

class PersonalScreenBody extends StatefulWidget {
  const PersonalScreenBody({
    super.key,
  });

  @override
  State<PersonalScreenBody> createState() => _PersonalScreenBodyState();
}

class _PersonalScreenBodyState extends State<PersonalScreenBody> {
  late PersonalInfoModel personalInfoModel = PersonalInfoModel(
    id: 0,
    email: '',
    fullName: '',
    phoneNumber: '',
    dateOfBirth: '',
    deletedAt: '',
    address: '',
    gender: '',
    createdAt: '',
    updatedAt: '',
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetpersonalinfoCubit>().getPersonalInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15).r,
        child: BlocConsumer<GetpersonalinfoCubit, GetpersonalinfoState>(
          listener: (context, state) {
            if (state is GetpersonalinfoSuccess) {
              personalInfoModel = state.personalInfoModel;
              setState(() {});
            } else if (state is GetpersonalinfoError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.erorMessage['message']),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                30.verticalSpace,
                AppBarSetting(),
                30.verticalSpace,
                CirculePersonalPhoto(),
                16.verticalSpace,
                Text(
                  personalInfoModel.fullName.isNotEmpty
                      ? personalInfoModel.fullName
                      : 'Mohamed Ahmed',
                  style: ResponsiveStylingSystem.textStyle18semibold(context),
                ),
                Text(
                  'Active since - Jan 2025',
                  style: ResponsiveStylingSystem.textStyle14Medium(context).copyWith(
                    color: ColorSystem.kGrayColor2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                24.verticalSpace,
                RowContainerInfoPersonal(),
                16.verticalSpace,
                Row(
                  children: [
                    Text(
                      'Personal Information',
                      style:ResponsiveStylingSystem.textStyle20semibold(context),
                    ),
                  ],
                ),
                8.verticalSpace,
                PersonalField(
                  imgUrl: smsicon,
                  label: 'Email',
                  input: personalInfoModel.email.isNotEmpty
                      ? personalInfoModel.email
                      : 'don\'t have any email',
                ),
                16.verticalSpace,
                PersonalField(
                  imgUrl: mobileicon,
                  label: 'Phone Number',
                  input:
                      personalInfoModel.phoneNumber ?? 'don\'t have any phone',
                ),
                16.verticalSpace,
                PersonalField(
                  imgUrl: celendericon,
                  label: 'Date Of Birth',
                  input: personalInfoModel.dateOfBirth.isNotEmpty
                      ? personalInfoModel.dateOfBirth
                      : 'don\'t have any date',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
