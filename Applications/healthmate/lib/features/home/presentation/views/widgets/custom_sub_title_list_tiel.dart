import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomSubtitleListTiel extends StatelessWidget {
  const CustomSubtitleListTiel({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Good Morning ',
          style: ResponsiveStylingSystem.textStyle14Medium(context),
        ),
        SizedBox(
          width: 6,
        ),
        Container(
          width: 48,
          height: 48,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                image,
              ),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
