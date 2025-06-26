import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthmate/constant.dart';
import 'package:image_picker/image_picker.dart';

class CircleImageContainer extends StatefulWidget {
  final Function(XFile) onImagePicked;

  const CircleImageContainer({super.key, required this.onImagePicked});

  @override
  State<CircleImageContainer> createState() => _CircleImageContainerState();
}

class _CircleImageContainerState extends State<CircleImageContainer> {
  XFile? pickedImage;

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        pickedImage = image;
      });
      widget.onImagePicked(image); // ⬅️ رجّع الصورة للأب
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 140.r,
          height: 140.r,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(70).r,
            child: pickedImage == null
                ? Image.asset(
                    'assets/images/personal.png',
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    File(pickedImage!.path),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: pickImageFromGallery,
            child: Container(
              width: 25.w,
              height: 25.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffDEE8FB),
              ),
              child: ImageIcon(
                AssetImage(edit),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
