import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/class/color_style.dart';
import 'package:healthmate/core/class/router_screens.dart';

class SplashInitScreen extends StatefulWidget {
  const SplashInitScreen({super.key});

  @override
  State<SplashInitScreen> createState() => _SplashInitScreenState();
}

class _SplashInitScreenState extends State<SplashInitScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 30), () {
      GoRouter.of(context).pushReplacement(Routing.KsplashScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.kPrimaryColor,
    );
  }
}
