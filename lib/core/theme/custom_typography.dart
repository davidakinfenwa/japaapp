import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/util/color_util.dart';

// ignore: avoid_classes_with_only_static_members
class CustomTypography {
  // static final kPrimaryColor = ColorUtil.colorFromHex('563b96');
  static final kPrimaryColor50 = ColorUtil.colorFromHex('#e8edef');
  static final kPrimaryColor75 = ColorUtil.colorFromHex('#a0b3bb');
  static final kPrimaryColor100= ColorUtil.colorFromHex('#79949f');
  static final kPrimaryColor200 = ColorUtil.colorFromHex('#3f6576');
  static final kPrimaryColor300 = ColorUtil.colorFromHex('#18465a');
  static final kPrimaryColor400 = ColorUtil.colorFromHex('#11313f');
  static final kPrimaryColor500 = ColorUtil.colorFromHex('#0f2b37');
 
  // static final kPrimaryColor10 = kPrimaryColor.withOpacity(.10);
  // static final kPrimaryColor50 = kPrimaryColor.withOpacity(.50);

  static final kSecondaryColor50 = ColorUtil.colorFromHex('#f5f9fb');
  static final kSecondaryColor75 = ColorUtil.colorFromHex('#d7e6ef');
  static final kSecondaryColor100 = ColorUtil.colorFromHex('#c7dbe8');
  static final kSecondaryColor200 = ColorUtil.colorFromHex('#aeccde');
  static final kSecondaryColor300 = ColorUtil.colorFromHex('#9ec1d7');
  static final kSecondaryColor400 = ColorUtil.colorFromHex('#6f8797');
  static final kSecondaryColor500 = ColorUtil.colorFromHex('#607683');
  // static final kSecondaryColor10 = kSecondaryColor.withOpacity(.10);
  // static final kSecondaryColor50 = kSecondaryColor.withOpacity(.50);

  //TETIARY COLOR
  static final kTetiaryColor50 = ColorUtil.colorFromHex('#fdfefe');
  static final kTetiaryColor75 = ColorUtil.colorFromHex('#f8f9f9');
  static final kTetiaryColor100 = ColorUtil.colorFromHex('#f5f6f7');
  static final kTetiaryColor200 = ColorUtil.colorFromHex('#f1f3f3');
  static final kTetiaryColor300 = ColorUtil.colorFromHex('#eef0f1');
  static final kTetiaryColor400 = ColorUtil.colorFromHex('#a7a8a9');
  static final kTetiaryColor500 = ColorUtil.colorFromHex('#919293');


    //INFO COLOR
  static final kInfoColor50 = ColorUtil.colorFromHex('#f4faff');
  static final kInfoColor75 = ColorUtil.colorFromHex('#d2ecff');
  static final kInfoColor100 = ColorUtil.colorFromHex('#bfe4ff');
  static final kInfoColor200 = ColorUtil.colorFromHex('#a4d8ff');
  static final kInfoColor300 = ColorUtil.colorFromHex('#91d0ff');
  static final kInfoColor400 = ColorUtil.colorFromHex('#6692b3');
  static final kInfoColor500 = ColorUtil.colorFromHex('#587f9c');

  //ALERT COLOR
  static final kWarningColor = ColorUtil.colorFromHex('#FACC15');
  static final kWarningColor10 = kWarningColor.withOpacity(.10);
  //static final kWarningColor50 = kWarningColor.withOpacity(.50);

//SUCCESS COLOR
  static final kSuccessColor50 = ColorUtil.colorFromHex('#eaf3ef');
  static final kSuccessColor75 = ColorUtil.colorFromHex('#a7cdbb');
  static final kSuccessColor100 = ColorUtil.colorFromHex('#83b89f');
  static final kSuccessColor200 = ColorUtil.colorFromHex('#4d9976');
  static final kSuccessColor300 = ColorUtil.colorFromHex('#29845a');
  static final kSuccessColor400 = ColorUtil.colorFromHex('#1d5c3f');
  static final kSuccessColor500 = ColorUtil.colorFromHex('#195137');


  static final kErrorColor50 = ColorUtil.colorFromHex('#fce8e6');
  static final kErrorColor75 = ColorUtil.colorFromHex('#f4a296');
  static final kErrorColor100 = ColorUtil.colorFromHex('#f07b6b');
  static final kErrorColor200 = ColorUtil.colorFromHex('#e9432b');
  static final kErrorColor300 = ColorUtil.colorFromHex('#e51c00');
  static final kErrorColor400 = ColorUtil.colorFromHex('#a01400');
  static final kErrorColor500 = ColorUtil.colorFromHex('#8c1100');


  static final kWarningColor50 = ColorUtil.colorFromHex('#fff8e6');
  static final kWarningColor75 = ColorUtil.colorFromHex('#ffe296');
  static final kWarningColor100 = ColorUtil.colorFromHex('#ffd66b');
  static final kWarningColor200 = ColorUtil.colorFromHex('#ffc42b');
  static final kWarningColor300 = ColorUtil.colorFromHex('#ffb800');
  static final kWarningColor400 = ColorUtil.colorFromHex('#b38100');
  static final kWarningColor500 = ColorUtil.colorFromHex('#9c7000');

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
  static final kBottomNavColor = ColorUtil.colorFromHex('#F4F4F4');
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
    primaryColor: kPrimaryColor300,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: kSecondaryColor300),
    textSelectionTheme: TextSelectionThemeData(cursorColor: kPrimaryColor300),
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
