import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/shared_perfernce_singletone.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceSingleton.init();
  runApp(const HealthMate());
}

class HealthMate extends StatelessWidget {
  const HealthMate({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        routerConfig: Routing.router,
        showPerformanceOverlay: true,
        title: 'Health Mate',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
      ),
    );
  }
}
