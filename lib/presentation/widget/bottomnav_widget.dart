import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:japaapp/core/theme/custom_typography.dart';


class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget(
      {super.key,
      this.onTap,
      required this.svg,
      required this.title,
      required this.color,
      required this.svgColor});
  final void Function()? onTap;
  final String svg;
  final String title;
  final Color color, svgColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CustomTypography.kWhiteColor,
      // elevation: Sizing.kButtonElevation,
      borderRadius: BorderRadius.all(Radius.circular(16)),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          child: Column(
            children: [
              // ignore: deprecated_member_use
              SvgPicture.asset(
                svg,
                color: svgColor,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: color,
                    fontFamily: "inter",
                    fontSize: 12.0.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
