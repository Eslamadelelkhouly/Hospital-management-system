const logo = 'lib/core/assets/images/logo.png';
const logo2 = 'lib/core/assets/images/logo2.png';
const lockicon = 'lib/core/assets/images/lock.png';
const smsicon = 'lib/core/assets/images/sms.png';
const googleicon = 'lib/core/assets/images/google.png';
const facebookicon = 'lib/core/assets/images/facebook.png';
const usericon = 'lib/core/assets/images/user.png';
const celendericon = 'lib/core/assets/images/calendar.png';
const callicon = 'lib/core/assets/images/call.png';

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
      images: 'lib/core/assets/images/p1.png',
    ),
    onBoarding(
      title: 'Schedule your Appoinmrnt',
      description:
          'Lorem ipsum dolor sit amet consectetur. Morbi risus non non aliquam amet aliquet.',
      images: 'lib/core/assets/images/p2.png',
    ),
    onBoarding(
      title: '',
      description:
          'Lorem ipsum dolor sit amet consectetur. Morbi risus non non aliquam amet aliquet.',
      images: 'lib/core/assets/images/p3.png',
    ),
  ];
}
