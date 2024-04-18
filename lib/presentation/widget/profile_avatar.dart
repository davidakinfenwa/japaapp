import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/theme/custom_typography.dart';



class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onTap;
  final double? radius;

  const ProfileAvatar({
    Key? key,
    required this.imageUrl,
    this.onTap,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),

        
        decoration: BoxDecoration(shape: BoxShape.circle,
        color: CustomTypography.kWhiteColor,
        borderRadius: BorderRadius.circular(Sizing.kAvatarRadius.r)),
        child: CircleAvatar(
          radius: radius ?? Sizing.kAvatarRadius,
          foregroundImage: AssetImage(imageUrl),
        ),
      ),
    );
  }
}
