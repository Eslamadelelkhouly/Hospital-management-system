import 'package:go_router/go_router.dart';
import 'package:healthmate/features/Auth/sign_in.dart';
import 'package:healthmate/features/splash/presentation/splash_init_screen.dart';
import 'package:healthmate/features/splash/presentation/splash_screen.dart';
import 'package:healthmate/features/splash/presentation/splash_screen_doctor.dart';

abstract class Routing {
  static const KsplashinitScreen = '/';
  static const KsplashScreen = '/splashscreen';
  static const Ksplashscreendoctor = '/splashscreendoctor';
  static const Ksplashscreenschedule = '/splashscreenschedule';
  static const Ksignin = '/ksignin';
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
      GoRoute(
        path: Ksplashscreendoctor,
        builder: (context, state) => const SplashScreenDoctor(),
      ),
      GoRoute(
        path: Ksignin,
        builder: (context, state) => const SignIn(),
      ),
    ],
  );
}
