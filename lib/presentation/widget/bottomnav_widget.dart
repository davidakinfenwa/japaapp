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
      required this.svgColor,
      this.height,
      this.width
      });
  final void Function()? onTap;
  final String svg;
  final String title;
  final Color color, svgColor;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return Material(
      color:  CustomTypography.kBottomNavColor,
      // elevation: Sizing.kButtonElevation,
      borderRadius: BorderRadius.all(Radius.circular(16)),

      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        splashColor: Colors.transparent, // Set the splash color to transparent
        splashFactory: InkRipple.splashFactory, // Use the default splash factory

        child: SizedBox(
         width: 80,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                // ignore: deprecated_member_use
                SvgPicture.asset(
                  svg,
                  color: svgColor,
                  width:width ,
                  height: height,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: color,
                      fontSize: 12.0.sp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
