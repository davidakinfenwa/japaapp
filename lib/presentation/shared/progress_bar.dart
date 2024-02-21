import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/theme/custom_typography.dart';


class ContainerWithProgressBar extends StatelessWidget {
  const ContainerWithProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width*0.60,
      height: Sizing.kHSpacing4.h,
      //padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: CustomTypography.kGreyColor50,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          LinearProgressIndicator(
            minHeight: Sizing.kHSpacing50.h,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            backgroundColor: CustomTypography.kGreyColor60,
            valueColor:  AlwaysStoppedAnimation<Color>(CustomTypography.kGreyColor100),
            value: 0.6, // Replace with your progress value (0.0 to 1.0).
          ),
          // const Center(
          //   child: Text(
          //     '60%', // Replace with your progress label.
          //     style: TextStyle(fontWeight: FontWeight.bold),
          //   ),
          // ),
        ],
      ),
    );
  }
}
