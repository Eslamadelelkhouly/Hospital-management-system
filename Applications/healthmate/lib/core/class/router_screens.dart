import 'package:go_router/go_router.dart';
import 'package:healthmate/features/splash/presentation/splash_init_screen.dart';
import 'package:healthmate/features/splash/presentation/splash_screen.dart';

abstract class Routing {
  static const KsplashinitScreen = '/';
  static const KsplashScreen = '/splashscreen';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: KsplashinitScreen,
        builder: (context, state) => const SplashInitScreen(),
      ),
      GoRoute(
        path: KsplashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
    ],
  );
}