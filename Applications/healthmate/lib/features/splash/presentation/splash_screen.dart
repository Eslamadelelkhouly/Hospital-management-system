import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/shared_perfernce_singletone.dart';
import 'package:healthmate/features/splash/presentation/widgets/splash_screen_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer = Timer(const Duration(seconds: 2), () async {
        if (mounted) {
          bool statescreen =
              SharedPreferenceSingleton.getBool(Ksplashscreendoctor);
          if (statescreen == false) {
            await GoRouter.of(context)
                .pushReplacement(Routing.Ksplashscreendoctor);
          } else {
            await GoRouter.of(context).pushReplacement(Routing.Ksignin);
          }
        }
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer to prevent memory leaks.
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.kPrimaryColor,
      body: const SplashScreenBody(),
    );
  }
}
