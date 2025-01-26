import 'package:flutter/material.dart';
import 'package:healthmate/core/class/router_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routing.router,
      title: 'Health Mate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
    );
  }
}
