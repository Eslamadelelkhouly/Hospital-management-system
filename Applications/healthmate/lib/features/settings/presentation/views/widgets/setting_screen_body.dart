import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/shared_perfernce_singletone.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/Auth/manager/login_cubit/login_cubit_cubit.dart';
import 'package:healthmate/features/lap%20test/presentation/views/widgets/list_view_card_lab_test.dart';
import 'package:healthmate/features/settings/presentation/manager/Logout%20cubit/logout_cubit.dart';
import 'package:healthmate/features/settings/presentation/views/widgets/list_tiel_notification.dart';
import 'package:healthmate/features/settings/presentation/views/widgets/list_tiel_setting.dart';

class SettingScreenBody extends StatelessWidget {
  const SettingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          30.verticalSpace,
          const CustomAppBar(
            title: 'Settings',
            stateicon: true,
          ),
          30.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'General',
                style: ResponsiveStylingSystem.textStyle20semibold(context),
              ),
            ],
          ),
          16.verticalSpace,
          ListTielSetting(
            title: 'Edit info',
            img: usericon,
            onTap: () {},
          ),
          16.verticalSpace,
          ListTielSetting(
            title: 'My Appointments',
            img: celendericoncheck,
            onTap: () {
              GoRouter.of(context).push(Routing.kconfirmappointment);
            },
          ),
          16.verticalSpace,
          ListTielSetting(
            title: 'Payment',
            img: cardadd,
            onTap: () {},
          ),
          16.verticalSpace,
          const ListTielNotification(),
          24.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Others',
                style: ResponsiveStylingSystem.textStyle20semibold(context),
              ),
            ],
          ),
          16.verticalSpace,
          ListTielSetting(
            title: 'Lab Test',
            img: labtesticon,
            onTap: () {
              GoRouter.of(context).push(Routing.kconfirmlabtest);
            },
          ),
          16.verticalSpace,
          ListTielSetting(
            title: 'Emergency',
            img: emergencyicon,
            onTap: () {
              GoRouter.of(context).push(Routing.kemergency);
            },
          ),
          16.verticalSpace,
          ListTielSetting(
            title: 'Logout',
            img: logouticon,
            onTap: () {
              context.read<LogoutCubit>().logOut();
              SharedPreferenceSingleton.delete(token);
              GoRouter.of(context).push(Routing.KsplashinitScreen);
            },
          ),
        ],
      ),
    );
  }
}
