import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResponsiveStylingSystem {
  static TextStyle textStyleTitle(BuildContext context) =>
      _getStyle(context, 30, FontWeight.w600, Colors.white);

  static TextStyle textStylehintext(BuildContext context) =>
      _getStyle(context, 20, FontWeight.w600);

  static TextStyle textStyle24bold(BuildContext context) =>
      _getStyle(context, 24, FontWeight.w700);

  static TextStyle textStyle24Medium(BuildContext context) =>
      _getStyle(context, 24, FontWeight.w500);

  static TextStyle textStyleSubtitles2(BuildContext context) =>
      _getStyle(context, 18, FontWeight.w600);

  static TextStyle textStyle20semibold(BuildContext context) =>
      _getStyle(context, 20, FontWeight.w600);

  static TextStyle textStyle15bold(BuildContext context) =>
      _getStyle(context, 15, FontWeight.w700);

  static TextStyle textStyleSign12(BuildContext context) =>
      _getStyle(context, 12, FontWeight.w400);

  static TextStyle textStyle11(BuildContext context) =>
      _getStyle(context, 11, FontWeight.w400);

  static TextStyle textStyle16Medium(BuildContext context) =>
      _getStyle(context, 16, FontWeight.w400);

  static TextStyle textStyle14Medium(BuildContext context) =>
      _getStyle(context, 14, FontWeight.w400);

  static TextStyle textStyle18semibold(BuildContext context) =>
      _getStyle(context, 18, FontWeight.w600);

  static TextStyle textStyle14bold(BuildContext context) =>
      _getStyle(context, 14, FontWeight.w700);

  static TextStyle textStyle19semibold(BuildContext context) =>
      _getStyle(context, 19, FontWeight.w600);

  static TextStyle textStyle17semibold(BuildContext context) =>
      _getStyle(context, 17, FontWeight.w600);

  static TextStyle textStyle30semibold(BuildContext context) =>
      _getStyle(context, 30, FontWeight.w600);

  /// Base method to calculate responsive text size
  static TextStyle _getStyle(
    BuildContext context,
    double baseFontSize,
    FontWeight weight, [
    Color color = Colors.black,
  ]) {
    double width = MediaQuery.of(context).size.width;
    double scale = width / 375;
    double finalFontSize = baseFontSize * scale.clamp(0.85, 1.25);
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: finalFontSize,
      fontWeight: weight,
      color: color,
    );
  }
}
