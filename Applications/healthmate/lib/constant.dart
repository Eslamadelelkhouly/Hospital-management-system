const logo = 'assets/images/logo.png';
const logo2 = 'assets/images/logo2.png';
const lockicon = 'assets/images/lock.png';
const smsicon = 'assets/images/sms.png';
const googleicon = 'assets/images/google.png';
const facebookicon = 'assets/images/facebook.png';
const usericon = 'assets/images/user.png';
const celendericon = 'assets/images/calendar.png';
const callicon = 'assets/images/call.png';
const fotter = 'assets/images/fotter.png';
const header = 'assets/images/header.png';
const Ksplashscreendoctor = 'onboardingscreen';
const googleicon2 = 'assets/images/googleicon2.png';
const appleicon2 = 'assets/images/appleicon2.png';

class onBoarding {
  final String title;
  final String description;
  final String images;

  onBoarding({
    required this.title,
    required this.description,
    required this.images,
  });
}

class OnBoardingData {
  List<onBoarding> onBoardingData = [
    onBoarding(
      title: 'Choose your Doctor',
      description:
          'Lorem ipsum dolor sit amet consectetur. Morbi risus non non aliquam amet aliquet.',
      images: 'assets/images/p1.png',
    ),
    onBoarding(
      title: 'Schedule your Appoinmrnt',
      description:
          'Lorem ipsum dolor sit amet consectetur. Morbi risus non non aliquam amet aliquet.',
      images: 'assets/images/p2.png',
    ),
    onBoarding(
      title: '',
      description:
          'Lorem ipsum dolor sit amet consectetur. Morbi risus non non aliquam amet aliquet.',
      images: 'assets/images/p3.png',
    ),
  ];
}
