import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/util/color_util.dart';

// ignore: avoid_classes_with_only_static_members
class CustomTypography {
  // static final kPrimaryColor = ColorUtil.colorFromHex('563b96');
  static final kPrimaryColor = ColorUtil.colorFromHex('#29BFC0');
  static final kPrimaryColorJapa500 = ColorUtil.colorFromHex('#0F2B37');
  static final kPrimaryColorJapa200 = ColorUtil.colorFromHex('#3F6576');
  static final kPrimaryColornew = ColorUtil.colorFromHex('#29BFC0');
  static final kPrimaryColor10 = kPrimaryColor.withOpacity(.10);
  static final kPrimaryColor50 = kPrimaryColor.withOpacity(.50);

  static final kSecondaryColor = ColorUtil.colorFromHex('#F1B33A');
  static final kSecondaryColorJapa200 = ColorUtil.colorFromHex('#aeccde');
  static final kSecondaryColorJapa500 = ColorUtil.colorFromHex('#9ec1d7');
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
  
  static final kGreyColorlabel = ColorUtil.colorFromHex('#202223');
  static final kGreyColorBorderSide = ColorUtil.colorFromHex('#B7C6CC');
  static final kGreyColorButton= ColorUtil.colorFromHex('#C1C1C1');
  
  
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
  static final kBackgroundColor = ColorUtil.colorFromHex('#FFFFFF');
  static final kBackgroundColorBorderRipple = ColorUtil.colorFromHex('#a7a8a9');
  static final kTitleSmall = ColorUtil.colorFromHex('#979797');
  static final kTitleMedium = ColorUtil.colorFromHex('#344054');
  static final kTitleLarge = ColorUtil.colorFromHex('#344053');

  static final kTextFieldBorderColor = kLineColor;


//Tab Colrs
  static final kTabFill = ColorUtil.colorFromHex('#FFFFFF');
  static final kTabNotFill = ColorUtil.colorFromHex('#18465A');

  static const String fontName = 'dmSerifDisplay';
  static const String fontName2 = 'satoshi';
  static TextStyle fontStyle = TextStyle(fontSize: 14.sp);

  static final ThemeData _defaultTheme = ThemeData(
    fontFamily: fontName2,
    primaryColor: kPrimaryColor,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: kSecondaryColornew),
    textSelectionTheme: TextSelectionThemeData(cursorColor: kPrimaryColornew),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    iconTheme: IconThemeData(size: 24.0.sp), 
    
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: fontStyle,
      hintStyle: fontStyle,
      prefixStyle: fontStyle,
      suffixStyle: fontStyle,
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
      textTheme: TextTheme(

     //H1 Regular   
    displayLarge: TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w700,
      fontSize: 61.sp,
      // 
    ),

    //H2 Regular 
    displayMedium: TextStyle(
       fontFamily: fontName,
      fontWeight: FontWeight.w600,
      fontSize: 49.sp,
    ),

    //H3 Regular 
    displaySmall: TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w700,
      fontSize: 39.sp,
    ),
    //Heading
    headlineLarge: TextStyle(
       fontFamily: fontName,
      fontWeight: FontWeight.w500,
      fontSize: 31.sp,
      color: Color(0xFF0D0D0D),
    ),
    headlineMedium: TextStyle(
       fontFamily: fontName,
      fontWeight: FontWeight.w500,
      fontSize: 25.sp,
    ),
    // headlineSmall: TextStyle(
    //    fontFamily: fontName,
    //   fontWeight: FontWeight.w700,
    //   fontSize: 62.sp,
    // ),
    titleLarge: TextStyle(
      fontFamily: fontName2,
      fontWeight: FontWeight.w500,
      fontSize: 20.sp,
      color:CustomTypography.kTitleLarge
    ),
    titleMedium: TextStyle(
     fontFamily: fontName2,
      fontWeight: FontWeight.w700,
      fontSize: 16.sp,
      color:CustomTypography.kTitleMedium

    ),
    titleSmall: TextStyle(
      fontFamily: fontName2,
      fontWeight: FontWeight.w700,
      fontSize: 13.sp,
      color:CustomTypography.kTitleSmall
    ),

    // Theme.of(context).textTheme.titleMedium?.copyWith(
    //             fontSize: 25.sp,
    //             fontWeight: FontWeight.w700,
    //             height: 0.75.h,
    //             color: Color(0xff344054)),
    //       )
    // bodyLarge: TextStyle(
    //   fontFamily: fontName,
    //   fontWeight: FontWeight.w700,
    //   fontSize: 24.sp,
    //   letterSpacing: 0.4,
    //   height: 1.2,
    //   color: Color(0xFF212121),
    // ),
    // bodyMedium: TextStyle(
    //   fontFamily: fontName,
    //   fontWeight: FontWeight.w700,
    //   fontSize: 24.sp,
    //   letterSpacing: 0.4,
    //   height: 1.2,
    //   color: Color(0xFF212121),
    // ),
    // bodySmall: TextStyle(
    //   fontFamily: fontName,
    //   fontWeight: FontWeight.w700,
    //   fontSize: 24.sp,
    //   letterSpacing: 0.4,
    //   height: 1.2,
    //   color: Color(0xFF212121),
    // ),
    // labelLarge: TextStyle(
    //   fontFamily: fontName,
    //   fontWeight: FontWeight.w700,
    //   fontSize: 24.sp,
    //   letterSpacing: 0.4,
    //   height: 1.2,
    //   color: Color(0xFF212121),
    // ),
    // labelMedium: TextStyle(
    //   fontFamily: fontName,
    //   fontWeight: FontWeight.w700,
    //   fontSize: 24.sp,
    //   letterSpacing: 0.4,
    //   height: 1.2,
    //   color: Color(0xFF212121),
    // ),
    labelSmall: TextStyle(
      fontFamily: fontName2,
      fontWeight: FontWeight.w500,
      fontSize: 10.sp,
     
    ),
  )
      
      );
}
