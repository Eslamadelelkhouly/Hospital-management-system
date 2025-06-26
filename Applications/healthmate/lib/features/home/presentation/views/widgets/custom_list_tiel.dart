import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/Auth/presentation/views/change_password_bloc_consumer.dart';
import 'package:healthmate/features/home/presentation/views/widgets/custom_sub_title_list_tiel.dart';
import 'package:healthmate/features/personal/data/models/personal_info_model.dart';
import 'package:healthmate/features/personal/presentation/manager/get_presonal_info_cubit/getpersonalinfo_cubit.dart';

class CustomListTiel extends StatefulWidget {
  const CustomListTiel({super.key});

  @override
  State<CustomListTiel> createState() => _CustomListTielState();
}

class _CustomListTielState extends State<CustomListTiel> {
  PersonalInfoModel personalInfoModel = PersonalInfoModel(
    patient: Patient(
      id: 0,
      fullName: '',
      email: '',
      dateOfBirth: '',
      createdAt: '',
      updatedAt: '',
    ),
    message: '',
    status: 0,
  );

  @override
  void initState() {
    super.initState();
    context.read<GetpersonalinfoCubit>().getPersonalInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetpersonalinfoCubit, GetpersonalinfoState>(
      listener: (context, state) {
        if (state is GetpersonalinfoSuccess) {
          setState(() {
            personalInfoModel = state.personalInfoModel;
          });
        }
      },
      builder: (context, state) {
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          subtitle: Row(
            children: [
              Text(
                'Good Morning',
                style:
                    ResponsiveStylingSystem.textStyle14Medium(context).copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Image.asset(sun),
            ],
          ),
          leading: SizedBox(
            width: 48,
            height: 48,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                personalInfoModel.patient.image?.imageName.isNotEmpty == true
                    ? personalInfoModel.patient.image!.imageName
                    : 'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
              ),
            ),
          ),
          title: Text(
            personalInfoModel.patient.fullName,
            style: ResponsiveStylingSystem.textStyle18semibold(context),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(notificationicon),
              color: ColorSystem.kPrimaryColor,
            ),
          ),
        );
      },
    );
  }
}
