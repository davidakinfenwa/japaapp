import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/business/snapshot/tabscreen_provider.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/presentation/widget/bottomnav_widget.dart';

import 'package:provider/provider.dart';

class BottomMainNav extends StatelessWidget {
  const BottomMainNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TabScreenNotifier>(builder: ((context, value, child) {
      return SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          height: Sizing.kSizingMultiple * 7.h,
          width: MediaQuery.sizeOf(context).width.w,
          padding: EdgeInsets.symmetric(
              horizontal: Sizing.kSizingMultiple.w,
              vertical: Sizing.kSizingMultiple.w),
          decoration:  BoxDecoration(
            color: CustomTypography.kBottomNavColor,
            // borderRadius: BorderRadius.all(
            //     Radius.circular(Sizing.kSizingMultiple * 2.w))
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            BottomNavWidget(
              onTap: () {
                value.pageIndex = 0;
              },
              title: "Home",
              svg: value.pageIndex == 0
                  ? "assets/svg/homeactivenew.svg"
                  : "assets/svg/homenotfill.svg",
              color: value.pageIndex == 0
                  ? CustomTypography.kPrimaryColor300
                  : CustomTypography.kGreyColor80,
              svgColor: value.pageIndex == 0
                  ? CustomTypography.kPrimaryColor300
                  : CustomTypography.kGreyColor80,
            ),
            BottomNavWidget(
              onTap: () {
                value.pageIndex = 1;
              },
              height:24,
              width: 24,
              title: "My Process",
              svg: value.pageIndex == 1
                  ? "assets/svg/chat.svg"
                  : "assets/svg/chat.svg",
              color: value.pageIndex == 1
                ? CustomTypography.kPrimaryColor300
                  : CustomTypography.kGreyColor80,
              svgColor: value.pageIndex == 1
                  ? CustomTypography.kPrimaryColor300
                  : CustomTypography.kGreyColor80,
            ),
  

            BottomNavWidget(
              onTap: () {
                value.pageIndex = 2;
              },
              title: "Thrive",
              svg: value.pageIndex == 2
                  ? "assets/svg/globefill.svg"
                  : "assets/svg/globe.svg",
              color: value.pageIndex == 2
               ? CustomTypography.kPrimaryColor300
                  : CustomTypography.kGreyColor80,
              svgColor: value.pageIndex == 2
                  ? CustomTypography.kPrimaryColor300
                  : CustomTypography.kGreyColor80,
            ),
            BottomNavWidget(
              onTap: () {
                value.pageIndex = 3;
              },
              title: "Account",
              svg: value.pageIndex == 3
                  ? "assets/svg/accountfill.svg"
                  : "assets/svg/account.svg",
              color: value.pageIndex == 3
                  ? CustomTypography.kPrimaryColor300
                  : CustomTypography.kGreyColor80,
              svgColor: value.pageIndex == 3
                  ? CustomTypography.kPrimaryColor300
                  : CustomTypography.kGreyColor80,
            ),
          ]),
        ),
      ));
    }));
  }
}
