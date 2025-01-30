import 'package:flutter/material.dart';

const logo = 'lib/core/assets/images/logo.png';
const logo2 = 'lib/core/assets/images/logo2.png';

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
      images: 'lib/core/assets/images/gif1.gif',
    ),
    onBoarding(
      title: 'Schedule your Appoinmrnt',
      description:
          'Lorem ipsum dolor sit amet consectetur. Morbi risus non non aliquam amet aliquet.',
      images: 'lib/core/assets/images/gif2.gif',
    ),
    onBoarding(
      title: '',
      description:
          'Lorem ipsum dolor sit amet consectetur. Morbi risus non non aliquam amet aliquet.',
      images: 'lib/core/assets/images/gif3.gif',
    ),
  ];
}
