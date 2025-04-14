import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/shared_perfernce_singletone.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/search/data/models/doctor_model.dart';

class ContainerSearch extends StatefulWidget {
  ContainerSearch({
    super.key,
    required this.doctor,
  });
  final Doctor doctor;
  late String tokeng;

  @override
  State<ContainerSearch> createState() => _ContainerSearchState();
}

class _ContainerSearchState extends State<ContainerSearch> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.tokeng = SharedPreferenceSingleton.getString(token);
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          Routing.kdoctorscreen,
          extra: widget.doctor,
        );
      },
      child: Container(
        width: 175.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16).r,
          color: ColorSystem.kPrimaryColorHighLight,
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  12.verticalSpace,
                  SizedBox(
                    width: 58.r,
                    height: 58.r,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50).r,
                      child: CachedNetworkImage(
                          imageUrl: widget.doctor.image.imageName,
                          httpHeaders: {
                            'Authorization': 'Bearer ${widget.tokeng}'
                          },
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          memCacheHeight: 300, // تقليل حجم الذاكرة المؤقتة
                          maxHeightDiskCache: 300,
                          fadeInDuration: Duration(seconds: 1))
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    textAlign: TextAlign.center,
                    'Dr. ${widget.doctor.firstName}',
                    style: StylingSystem.textStyle16Medium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  6.verticalSpace,
                  SizedBox(
                    width: 141.r,
                    height: 60.r,
                    child: Text(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      widget.doctor.information.about,
                      style: StylingSystem.textStyle11.copyWith(
                        color: ColorSystem.kGrayColor2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 13.5.r,
              top: 16.r,
              child: Row(
                children: [
                  Image.asset(stargoldicon),
                  2.horizontalSpace,
                  Text(
                    widget.doctor.rating,
                    style: StylingSystem.textStyleSign12.copyWith(
                      fontWeight: FontWeight.w700,
                      color: ColorSystem.kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
