import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/shared_perfernce_singletone.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/search/data/models/doctor_model_get_by_name.dart';

class ContainerResult extends StatefulWidget {
  const ContainerResult({super.key, required this.doctorSearch});
  final Doctor doctorSearch;

  @override
  State<ContainerResult> createState() => _ContainerResultState();
}

class _ContainerResultState extends State<ContainerResult> {
  String tokeng = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tokeng = SharedPreferenceSingleton.getString(token);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          Routing.kdoctorscreen,
          extra: widget.doctorSearch.id.toString(),
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
                        imageUrl:
                            'http://10.0.2.2:8000/storage/${widget.doctorSearch.imageName}',
                        httpHeaders: {'Authorization': 'Bearer ${tokeng}'},
                        scale: 2.5,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        memCacheHeight: 300,
                        maxHeightDiskCache: 300,
                        fadeInDuration: Duration(seconds: 1),
                      ),
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    textAlign: TextAlign.center,
                    'Dr. ${widget.doctorSearch.firstName}',
                    style: ResponsiveStylingSystem.textStyle16Medium(context).copyWith(
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
                      widget.doctorSearch.about,
                      style: ResponsiveStylingSystem.textStyle11(context).copyWith(
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
                    widget.doctorSearch.rating,
                    style: ResponsiveStylingSystem.textStyleSign12(context).copyWith(
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
