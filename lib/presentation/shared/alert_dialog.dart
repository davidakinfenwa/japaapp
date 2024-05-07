import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';
import '../../core/constants.dart';
import '../../core/theme/custom_typography.dart';
import '../../core/util/width_constraints.dart';

enum AlertType { success, warning }

showCustomAlertDialog(BuildContext context,
    {required String title,
    required String subtitle,
    String buttonText = "",
    String? hasTitle = 'yes',
    double? topSpace,
    double? bottomPadding,
    bool? hasFirstButton,
    String? cancelText,
    bool hasSecondButton = false,
    bool canPop = false,
    double? dialogHeight,
    String secondButtonText = "Continue",
    bool hasCancle = false,
    bool? backgroundColor = false,
    void Function()? onTap,
    void Function()? onTapSeconButton,
    Widget? body,
    AlertType alertType = AlertType.success}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        surfaceTintColor: backgroundColor == false
            ? CustomTypography.kTransparentColor
            : CustomTypography.kTransparentColor,
        elevation: 0,
        backgroundColor: alertType == AlertType.success
            ? CustomTypography.kSuccessColor75
            : CustomTypography.kErrorColor75,
        insetPadding: EdgeInsets.symmetric(
            horizontal: 20, vertical: MediaQuery.of(context).size.height * 0.0),
        shadowColor: null,
        child: SizedBox(
            height: dialogHeight ?? 166.h,
            child: WidthConstraint(context).withHorizontalSymmetricalPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: (Sizing.kSizingMultiple * 2).h),
                  if (hasTitle == 'yes') ...[
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: CustomTypography.kGreyColor90,
                          fontWeight: FontWeight.w700,
                          fontSize: 17.sp),
                    ),
                    SizedBox(height: (Sizing.kSizingMultiple * 1).h),
                    Text(
                      subtitle,
                      //textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: CustomTypography.kGreyColor90,
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.w500
                          //fontWeight: FontWeight.w500,
                          ),
                    ),
                  ] else ...[
                    // SvgPicture.asset(
                    //   'assets/svgs/deliveryguy.svg',
                    // ),
                  ],
                  SizedBox(height: (Sizing.kSizingMultiple * 3).h),
                  CustomButton(
                    type: ButtonType.regularButton(
                        onTap: () {
                          onTap!();
                        },
                        label: buttonText,
                        isLoadingMode: false,
                        backgroundColor: alertType == AlertType.success
                            ? CustomTypography.kSuccessColor100
                            : CustomTypography.kErrorColor100,
                        textColor: CustomTypography.kGreyColor90,
                        borderRadius: BorderRadius.all(
                            Radius.circular(Sizing.kBorderRadius * 7.r))),
                  ),
                ],
              ),
            )),
      );
    },
  );
}

showCustomAlertDialogWithWhite(BuildContext context,
    {required String title,
    required String subtitle,
    String buttonText = "",
    String? hasTitle = 'yes',
    double? topSpace,
    double? bottomPadding,
    bool? hasFirstButton,
    String? cancelText,
    bool hasSecondButton = false,
    bool canPop = false,
    double? dialogHeight,
    String secondButtonText = "Continue",
    bool hasCancle = false,
    bool? backgroundColor = false,
    void Function()? onTap,
    void Function()? onTapSeconButton,
    Widget? body,
    AlertType alertType = AlertType.success}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        surfaceTintColor: backgroundColor == false
            ? CustomTypography.kTransparentColor
            : CustomTypography.kTransparentColor,
        elevation: 0,
        backgroundColor: CustomTypography.kWhiteColor,
        insetPadding: EdgeInsets.symmetric(
            horizontal: 20, vertical: MediaQuery.of(context).size.height * 0.0),
        shadowColor: null,
        child: SizedBox(
            height: dialogHeight ?? 166.h,
            child: WidthConstraint(context).withHorizontalSymmetricalPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: (Sizing.kSizingMultiple * 2).h),
                  Divider(),
                  if (hasTitle == 'yes') ...[
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: CustomTypography.kGreyColor90,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp),
                    ),
                    SizedBox(height: (Sizing.kSizingMultiple * 1).h),
                    Text(
                      subtitle,
                      //textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: CustomTypography.kGreyColor90,
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.w500
                          //fontWeight: FontWeight.w500,
                          ),
                    ),
                  ] else ...[
                    // SvgPicture.asset(
                    //   'assets/svgs/deliveryguy.svg',
                    // ),
                  ],
                  SizedBox(height: (Sizing.kSizingMultiple * 3).h),
                   Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 120,
                        child: CustomButton(
                          type: ButtonType.regularButton(
                              onTap: () {
                                onTap!();
                              },
                              
                              label: "Cancle",
                              isLoadingMode: false,
                              backgroundColor: CustomTypography.kPrimaryColor50,
                              textColor: CustomTypography.kPrimaryColor300,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Sizing.kBorderRadius * 7.r))),
                        ),
                      ),

                         Container(
                        width: 120,
                        child: CustomButton(
                          type: ButtonType.regularButton(
                              onTap: () {
                                onTapSeconButton!();
                              },
                              
                              label: "Delete",
                              isLoadingMode: false,
                              backgroundColor: CustomTypography.kErrorColor50,
                              textColor: CustomTypography.kErrorColor400,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Sizing.kBorderRadius * 7.r))),
                        ),
                      ),


                      // CustomButton(
                      //   type: ButtonType.regularButton(
                      //       onTap: () {
                      //         onTap!();
                      //       },
                      //       label: buttonText,
                      //       isLoadingMode: false,
                      //       backgroundColor: CustomTypography.kSuccessColor100,
                               
                      //       textColor: CustomTypography.kGreyColor90,
                      //       borderRadius: BorderRadius.all(
                      //           Radius.circular(Sizing.kBorderRadius * 7.r))),
                      // ),
                    ],
                  ),
                ],
              ),
            )),
      );
    },
  );
}
