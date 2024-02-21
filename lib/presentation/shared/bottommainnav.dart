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
              horizontal: Sizing.kSizingMultiple * 3.w,
              vertical: Sizing.kSizingMultiple.w),
          decoration: const BoxDecoration(
            color: CustomTypography.kWhiteColor,
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
                  ? "assets/svg/Home.svg"
                  : "assets/svg/Home.svg",
              color: value.pageIndex == 0
                  ? CustomTypography.kSecondaryColor
                  : CustomTypography.kGreyColor60,
              svgColor: value.pageIndex == 0
                  ? CustomTypography.kSecondaryColor
                  : CustomTypography.kGreyColor60,
            ),
            BottomNavWidget(
              onTap: () {
                value.pageIndex = 1;
              },
              title: "Message",
              svg: value.pageIndex == 1
                  ? "assets/svg/chat.svg"
                  : "assets/svg/chat.svg",
              color: value.pageIndex == 1
                  ? CustomTypography.kSecondaryColor
                  : CustomTypography.kGreyColor60,
              svgColor: value.pageIndex == 1
                  ? CustomTypography.kSecondaryColor
                  : CustomTypography.kGreyColor60,
            ),
            // BottomNavWidget(
            //   onTap: () {
            //     value.pageIndex = 2;
            //   },
            //   title: "Add",
            //   svg: value.pageIndex == 2
            //       ? "assets/svg/chat.svg"
            //       : "assets/svg/chat.svg",
            // ),
            Material(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
              clipBehavior: Clip.none,
              child: InkWell(
                onTap: () => value.pageIndex = 2,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  decoration: BoxDecoration(
                      color: CustomTypography.kSecondaryColornew,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF5D6976).withOpacity(0.4),
                          spreadRadius: 3,
                          blurRadius: 20.r,
                          offset: const Offset(0, 12),
                        )
                      ]),
                  child: Icon(
                    Icons.add,
                    size: Sizing.kIconImagesHeightSize,
                    color: CustomTypography.kWhiteColor,
                  ),
                ),
              ),
            ),

            BottomNavWidget(
              onTap: () {
                value.pageIndex = 3;
              },
              title: "Listing",
              svg: value.pageIndex == 3
                  ? "assets/svg/paperplus.svg"
                  : "assets/svg/paperplus.svg",
              color: value.pageIndex == 3
                  ? CustomTypography.kSecondaryColor
                  : CustomTypography.kGreyColor60,
              svgColor: value.pageIndex == 3
                  ? CustomTypography.kSecondaryColor
                  : CustomTypography.kGreyColor60,
            ),
            BottomNavWidget(
              onTap: () {
                value.pageIndex = 4;
              },
              title: "Calender",
              svg: value.pageIndex == 4
                  ? "assets/svg/timecircle.svg"
                  : "assets/svg/timecircle.svg",
              color: value.pageIndex == 4
                  ? CustomTypography.kSecondaryColor
                  : CustomTypography.kGreyColor60,
              svgColor: value.pageIndex == 4
                  ? CustomTypography.kSecondaryColor
                  : CustomTypography.kGreyColor60,
            ),
          ]),
        ),
      ));
    }));
  }
}
