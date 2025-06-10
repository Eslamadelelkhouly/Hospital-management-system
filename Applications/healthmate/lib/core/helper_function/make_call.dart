import 'package:url_launcher/url_launcher.dart';

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri url = Uri(scheme: 'tel', path: phoneNumber);
  print('Trying to launch: $url'); 
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    print('Could not launch $url');
  }
}
