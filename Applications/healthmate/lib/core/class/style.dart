import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class StylingSystem {
  static TextStyle textStyleTitle = GoogleFonts.ibmPlexSansArabic(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle textStylehintext = GoogleFonts.ibmPlexSansArabic(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle textStyleheading5 = GoogleFonts.ibmPlexSansArabic(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static TextStyle textStyleSubtitles2 = GoogleFonts.ibmPlexSansArabic(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
}
