import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/style.dart';

class CustomListTielConfirmCard extends StatelessWidget {
  const CustomListTielConfirmCard({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.special,
  });
  final String imgUrl;
  final String name;
  final String special;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          memCacheHeight: 300,
          maxHeightDiskCache: 300,
          fadeInDuration: Duration(seconds: 1),
        ),
      ),
      title: Text(
        '$name',
        style: StylingSystem.textStyle16Medium.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        '$special',
        style: StylingSystem.textStyleSign12,
      ),
    );
  }
}
