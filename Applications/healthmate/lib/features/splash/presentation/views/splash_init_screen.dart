import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';

class SplashInitScreen extends StatefulWidget {
  const SplashInitScreen({super.key});

  @override
  State<SplashInitScreen> createState() => _SplashInitScreenState();
}

class _SplashInitScreenState extends State<SplashInitScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 50), () async {
      await GoRouter.of(context).pushReplacement(Routing.KsplashScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorSystem.kPrimaryColor,
    );
  }
}
