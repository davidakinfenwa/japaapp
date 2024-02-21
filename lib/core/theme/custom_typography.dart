import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/util/color_util.dart';


// ignore: avoid_classes_with_only_static_members
class CustomTypography {
  // static final kPrimaryColor = ColorUtil.colorFromHex('563b96');
  static final kPrimaryColor = ColorUtil.colorFromHex('#29BFC0');
  static final kPrimaryColornew = ColorUtil.colorFromHex('#29BFC0');
  static final kPrimaryColor10 = kPrimaryColor.withOpacity(.10);
  static final kPrimaryColor50 = kPrimaryColor.withOpacity(.50);

  static final kSecondaryColor = ColorUtil.colorFromHex('#F1B33A');
  static final kSecondaryColornew = ColorUtil.colorFromHex('#F1B33A');
  // static final kSecondaryColor10 = kSecondaryColor.withOpacity(.10);
  // static final kSecondaryColor50 = kSecondaryColor.withOpacity(.50);

  //ALERT COLOR
  static final kWarningColor = ColorUtil.colorFromHex('#FACC15');
  static final kWarningColor10 = kWarningColor.withOpacity(.10);
  static final kWarningColor50 = kWarningColor.withOpacity(.50);

  static final kSuccessColor = ColorUtil.colorFromHex('#00C566');
  static final kSuccessColor10 = kSuccessColor.withOpacity(.10);
  static final kSuccessColor50 = kSuccessColor.withOpacity(.50);

  static final kErrorColor = ColorUtil.colorFromHex('#0A113C');
  static final kErrorColor10 = kErrorColor.withOpacity(.10);
  static final kErrorColor50 = kErrorColor.withOpacity(.50);

  static const kGreyColor = Colors.grey;
  static final kGreyColor10 = ColorUtil.colorFromHex('#FDFDFD');
  static final kGreyColor20 = ColorUtil.colorFromHex('#ECF1F6');
  static final kGreyColor30 = ColorUtil.colorFromHex('#E3E9ED');
  static final kGreyColor40 = ColorUtil.colorFromHex('#D1D8DD');
  static final kGreyColor50 = ColorUtil.colorFromHex('#BFC6CC');
  static final kGreyColor60 = ColorUtil.colorFromHex('#9CA4AB');
  static final kGreyColor70 = ColorUtil.colorFromHex('#78828A');
  static final kGreyColor80 = ColorUtil.colorFromHex('#66707A');
  static final kGreyColor90 = ColorUtil.colorFromHex('#434E58');
  static final kGreyColor100 = ColorUtil.colorFromHex('#171725');

  //additional colors
  static const kWhiteColor = Colors.white;
  static const kWhiteColor54 = Colors.white54;
  static final kLineColor = ColorUtil.colorFromHex('#E3E7EC');
  static final kSoftBlueColor = ColorUtil.colorFromHex('#4A4A65');

  static const kBlackColor = Colors.black;
  static const kTransparentColor = Colors.transparent;
  static final kBackgroundColor = ColorUtil.colorFromHex('#F7F7F7');

  static final kTextFieldBorderColor = kLineColor;

  static final _dmSansFont = GoogleFonts.inter(fontSize: 14.0.sp);
  static final ThemeData _defaultTheme = ThemeData(
    primaryColor: kPrimaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kSecondaryColornew),
    textSelectionTheme: TextSelectionThemeData(cursorColor: kPrimaryColornew),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    iconTheme: IconThemeData(size: 24.0.sp),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: _dmSansFont,
      hintStyle: _dmSansFont,
      prefixStyle: _dmSansFont,
      suffixStyle: _dmSansFont,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kTextFieldBorderColor),
        // gapPadding: Sizing.kZeroValue,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: kTextFieldBorderColor),
        // gapPadding: Sizing.kZeroValue,
      ),
    ),
    scaffoldBackgroundColor: kBackgroundColor,
    appBarTheme: AppBarTheme(
      color: kBackgroundColor,
      elevation: Sizing.kZeroValue,
    ),
  );

  static final ThemeData themeDataModifications = _defaultTheme.copyWith(
    textTheme: GoogleFonts.interTextTheme(_defaultTheme.textTheme).copyWith(
      displayLarge: GoogleFonts.inter(
        color: kBlackColor,
        fontSize: 48.0.sp,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: GoogleFonts.inter(
        color: kBlackColor,
        fontSize: 40.0.sp,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: GoogleFonts.inter(
        color: kBlackColor,
        fontSize: 32.0.sp,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: GoogleFonts.inter(
        color: kBlackColor,
        fontSize: 48.0.sp,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: GoogleFonts.inter(
        color: kBlackColor,
        fontSize: 40.0.sp,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: GoogleFonts.inter(
        color: kBlackColor,
        fontSize: 32.0.sp,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: GoogleFonts.inter(
        color: kBlackColor,
        fontSize: 16.0.sp,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.inter(
        color: kBlackColor,
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: GoogleFonts.inter(
        color: kBlackColor,
        fontSize: 16.0.sp,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.inter(
        color: kBlackColor,
        fontSize: 14.0.sp,
      ),
      bodyLarge: GoogleFonts.inter(
        color: kBlackColor,
        fontSize: 14.0.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.inter(
        color: kBlackColor,
        fontSize: 14.0.sp,
        fontWeight: FontWeight.normal,
      ),
      // caption: GoogleFonts.inter(color: kBlackColor, fontSize: 14.0.sp),
      // : GoogleFonts.inter(color: kGreyColor, fontSize: 14.0.sp),
    ),
  );
}
