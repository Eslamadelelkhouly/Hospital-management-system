import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/core/utils/color_style.dart';

class CirculePersonalPhoto extends StatelessWidget {
  const CirculePersonalPhoto({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 132.r,
      height: 132.r,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(70).r,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          placeholder: (context, url) => const CircularProgressIndicator(
            color: ColorSystem.kPrimaryColor,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          imageUrl: image,
        ),
      ),
    );
  }
}
