import 'package:go_router/go_router.dart';
import 'package:healthmate/features/AI%20models/presentation/views/ai_model_screen.dart';
import 'package:healthmate/features/Auth/presentation/views/change_password_screen.dart';
import 'package:healthmate/features/Auth/presentation/views/forget_password_screen.dart';
import 'package:healthmate/features/Auth/presentation/views/sign_in_screen.dart';
import 'package:healthmate/features/Auth/presentation/views/sign_up_screen.dart';
import 'package:healthmate/features/Auth/presentation/views/verification_screen.dart';
import 'package:healthmate/features/diabates/presentation/views/diabates_screen.dart';
import 'package:healthmate/features/doctor/presentation/views/doctor_screen.dart';
import 'package:healthmate/features/heartdisease/presentation/views/heart_disease_screen.dart';
import 'package:healthmate/features/home/presentation/views/home_screen.dart';
import 'package:healthmate/features/lap%20test/presentation/views/lab_test_screen.dart';
import 'package:healthmate/features/search/presentation/views/search_screen.dart';
import 'package:healthmate/features/sechdule%20treatment/presentation/views/sechdule_screen.dart';
import 'package:healthmate/features/settings/presentation/views/setting_screen.dart';
import 'package:healthmate/features/splash/presentation/views/splash_init_screen.dart';
import 'package:healthmate/features/splash/presentation/views/splash_screen.dart';
import 'package:healthmate/features/splash/presentation/views/splash_screen_doctor.dart';

abstract class Routing {
  static const KsplashinitScreen = '/';
  static const KsplashScreen = '/splashscreen';
  static const Ksplashscreendoctor = '/splashscreendoctor';
  static const Ksplashscreenschedule = '/splashscreenschedule';
  static const Ksignin = '/ksignin';
  static const Ksignup = '/ksignup';
  static const kforgetpassword = '/kforgetpassword';
  static const kverificationemail = '/kverificationemail';
  static const kchangepassword = '/kchangepassowrd';
  static const khomescreen = '/khomescreen';
  static const ksearchscreen = '/ksearchscreen';
  static const kdoctorscreen = '/kdoctorscreen';
  static const kschedulescreen = '/kschedulescreen';
  static const klabtestscreen = '/klabtestscreen';
  static const kheartdiseasescreen = '/kheartdiseasescreen';
  static const kaimodels = '/kaimodels';
  static const ksetting = '/ksetting';
  static const kdiabates = '/kdiabates';
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
      GoRoute(
        path: Ksignup,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: kforgetpassword,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: kverificationemail,
        builder: (context, state) => const VerificationScreen(),
      ),
      GoRoute(
        path: kchangepassword,
        builder: (context, state) => const ChangePasswordScreen(),
      ),
      GoRoute(
        path: khomescreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: ksearchscreen,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: kdoctorscreen,
        builder: (context, state) => const DoctorScreen(),
      ),
      GoRoute(
        path: kschedulescreen,
        builder: (context, state) => const SechduleScreen(),
      ),
      GoRoute(
        path: klabtestscreen,
        builder: (context, state) => const LabTestScreen(),
      ),
      GoRoute(
        path: kaimodels,
        builder: (context, state) => const AiModels(),
      ),
      GoRoute(
        path: ksetting,
        builder: (context, state) => const SettingScreen(),
      ),
      GoRoute(
        path: kdiabates,
        builder: (context, state) => const DiabatesScreen(),
      ),
      GoRoute(
        path: kheartdiseasescreen,
        builder: (context, state) => const HeartDiseaseScreen(),
      ),
    ],
  );
}