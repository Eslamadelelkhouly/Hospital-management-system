import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';

class CustomContainerDoctorPhotoPersonal extends StatelessWidget {
  const CustomContainerDoctorPhotoPersonal({
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
        borderRadius: BorderRadius.circular(66).r,
        child: CachedNetworkImage(
          imageUrl: image,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
