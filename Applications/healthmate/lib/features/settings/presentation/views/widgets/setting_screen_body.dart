import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
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
          const CustomAppBar(title: 'Settings'),
          30.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'General',
                style: StylingSystem.textStyle20semibold,
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
            onTap: () {},
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
                style: StylingSystem.textStyle20semibold,
              ),
            ],
          ),
          16.verticalSpace,
          ListTielSetting(
            title: 'Lab Test',
            img: labtesticon,
            onTap: () {
              GoRouter.of(context).push(Routing.klabtestscreen);
            },
          ),
          16.verticalSpace,
          ListTielSetting(
            title: 'Emergency',
            img: emergencyicon,
            onTap: () {},
          ),
          16.verticalSpace,
          ListTielSetting(
            title: 'Logout',
            img: logouticon,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
