
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBackButton extends StatelessWidget {
 final VoidCallback? onTapExit;
  const CustomBackButton({
    super.key,
    this.onTapExit,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapExit == null ? Navigator.pop(context) : onTapExit!();
      },
      child: SizedBox(
        height: 24.h,
        width: 24.w,
        child: 
        SvgPicture.asset(
          'assets/svg/Back.svg',
        ),
      ),
    );
  }
}




class CustomForwardButton extends StatelessWidget {
 final VoidCallback? onTapExit;
  const CustomForwardButton({
    super.key,
    this.onTapExit,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapExit == null ? Navigator.pop(context) : onTapExit!();
      },
      child: SizedBox(
        height: 24.h,
        width: 24.w,
        child: SvgPicture.asset(
          'assets/svg/forwardarrow.svg',
        ),
      ),
    );
  }
}