import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/shared_perfernce_singletone.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceSingleton.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        routerConfig: Routing.router,
        title: 'Health Mate',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
      ),
    );
  }
}
