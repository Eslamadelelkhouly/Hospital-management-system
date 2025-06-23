import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/constant.dart';
import 'package:healthmate/core/utils/color_style.dart';
import 'package:healthmate/core/utils/router_screens.dart';
import 'package:healthmate/core/utils/style.dart';
import 'package:healthmate/features/home/presentation/manager/addfavourite/cubit/add_favourite_cubit.dart';

class ContainerDoctor extends StatefulWidget {
  final double rating;
  final String doctorName;
  final String specialty;
  final int id;
  final String image;
  const ContainerDoctor({
    super.key,
    required this.rating,
    this.doctorName = 'Dr. Ali Hassan',
    this.specialty = 'Dermato-Endocrinology',
    required this.id,
    required this.image,
  });

  @override
  State<ContainerDoctor> createState() => _ContainerDoctorState();
}

class _ContainerDoctorState extends State<ContainerDoctor> {
  bool isFavorite = false;

  final int maxRating = 5;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          Routing.kdoctorscreen,
          extra: widget.id.toString(),
        );
      },
      child: Container(
        width: 330,
        height: 114,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: ColorSystem.kPrimaryColorHighLight,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                ListTile(
                  leading: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: widget.image,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  title: Text(
                    widget.doctorName,
                    style: StylingSystem.textStyle16Medium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    widget.specialty,
                    style: StylingSystem.textStyleSign12,
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(width: 80),
                    for (int i = 1; i <= maxRating; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Image.asset(
                          i <= widget.rating ? stargoldicon : staricon,
                          width: 24,
                          height: 24,
                        ),
                      ),
                  ],
                ),
              ],
            ),
            Positioned(
              right: 20,
              top: 15,
              child: Row(
                children: [
                  GestureDetector(
                    child: Image.asset(
                        isFavorite == true ? hearticonred : hearticon),
                    onTap: () {
                      if (isFavorite) {
                        // Remove from favorites
                        isFavorite = false;
                        setState(() {});
                      } else {
                        // Add to favorites
                        isFavorite = true;
                        setState(() {});
                        context
                            .read<AddFavouriteCubit>()
                            .addFavourite(doctorId: widget.id);
                      }
                    },
                  ),
                  const SizedBox(width: 6),
                  Image.asset(infoicon),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
